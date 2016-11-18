<?php

namespace App;
use \Goutte\Client;

class MacroAccueil extends Model {

	public static function call($params = array()){
		$app = App::getInstance();
		$db = ORM::get_db();

		$region = $params['I_REGION'];
		$enseigne = $params['I_ENSEIGNE'];
		$temps = $params['I_TEMPS'];
		$user = $_COOKIE['USER_ID'];

		if($params['I_CUMUL']==1){
			$cumul = 'data_0';
			$requete_temps = 'requete_temps_0';
		}else if($params['I_CUMUL']==0){
			$cumul = 'data_1';
			$requete_temps = 'requete_temps_1';
		}else{
			$cumul = 'data_0';
			$requete_temps = 'requete_temps_0';
		}

		$sql = "DROP TABLE IF EXISTS transi".$user;
		$db->exec($sql);
		$sql = "DROP TABLE IF EXISTS Accueil_CA".$user;
		$db->exec($sql);
		$sql = "DROP TABLE IF EXISTS Accueil_VE".$user;
		$db->exec($sql);
		$sql = "DROP TABLE IF EXISTS Accueil_MA".$user;
		$db->exec($sql);
		$sql = "DROP TABLE IF EXISTS transi_accueil".$user;
		$db->exec($sql);
		$sql = "DROP TABLE IF EXISTS Accueil".$user;
		$db->exec($sql);

		$sql = "CREATE TEMPORARY TABLE transi".$user." as
		SELECT * from ".$cumul."
		WHERE id_enseigne in(select id_enseigne from requete_enseigne where code_enseigne='".$enseigne."')
		AND id_temps in(select id_temps from ".$requete_temps." where code='".$temps."')
		AND id_magasin in(select id_magasin from requete_geo where code ='".$region."')";
		$db->exec($sql);

		$sql = "CREATE TEMPORARY TABLE Accueil_CA".$user." AS
		SELECT t3.LIB_FAMILLE_PRODUIT,(SUM(OBJECTIF)) AS CA_Objectif,(SUM(REEL)) AS CA_Reel
		FROM DIM_MAGASIN_STAR t1, transi".$user." t2, DIM_FAMILLE_PRODUIT t3
		WHERE (t1.ID_MAGASIN = t2.ID_MAGASIN AND t2.ID_FAMILLE_PRODUIT = t3.ID_FAMILLE_PRODUIT AND INDICATEUR='CA')
		GROUP BY t3.LIB_FAMILLE_PRODUIT";
		$db->exec($sql);

		$sql = "CREATE TEMPORARY TABLE Accueil_VE".$user." AS
		SELECT t3.LIB_FAMILLE_PRODUIT,(SUM(OBJECTIF))AS Ventes_Objectif,
		(SUM(REEL)) AS Ventes_Reel
		FROM DIM_MAGASIN_STAR t1, transi".$user." t2, DIM_FAMILLE_PRODUIT t3
		WHERE (t1.ID_MAGASIN = t2.ID_MAGASIN AND t2.ID_FAMILLE_PRODUIT = t3.ID_FAMILLE_PRODUIT AND INDICATEUR='VENTES')
		GROUP BY t3.LIB_FAMILLE_PRODUIT";
		$db->exec($sql);

		$sql = "CREATE TEMPORARY TABLE Accueil_MA".$user." AS
		SELECT t3.LIB_FAMILLE_PRODUIT,(SUM(OBJECTIF)) AS Marge_Objectif,(SUM(REEL)) AS Marge_Reel
		FROM DIM_MAGASIN_STAR t1, transi".$user." t2, DIM_FAMILLE_PRODUIT t3
		WHERE (t1.ID_MAGASIN = t2.ID_MAGASIN AND t2.ID_FAMILLE_PRODUIT = t3.ID_FAMILLE_PRODUIT AND INDICATEUR='MARGE')
		GROUP BY t3.LIB_FAMILLE_PRODUIT";
		$db->exec($sql);

		$sql = "Create TEMPORARY table transi_accueil".$user." as
		Select t1.lib_famille_produit, t1.CA_Reel, t1.CA_Objectif,  t2.Ventes_Reel, t2.Ventes_Objectif, t3.Marge_Reel,t3.Marge_Objectif
		from Accueil_CA".$user." t1, Accueil_VE".$user." t2, Accueil_MA".$user." t3
		where t1.Lib_famille_produit=t2.Lib_famille_produit and t1.Lib_famille_produit=t3.lib_famille_produit";
		$db->exec($sql);

		$sql = "Create TEMPORARY table transi_accueil2".$user." as
		Select t1.lib_famille_produit, t1.CA_Reel, t1.CA_Objectif,  t2.Ventes_Reel, t2.Ventes_Objectif, t3.Marge_Reel,t3.Marge_Objectif
		from Accueil_CA".$user." t1, Accueil_VE".$user." t2, Accueil_MA".$user." t3
		where t1.Lib_famille_produit=t2.Lib_famille_produit and t1.Lib_famille_produit=t3.lib_famille_produit";
		$db->exec($sql);

		$sql = "CREATE TEMPORARY TABLE Accueil".$user." as
		select * from transi_accueil".$user."
		Union all
		select 'Total' as Total,
		sum(CA_Reel) as CA_Reel,
		sum(CA_Objectif) as CA_Objectif,
		sum(Ventes_Reel) as Ventes_Reel,
		sum(Ventes_Objectif) as Ventes_Objectif,
		sum(Marge_Reel) as Marge_Reel,
		sum(Marge_Objectif) as Marge_Objectif
		from transi_accueil2".$user."";
		$db->exec($sql);

		$data = ORM::for_table('Accueil'.$user)->find_array();
		$table = $app->view()->render("/macro/accueil/table.html", array('data' => $data));
		return $table;
	}
}
?>
