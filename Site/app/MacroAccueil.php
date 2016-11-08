<?php

namespace App;
use \Goutte\Client;

class MacroAccueil extends Model {

	public static function call($params = array())
	{

		$app = App::getInstance();
		$db = ORM::get_db();

		$region = $params['I_REGION'];
		$enseigne = $params['I_ENSEIGNE'];
		$temps = $params['I_TEMPS'];
		$user = $_COOKIE['USER_ID'];

		$sql = "DROP TABLE IF EXISTS accueil_transi".$user;
		$db->exec($sql);
		$sql = "DROP TABLE IF EXISTS Accueil_CA".$user;
		$db->exec($sql);
		$sql = "DROP TABLE IF EXISTS Accueil_VE".$user;
		$db->exec($sql);
		$sql = "DROP TABLE IF EXISTS Accueil_MA".$user;
		$db->exec($sql);
		$sql = "DROP TABLE IF EXISTS Accueil".$user;
		$db->exec($sql);
		$sql = "DROP TABLE IF EXISTS Accueil2".$user;
		$db->exec($sql);


		/* Filtrage selon la valeur des invites */
		$sql = "CREATE TEMPORARY TABLE accueil_transi".$user." as
		SELECT * from data_0
		WHERE id_enseigne in(select id_enseigne from requete_enseigne where code_enseigne =" .$enseigne.")
		AND id_temps in(select id_temps from requete_temps_0 where code = ".$temps.")
		AND id_magasin in(select id_magasin from requete_geo where code = ".$region.")";
		$db->exec($sql);

		/* Tableau dédié aux valeurs de chiffre d'affaire */


		$sql = "CREATE TEMPORARY TABLE Accueil_CA".$user." as
		SELECT t3.LIB_FAMILLE_PRODUIT, (SUM(OBJECTIF)) AS 'CA budgeté' , (SUM(REEL)) AS 'CA Reel'
		FROM DIM_MAGASIN_STAR t1, accueil_transi".$user." t2, DIM_FAMILLE_PRODUIT t3
		WHERE (t1.ID_MAGASIN = t2.ID_MAGASIN AND t2.ID_FAMILLE_PRODUIT = t3.ID_FAMILLE_PRODUIT AND INDICATEUR= 'CA')
		GROUP BY t3.LIB_FAMILLE_PRODUIT;";
		$db->exec($sql);

		/* Tableau dédié aux ventes */

		$sql = "CREATE TEMPORARY TABLE Accueil_VE".$user." as
		SELECT t3.LIB_FAMILLE_PRODUIT, (SUM(OBJECTIF)) AS 'Ventes budgetées', (SUM(REEL))  AS 'Ventes réelles'
		FROM DIM_MAGASIN_STAR t1, accueil_transi".$user." t2, DIM_FAMILLE_PRODUIT t3
		WHERE (t1.ID_MAGASIN = t2.ID_MAGASIN AND t2.ID_FAMILLE_PRODUIT = t3.ID_FAMILLE_PRODUIT AND INDICATEUR='VENTES')
		GROUP BY t3.LIB_FAMILLE_PRODUIT;";
		$db->exec($sql);

		/* Tableau dédié aux valeurs de marge */

		$sql = "CREATE TEMPORARY TABLE Accueil_MA".$user." as
		SELECT t3.LIB_FAMILLE_PRODUIT,  (AVG(OBJECTIF))  AS 'Marge budgetée', (AVG(REEL)) AS 'Marge réelle'
		FROM DIM_MAGASIN_STAR t1, accueil_transi".$user." t2, DIM_FAMILLE_PRODUIT t3
		WHERE (t1.ID_MAGASIN = t2.ID_MAGASIN AND t2.ID_FAMILLE_PRODUIT = t3.ID_FAMILLE_PRODUIT AND INDICATEUR='MARGE')
		GROUP BY t3.LIB_FAMILLE_PRODUIT;";
		$db->exec($sql);

		/* Rassemblement des 3 tableaux précédents */

		$sql = "CREATE TEMPORARY TABLE Accueil".$user." as
		Select t1.lib_famille_produit, t1.CA_Reel, t1.CA_Objectif,  t2.Ventes_Reel, t2.Ventes_Objectif, t3.Marge_Reel,t3.Marge_Objectif
		from Accueil_CA".$user." t1, Accueil_VE".$user." t2, Accueil_MA".$user." t3
		where t1.Lib_famille_produit=t2.Lib_famille_produit and t1.Lib_famille_produit=t3.lib_famille_produit
		;";
		$db->exec($sql);

		/* Ajout d'une ligne de total */

		$sql = "CREATE TEMPORARY TABLE Accueil2".$user." as
		select * from transi_accueil".$user."
		Union all
		select 'Total' as Total,
		sum(CA_Reel) as CA_Reel,
		sum(CA_Objectif) as CA_Objectif,
		sum(Ventes_Reel) as Ventes_Reel,
		sum(Ventes_Objectif) as Ventes_Objectif,
		sum(Marge_Reel) as Marge_Reel,
		sum(Marge_Objectif) as Marge_Objectif
		from Accueil".$user.";";
		$db->exec($sql);
		$data = ORM::for_table('Accueil'.$user)->find_array();
		$table = $app->view()->render("/macro/accueil/table.html", array('data' => $data));
		return $table;
	}
}
?>
