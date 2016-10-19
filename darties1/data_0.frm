TYPE=VIEW
query=select `select_temps`.`CODE_TEMPS` AS `CODE_TEMPS`,`select_temps`.`LIB_TEMPS` AS `LIB_TEMPS`,`select_temps`.`ORDRE` AS `ORDRE`,`requete_temps_0`.`CODE` AS `CODE`,`darties1`.`data`.`ID_MAGASIN` AS `ID_MAGASIN`,`darties1`.`data`.`ID_FAMILLE_PRODUIT` AS `ID_FAMILLE_PRODUIT`,`darties1`.`data`.`ID_TEMPS` AS `ID_TEMPS`,`darties1`.`data`.`INDICATEUR` AS `INDICATEUR`,`darties1`.`data`.`OBJECTIF` AS `OBJECTIF`,`darties1`.`data`.`REEL` AS `REEL`,`darties1`.`data`.`DATE_MAJ` AS `DATE_MAJ`,`darties1`.`data`.`LIB_FAMILLE_PRODUIT` AS `LIB_FAMILLE_PRODUIT`,`darties1`.`data`.`DATEMAJ_FAMPROD` AS `DATEMAJ_FAMPROD`,`darties1`.`data`.`ID_ENSEIGNE` AS `ID_ENSEIGNE`,`darties1`.`data`.`ACTIF` AS `ACTIF`,`darties1`.`data`.`DATE_OUVERTURE` AS `DATE_OUVERTURE`,`darties1`.`data`.`DATE_FERMETURE` AS `DATE_FERMETURE`,`darties1`.`data`.`DATE_MAJ_MAG` AS `DATE_MAJ_MAG`,`darties1`.`data`.`EMPLACEMENTS` AS `EMPLACEMENTS`,`darties1`.`data`.`NB_CAISSES` AS `NB_CAISSES`,`darties1`.`data`.`VILLE` AS `VILLE`,`darties1`.`data`.`DEP` AS `DEP`,`darties1`.`data`.`FICHIER_IMAGE_CARTE_MAGASIN` AS `FICHIER_IMAGE_CARTE_MAGASIN`,`darties1`.`data`.`ONGLET` AS `ONGLET`,`darties1`.`data`.`DATEMAJ_SECURITE` AS `DATEMAJ_SECURITE`,`darties1`.`data`.`ID_PROFIL` AS `ID_PROFIL`,`darties1`.`data`.`LIB_PROFIL` AS `LIB_PROFIL`,`darties1`.`data`.`TYPE_ZONE` AS `TYPE_ZONE`,`darties1`.`data`.`ID_ZONE` AS `ID_ZONE`,`darties1`.`data`.`USERNAME_BO` AS `USERNAME_BO`,`darties1`.`data`.`PASSWORD_BO` AS `PASSWORD_BO`,`darties1`.`data`.`DATEMAJ_PROFIL` AS `DATEMAJ_PROFIL`,`darties1`.`data`.`ID` AS `ID`,`darties1`.`data`.`NOM` AS `NOM`,`darties1`.`data`.`PRENOM` AS `PRENOM`,`darties1`.`data`.`USERNAME` AS `USERNAME`,`darties1`.`data`.`PASSWORD` AS `PASSWORD`,`darties1`.`data`.`MAIL` AS `MAIL`,`darties1`.`data`.`DATEMAJ_USER` AS `DATEMAJ_USER`,`darties1`.`data`.`LIB_ENSEIGNE` AS `LIB_ENSEIGNE`,`darties1`.`data`.`FICHIER_IMAGE_LOGO_ENSEIGNE` AS `FICHIER_IMAGE_LOGO_ENSEIGNE`,`darties1`.`data`.`DATEMAJ_ENSEIGNE` AS `DATEMAJ_ENSEIGNE`,`darties1`.`data`.`ID_DEPARTEMENT` AS `ID_DEPARTEMENT`,`darties1`.`data`.`CODE_DEPARTEMENT` AS `CODE_DEPARTEMENT`,`darties1`.`data`.`LIB_DEPARTEMENT` AS `LIB_DEPARTEMENT`,`darties1`.`data`.`ID_REGION_ADMIN1` AS `ID_REGION_ADMIN1`,`darties1`.`data`.`ID_REGION_ADMIN2` AS `ID_REGION_ADMIN2`,`darties1`.`data`.`ID_REGION_COM` AS `ID_REGION_COM`,`darties1`.`data`.`DATEMAJ_DEP` AS `DATEMAJ_DEP`,substr(`darties1`.`data`.`ID_TEMPS`,1,4) AS `ANNEE`,substr(`darties1`.`data`.`ID_TEMPS`,5,2) AS `MOIS`,(case `darties1`.`data`.`INDICATEUR` when \'CA\' then 1 when \'VENTES\' then 2 when \'MARGE\' then 3 else 0 end) AS `id_i` from ((`darties1`.`select_temps` join `darties1`.`requete_temps_0` on((`select_temps`.`CODE_TEMPS` = `requete_temps_0`.`CODE`))) join `darties1`.`data` on((`darties1`.`data`.`ID_TEMPS` = convert(`requete_temps_0`.`ID_TEMPS` using utf8))))
md5=82d64e21823573bbb7f0cebe2959cf9a
updatable=1
algorithm=0
definer_user=darties1
definer_host=localhost
suid=2
with_check_option=0
timestamp=2016-10-07 09:44:50
create-version=1
source=SELECT \nselect_temps.CODE_TEMPS, \nselect_temps.LIB_TEMPS, \nselect_temps.ORDRE,\nrequete_temps_0.CODE, \ndata.ID_MAGASIN, \ndata.ID_FAMILLE_PRODUIT,\ndata.ID_TEMPS, \ndata.INDICATEUR, \ndata.OBJECTIF, \ndata.REEL, \ndata.DATE_MAJ,\ndata.LIB_FAMILLE_PRODUIT, \ndata.DATEMAJ_FAMPROD, \ndata.ID_ENSEIGNE, \ndata.ACTIF,\ndata.DATE_OUVERTURE, \ndata.DATE_FERMETURE, \ndata.DATE_MAJ_MAG, \ndata.EMPLACEMENTS, \ndata.NB_CAISSES,\ndata.VILLE, \ndata.DEP, \ndata.FICHIER_IMAGE_CARTE_MAGASIN, \ndata.ONGLET, \ndata.DATEMAJ_SECURITE,\ndata.ID_PROFIL, \ndata.LIB_PROFIL, \ndata.TYPE_ZONE, \ndata.ID_ZONE, \ndata.USERNAME_BO,\ndata.PASSWORD_BO, \ndata.DATEMAJ_PROFIL, \ndata.ID, \ndata.NOM, \ndata.PRENOM, \ndata.USERNAME,\ndata.PASSWORD, \ndata.MAIL, \ndata.DATEMAJ_USER, \ndata.LIB_ENSEIGNE,\ndata.FICHIER_IMAGE_LOGO_ENSEIGNE, \ndata.DATEMAJ_ENSEIGNE, \ndata.ID_DEPARTEMENT,\ndata.CODE_DEPARTEMENT, \ndata.LIB_DEPARTEMENT, \ndata.ID_REGION_ADMIN1, \ndata.ID_REGION_ADMIN2,\ndata.ID_REGION_COM, \ndata.DATEMAJ_DEP,\nSUBSTR(data.ID_TEMPS,1,4) AS ANNEE,\nSUBSTR(data.ID_TEMPS,5,2) AS MOIS,\nCASE INDICATEUR\nWHEN \'CA\' THEN 1\nWHEN \'VENTES\' THEN 2\nWHEN \'MARGE\' THEN 3\nELSE 0\nEND AS id_i\nFROM select_temps\nINNER JOIN requete_temps_0 ON select_temps.CODE_TEMPS=requete_temps_0.code\nINNER JOIN data ON data.ID_TEMPS=requete_temps_0.ID_TEMPS
client_cs_name=cp850
connection_cl_name=cp850_general_ci
view_body_utf8=select `select_temps`.`CODE_TEMPS` AS `CODE_TEMPS`,`select_temps`.`LIB_TEMPS` AS `LIB_TEMPS`,`select_temps`.`ORDRE` AS `ORDRE`,`requete_temps_0`.`CODE` AS `CODE`,`darties1`.`data`.`ID_MAGASIN` AS `ID_MAGASIN`,`darties1`.`data`.`ID_FAMILLE_PRODUIT` AS `ID_FAMILLE_PRODUIT`,`darties1`.`data`.`ID_TEMPS` AS `ID_TEMPS`,`darties1`.`data`.`INDICATEUR` AS `INDICATEUR`,`darties1`.`data`.`OBJECTIF` AS `OBJECTIF`,`darties1`.`data`.`REEL` AS `REEL`,`darties1`.`data`.`DATE_MAJ` AS `DATE_MAJ`,`darties1`.`data`.`LIB_FAMILLE_PRODUIT` AS `LIB_FAMILLE_PRODUIT`,`darties1`.`data`.`DATEMAJ_FAMPROD` AS `DATEMAJ_FAMPROD`,`darties1`.`data`.`ID_ENSEIGNE` AS `ID_ENSEIGNE`,`darties1`.`data`.`ACTIF` AS `ACTIF`,`darties1`.`data`.`DATE_OUVERTURE` AS `DATE_OUVERTURE`,`darties1`.`data`.`DATE_FERMETURE` AS `DATE_FERMETURE`,`darties1`.`data`.`DATE_MAJ_MAG` AS `DATE_MAJ_MAG`,`darties1`.`data`.`EMPLACEMENTS` AS `EMPLACEMENTS`,`darties1`.`data`.`NB_CAISSES` AS `NB_CAISSES`,`darties1`.`data`.`VILLE` AS `VILLE`,`darties1`.`data`.`DEP` AS `DEP`,`darties1`.`data`.`FICHIER_IMAGE_CARTE_MAGASIN` AS `FICHIER_IMAGE_CARTE_MAGASIN`,`darties1`.`data`.`ONGLET` AS `ONGLET`,`darties1`.`data`.`DATEMAJ_SECURITE` AS `DATEMAJ_SECURITE`,`darties1`.`data`.`ID_PROFIL` AS `ID_PROFIL`,`darties1`.`data`.`LIB_PROFIL` AS `LIB_PROFIL`,`darties1`.`data`.`TYPE_ZONE` AS `TYPE_ZONE`,`darties1`.`data`.`ID_ZONE` AS `ID_ZONE`,`darties1`.`data`.`USERNAME_BO` AS `USERNAME_BO`,`darties1`.`data`.`PASSWORD_BO` AS `PASSWORD_BO`,`darties1`.`data`.`DATEMAJ_PROFIL` AS `DATEMAJ_PROFIL`,`darties1`.`data`.`ID` AS `ID`,`darties1`.`data`.`NOM` AS `NOM`,`darties1`.`data`.`PRENOM` AS `PRENOM`,`darties1`.`data`.`USERNAME` AS `USERNAME`,`darties1`.`data`.`PASSWORD` AS `PASSWORD`,`darties1`.`data`.`MAIL` AS `MAIL`,`darties1`.`data`.`DATEMAJ_USER` AS `DATEMAJ_USER`,`darties1`.`data`.`LIB_ENSEIGNE` AS `LIB_ENSEIGNE`,`darties1`.`data`.`FICHIER_IMAGE_LOGO_ENSEIGNE` AS `FICHIER_IMAGE_LOGO_ENSEIGNE`,`darties1`.`data`.`DATEMAJ_ENSEIGNE` AS `DATEMAJ_ENSEIGNE`,`darties1`.`data`.`ID_DEPARTEMENT` AS `ID_DEPARTEMENT`,`darties1`.`data`.`CODE_DEPARTEMENT` AS `CODE_DEPARTEMENT`,`darties1`.`data`.`LIB_DEPARTEMENT` AS `LIB_DEPARTEMENT`,`darties1`.`data`.`ID_REGION_ADMIN1` AS `ID_REGION_ADMIN1`,`darties1`.`data`.`ID_REGION_ADMIN2` AS `ID_REGION_ADMIN2`,`darties1`.`data`.`ID_REGION_COM` AS `ID_REGION_COM`,`darties1`.`data`.`DATEMAJ_DEP` AS `DATEMAJ_DEP`,substr(`darties1`.`data`.`ID_TEMPS`,1,4) AS `ANNEE`,substr(`darties1`.`data`.`ID_TEMPS`,5,2) AS `MOIS`,(case `darties1`.`data`.`INDICATEUR` when \'CA\' then 1 when \'VENTES\' then 2 when \'MARGE\' then 3 else 0 end) AS `id_i` from ((`darties1`.`select_temps` join `darties1`.`requete_temps_0` on((`select_temps`.`CODE_TEMPS` = `requete_temps_0`.`CODE`))) join `darties1`.`data` on((`darties1`.`data`.`ID_TEMPS` = convert(`requete_temps_0`.`ID_TEMPS` using utf8))))
