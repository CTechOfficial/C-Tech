<?php

namespace App;

class MacroHistorique extends Model {

	public static function call($params = array()) {

		$app = App::getInstance();
		$db = ORM::get_db();

		$indicateur = $params['I_INDICATEUR'];
		$famProd = $params['I_FAMPROD'];
		$enseigne = $params['I_ENSEIGNE'];
		$temps = $params['I_TEMPS'];
		$region = $params['I_REGION'];
		$user = $_COOKIE['USER_ID'];

		$sql = "DROP TABLE IF EXISTS histo_transi".$user;
		$db->exec($sql);
		$sql = "DROP TABLE IF EXISTS histo_transi1".$user;
		$db->exec($sql);
		$sql = "DROP TABLE IF EXISTS histo_transi_cumul".$user;
		$db->exec($sql);
		$sql = "DROP TABLE IF EXISTS histo_transi2".$user;
		$db->exec($sql);
		$sql = "DROP TABLE IF EXISTS histo_transi_prec".$user;
		$db->exec($sql);
		$sql = "DROP TABLE IF EXISTS histo_transi3".$user;
		$db->exec($sql);
		$sql = "DROP TABLE IF EXISTS histo_transi_cumul_prec".$user;
		$db->exec($sql);
		$sql = "DROP TABLE IF EXISTS histo_transi4".$user;
		$db->exec($sql);
		$sql = "DROP TABLE IF EXISTS HISTORIQUE1".$user;
		$db->exec($sql);

		/* TABLEAU HISTORIQUE */

		/* Valeurs sans cumul */
		$sql = "CREATE TEMPORARY TABLE histo_transi".$user." as
		SELECT * from data_1
		where id_i in( select CODE from select_indicateur where CODE= '".$indicateur."')
		AND id_famille_produit in(select id_famille_produit from REQUETE_FAMILLE where CODE_FAMILLE = '".$famProd."')
		AND id_enseigne in(select id_enseigne from requete_enseigne where code_enseigne= '".$enseigne."')
		AND id_temps in(select id_temps from requete_temps_1 where CODE = '".$temps."')
		AND id_magasin in(select id_magasin from requete_geo where code = '".$region."')";
		$db->exec($sql);

		$sql = "CREATE TEMPORARY TABLE histo_transi1".$user." as
		SELECT t2.LIB_FAMILLE_PRODUIT ,  sum(OBJECTIF) AS 'SUM_of_VENTES_OBJECTIF', sum(REEL) AS 'SUM_of_VENTES_REEL',
		(sum(REEL) - sum(OBJECTIF)) / sum(OBJECTIF) * 100 AS 'Ecart_ventes'
		FROM DIM_MAGASIN_STAR t1, histo_transi".$user." t2
		WHERE (t1.ID_MAGASIN = t2.ID_MAGASIN)
		GROUP BY t2.LIB_FAMILLE_PRODUIT;";
		$db->exec($sql);

		$sql = "CREATE TEMPORARY TABLE histo_transi_cumul".$user." as
		SELECT * from data_0
		where id_i in( select CODE from select_indicateur where CODE='".$indicateur."')
		AND id_famille_produit in(select id_famille_produit from REQUETE_FAMILLE where CODE_FAMILLE =" .$famProd.")
		AND id_enseigne in(select id_enseigne from requete_enseigne where code_enseigne= '".$enseigne."')
		AND id_temps in(select id_temps from requete_temps_0 where code= '".$temps."')
		AND id_magasin in(select id_magasin from requete_geo where code = '".$region."')";
		$db->exec($sql);

		$sql = "CREATE TEMPORARY TABLE histo_transi2".$user." as
		SELECT t2.LIB_FAMILLE_PRODUIT ,  sum(OBJECTIF) AS 'SUM_of_VENTES_OBJECTIF_cumul', sum(REEL) AS 'SUM_of_VENTES_REEL_cumul',
		(sum(REEL) - sum(OBJECTIF)) / sum(OBJECTIF) * 100 AS 'Ecart_ventes_cumul'
		FROM DIM_MAGASIN_STAR t1, histo_transi".$user." t2
		WHERE (t1.ID_MAGASIN = t2.ID_MAGASIN)
		GROUP BY t2.LIB_FAMILLE_PRODUIT;";
		$db->exec($sql);
/*
$sql = "CREATE TEMPORARY TABLE histo_transi_prec".$user." as
SELECT * from data_0
where id_i in( select CODE from select_indicateur where CODE='".$indicateur."')
AND id_famille_produit in(select id_famille_produit from REQUETE_FAMILLE where CODE_FAMILLE = '".$famProd."')
AND id_enseigne in(select id_enseigne from requete_enseigne where code_enseigne= '".$enseigne."')
AND id_temps in(select id_temps from requete_temps_0 where code= case when length('".$temps."')
< 10 then put(input(substr('".$temps."',0,4),4.)-1,4.) || substr('".$temps."',5)
else put(input(substr('".$temps."',0,4),4.)-1,4.) || substr('".$temps."',5,3) || put(input(substr('".$temps."',8),4.)-1,4.)
end )
AND id_magasin in(select id_magasin from requete_geo where code = '".$region."')
;";
$db->exec($sql);
*/
		$sql = "CREATE TEMPORARY TABLE histo_transi_prec".$user." as
		SELECT * from data_0
		where id_i in( select CODE from select_indicateur where CODE='".$indicateur."')
		AND id_famille_produit in(select id_famille_produit from REQUETE_FAMILLE where CODE_FAMILLE = '".$famProd."')
		AND id_enseigne in(select id_enseigne from requete_enseigne where code_enseigne= '".$enseigne."')
		AND id_temps in(select id_temps from requete_temps_0 where code= '".$temps."')
		AND id_magasin in(select id_magasin from requete_geo where code = '".$region."')
		;";
		$db->exec($sql);
/*
		$sql = "CREATE TEMPORARY TABLE histo_transi3".$user." as
		SELECT t2.LIB_FAMILLE_PRODUIT AS 'Famille de produit',  sum(OBJECTIF) AS 'Données budgetées N-1', sum(REEL) AS 'Données réelles N-1',
		(sum(REEL) - sum(OBJECTIF)) / sum(OBJECTIF) * 100 AS 'écart N-1 Objectif/Réel'
		FROM DIM_MAGASIN_STAR t1, histo_transi_prec".$user." t2
		WHERE (t1.ID_MAGASIN = t2.ID_MAGASIN)
		GROUP BY t2.LIB_FAMILLE_PRODUIT;";
		$db->exec($sql);
		*/
		$sql = "CREATE TEMPORARY TABLE histo_transi3".$user." as
		SELECT t2.LIB_FAMILLE_PRODUIT ,
		sum(OBJECTIF) AS 'SUM_of_VENTES_OBJECTIF_prec',
		sum(REEL) AS 'SUM_of_VENTES_REEL_prec',
		(sum(REEL) - sum(OBJECTIF)) / sum(OBJECTIF) * 100 AS 'Ecart_ventes_prec'
		FROM DIM_MAGASIN_STAR t1, histo_transi_prec".$user." t2
		WHERE (t1.ID_MAGASIN = t2.ID_MAGASIN)
		GROUP BY t2.LIB_FAMILLE_PRODUIT;";
		$db->exec($sql);

/*
$sql = "CREATE TEMPORARY TABLE histo_transi_cumul_prec".$user." as
SELECT * from data_0
where id_i in( select CODE from select_indicateur where CODE='".$indicateur."')
AND id_famille_produit in(select id_famille_produit from REQUETE_FAMILLE where CODE_FAMILLE =" .$famProd.")
AND id_enseigne in(select id_enseigne from requete_enseigne where code_enseigne= '".$enseigne."')
select id_temps from requete_temps_0 where CODE= select id_temps from requete_temps_0 where code= case when length('".$temps."')
< 10 then put(input(substr('".$temps."',0,4),4.)-1,4.) || substr('".$temps."',5)
else put(input(substr('".$temps."',0,4),4.)-1,4.) || substr('".$temps."',5,3) || put(input(substr('".$temps."',8),4.)-1,4.)
end )
AND id_magasin in(select id_magasin from requete_geo where code = '".$region."')";
$db->exec($sql);
*/
		$sql = "CREATE TEMPORARY TABLE histo_transi_cumul_prec".$user." as
		SELECT * from data_0
		where id_i in( select CODE from select_indicateur where CODE='".$indicateur."')
		AND id_famille_produit in(select id_famille_produit from REQUETE_FAMILLE where CODE_FAMILLE =" .$famProd.")
		AND id_enseigne in(select id_enseigne from requete_enseigne where code_enseigne= '".$enseigne."')
		AND id_temps in (select id_temps from requete_temps_0 where CODE = '".$temps."')
		AND id_magasin in ( select id_magasin from requete_geo where code = '".$region."');";
		$db->exec($sql);

		$sql = "CREATE TEMPORARY TABLE histo_transi4".$user." as
		SELECT t2.LIB_FAMILLE_PRODUIT ,  sum(OBJECTIF) AS 'SUM_of_VENTES_OBJECTIF_cum2', sum(REEL) AS 'SUM_of_VENTES_REEL_cum2',
		(sum(REEL) - sum(OBJECTIF)) / sum(OBJECTIF) * 100 AS 'Ecart_ventes_cum2'
		FROM DIM_MAGASIN_STAR t1, histo_transi_cumul_prec".$user." t2
		WHERE (t1.ID_MAGASIN = t2.ID_MAGASIN)
		GROUP BY t2.LIB_FAMILLE_PRODUIT;";
		$db->exec($sql);

		/* Récupération des libellé de la valeur des différentes invites
		A FAIRE
		*/

		/* Consitution du tableau final */

		$sql = "CREATE TEMPORARY TABLE HISTORIQUE1".$user." as
		SELECT t5.LIB_FAMILLE_PRODUIT,
		t3.SUM_of_VENTES_OBJECTIF_prec,
		t3.SUM_of_VENTES_REEL_prec,
		t3.Ecart_ventes_prec,
		t4.SUM_of_VENTES_OBJECTIF_cum2,
		t4.SUM_of_VENTES_REEL_cum2,
		t4.Ecart_ventes_cum2,
		t1.SUM_of_VENTES_OBJECTIF,
		t1.SUM_of_VENTES_REEL,
		t1.Ecart_ventes,
		t2.SUM_of_VENTES_OBJECTIF_cumul,
		t2.SUM_of_VENTES_REEL_cumul,
		t2.Ecart_ventes_cumul
		FROM histo_transi1".$user." t1, histo_transi2".$user." t2, histo_transi3".$user." t3, histo_transi4".$user." t4, DIM_FAMILLE_PRODUIT t5
		WHERE (t1.LIB_FAMILLE_PRODUIT=t2.LIB_FAMILLE_PRODUIT
		AND t2.LIB_FAMILLE_PRODUIT = t3.LIB_FAMILLE_PRODUIT
		AND t3.LIB_FAMILLE_PRODUIT=t4.LIB_FAMILLE_PRODUIT
		AND t4.LIB_FAMILLE_PRODUIT=t5.LIB_FAMILLE_PRODUIT)
		ORDER BY t5.LIB_FAMILLE_PRODUIT;";
		$db->exec($sql);

		$sql = "CREATE TEMPORARY TABLE HISTORIQUE2".$user." AS SELECT * FROM HISTORIQUE1".$user.";";
		$db->exec($sql);

		$sql = "CREATE TEMPORARY TABLE HISTORIQUEFinal".$user." as
		select * from HISTORIQUE1".$user."
		Union All
		select 'Total' as Total,
		/* Données année N-1 non cumulées */
		sum(SUM_of_VENTES_OBJECTIF_prec) as SUM_of_VENTES_OBJECTIF_prec,
		sum(SUM_of_VENTES_REEL_prec) as SUM_of_VENTES_REEL_prec,
		((sum(SUM_of_VENTES_REEL_prec)-sum(SUM_of_VENTES_OBJECTIF_prec))/sum(SUM_of_VENTES_OBJECTIF_prec)) as Ecart_ventes_prec,

		/* Données année N-1 cumulées */
		sum(SUM_of_VENTES_OBJECTIF_cum2) as SUM_of_VENTES_OBJECTIF_cum2,
		sum(SUM_of_VENTES_REEL_cum2) as SUM_of_VENTES_REEL_cum2,
		((sum(SUM_of_VENTES_REEL_cum2)-sum(SUM_of_VENTES_OBJECTIF_cum2))/sum(SUM_of_VENTES_OBJECTIF_cum2)) as Ecart_ventes_cum2,

		/* Données année N non cumulées */
		sum(SUM_of_VENTES_OBJECTIF) as SUM_of_VENTES_OBJECTIF,
		sum(SUM_of_VENTES_REEL) as SUM_of_VENTES_REEL,
		((sum(SUM_of_VENTES_REEL)-sum(SUM_of_VENTES_OBJECTIF))/sum(SUM_of_VENTES_OBJECTIF)) as Ecart_ventes,

		/* Données année N cumulées */
		sum(SUM_of_VENTES_OBJECTIF_cumul) as SUM_of_VENTES_OBJECTIF_cumul,
		sum(SUM_of_VENTES_REEL_cumul) as SUM_of_VENTES_REEL_cumul,
		((sum(SUM_of_VENTES_REEL_cumul)-sum(SUM_of_VENTES_OBJECTIF_cumul))/sum(SUM_of_VENTES_OBJECTIF_cumul)) as Ecart_ventes_cumul

		from HISTORIQUE2".$user."
		;";
		$db->exec($sql);
		$data = ORM::for_table('HISTORIQUEFinal'.$user)->find_array();
		$table = $app->view()->render("/macro/historique/table.html", array('data' => $data));
		return $table;
 	}
}
 ?>
