<?php

namespace App;

define('_', dirname(__DIR__));
require _.'/vendor/autoload.php';
require _.'/app/_config.php';


date_default_timezone_set('Europe/Paris');

$app = new App($slimConf);
ORM::configure($idiormConf);

// Enregistre une nouvelle fonction Twig pour appeller facilement les methodes statiques d'une classe
$urlPath = array_filter(explode('/', rtrim(parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH), '/')));

$app->user = User::loadFromCookie();

$app->get('/token/:user&:mdp', function($user,$mdp) use ($app){
	echo json_encode(token($user,$mdp));
});

$app->get('/password/:token&:newPassword', function($token,$newPassword) use($app){
  updatePasseword($token, $newPassword);
	echo "Password Set";
});

$app->get('/user/:token', function($token) use($app) {
  echo json_encode(getUser($token));
});
$app->get('/profil/:token', function($token) use($app){
  echo json_encode(getProfil($token));
});
$app->get('/select_temps/:token', function($token) use($app){
	foreach(getSelect_temps($token) as $line)
		echo json_encode($line);
});

$app->get('/AccueilDM/:token&:code_select_temps&:code_select_cumul&:code_select_indicateur', function($token,$code_select_temps, $code_select_cumul, $code_select_indicateur) use($app){
  echo getTableauAcceuilDM($token,$code_select_temps, $code_select_cumul, $code_select_indicateur);
});



function getID($user){
	$id = json_encode(ORM::for_table('utilisateur')->select('ID')->where('MAIL',$user)->find_array());
	$id = explode(':',$id);
	$id = explode('"',$id[1]);
	return $id[1];
}

function token($user,$mdp){
	$app = App::getInstance();
	if(isUser(getID($user),$mdp)){
		$var =  bin2hex(openssl_random_pseudo_bytes(16));
		$app->setcookie("USER_TOKEN",$var,time()+1800);
		return $var;
	}else{
		$var = "Erreur vous n'&ecirc;tes pas un utilisateur enregistr&eacute;!!!";
		return $var;
	}
}

function updatePasseword($token, $newPassword){
	$app = App::getInstance();
	if($token === $app->getCookie('USER_TOKEN')){
		$update = User::find_one($app->getCookie('USER_ID'));
		$update->set('PASSWORD',$newPassword);
		$update->save();
	}else{
		return "Erreur";
	}
}

function getUser($token){
	$app = App::getInstance();
	if($token === $app->getCookie('USER_TOKEN'))
	return ORM::for_table('utilisateur')->where('id',$app->getCookie('USER_ID'))->find_array();
}

function getProfilID($token){
	$app = App::getInstance();
	if($token === $app->getCookie('USER_TOKEN')){
	 $id = json_encode(ORM::for_table('utilisateur')->select('id_profil')->where('id',$app->getCookie('USER_ID'))->find_array());
	 $id = explode(':',$id);
 	 $id = explode('"',$id[1]);
 	return $id[1];
 	}
}

function getProfil($token){
	$app = App::getInstance();
	if($token === $app->getCookie('USER_TOKEN'))
	return ORM::for_table('profil')->where('id_profil',getProfilID($token))->find_array();
}

function getSelect_temps($token){
	$app = App::getInstance();
	if($token === $app->getCookie('USER_TOKEN'))
		return ORM::for_table('select_temps')->find_array();
}

function getTableauAcceuilDM($token,$code_select_temps, $code_select_cumul, $code_select_indicateur ){
	//$code_select_temps 2015_1_2015
	//$code_select_cumul 0||1
	//$code_select_indicateur 1 || 2 || 3
	$app = App::getInstance();
	if($token === $app->getCookie('USER_TOKEN')){

		//Recupération zone_geographique
	$select_ville_for_zone_geo = json_encode(ORM::for_table('data_0')->select('VILLE')->where('ID_PROFIL',$app->getCookie('USER_ID'))->find_array());
	$select_ville_for_zone_geo = explode(':',$select_ville_for_zone_geo);
	$select_ville_for_zone_geo = explode('"',$select_ville_for_zone_geo[1]);


	$code_select_zone_geo = json_encode(ORM::for_table('select_zone_geo')->select('CODE')->where('LIBELLE',$select_ville_for_zone_geo[1])->find_array());
	//Directeur magasin n'est directeur que d'un magasin sinon ERREUR
	$code_select_zone_geo = explode(':',$code_select_zone_geo);
	$code_select_zone_geo = explode('"',$code_select_zone_geo[1]);

		$id_magasin = json_encode(ORM::for_table('securite')->select('id_magasin')->where('id_profil',$app->getCookie('USER_ID'))->find_array());
		$id_magasin = explode(':',$id_magasin);
		$id_magasin = explode('"',$id_magasin[1]);

		$id_enseigne = json_encode(ORM::for_table('dim_magasin')->select('id_enseigne')->where('id_magasin',$id_magasin[1])->find_array());
		$id_enseigne = explode(':',$id_enseigne);
		$id_enseigne = explode('"',$id_enseigne[1]);

		$code_select_enseigne = $id_enseigne[1];

		$code_select_devise = 1;
		$code_select_cours = 1;
		$array = array('I_TEMPS'=>$code_select_temps,'I_CUMUL'=>$code_select_cumul,'I_INDICATEUR'=>$code_select_indicateur,
				'I_REGION'=>$code_select_zone_geo[1],'I_DEVISE'=>$code_select_devise,'I_COURS'=>$code_select_cours,'I_ENSEIGNE'=>$code_select_enseigne);

		return MacroAccueil::call($array);
	}
}

function isUser($user,$mdp){
	$testUser = ORM::for_table('utilisateur')->where('id',$user)->where('PASSWORD',$mdp)->find_one();
	if($testUser === false){
		return false;}
		else {
		return true;
	}

}

// Run app
$app->run();
?>
