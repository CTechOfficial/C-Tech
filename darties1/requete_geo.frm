TYPE=VIEW
query=select 0 AS `CODE`,`darties1`.`dim_magasin`.`ID_MAGASIN` AS `ID_MAGASIN` from `darties1`.`dim_magasin` union select (`darties1`.`dim_geographique_com`.`ID_REGION_COM` * 100) AS `dim_geographique_com.ID_REGION_COM*100`,`darties1`.`dim_magasin`.`ID_MAGASIN` AS `ID_MAGASIN` from `darties1`.`dim_geographique_com` join `darties1`.`dim_magasin` join `darties1`.`dim_departement` where ((`darties1`.`dim_magasin`.`DEP` = `darties1`.`dim_departement`.`ID_DEPARTEMENT`) and (`darties1`.`dim_geographique_com`.`ID_REGION_COM` = `darties1`.`dim_departement`.`ID_REGION_COM`)) union select ((`darties1`.`dim_departement`.`ID_REGION_COM` * 100) + `darties1`.`dim_magasin`.`ID_MAGASIN`) AS `CODE`,`darties1`.`dim_magasin`.`ID_MAGASIN` AS `ID_MAGASIN` from `darties1`.`dim_geographique_com` join `darties1`.`dim_magasin` join `darties1`.`dim_departement` where ((`darties1`.`dim_magasin`.`DEP` = `darties1`.`dim_departement`.`ID_DEPARTEMENT`) and (`darties1`.`dim_geographique_com`.`ID_REGION_COM` = `darties1`.`dim_departement`.`ID_REGION_COM`)) union select ((`darties1`.`dim_geographique_admin`.`ID_REGION_ADMIN` + 9) * 100) AS `CODE`,`darties1`.`dim_magasin`.`ID_MAGASIN` AS `ID_MAGASIN` from `darties1`.`dim_geographique_admin` join `darties1`.`dim_departement` join `darties1`.`dim_magasin` where ((`darties1`.`dim_magasin`.`DEP` = `darties1`.`dim_departement`.`ID_DEPARTEMENT`) and (`darties1`.`dim_geographique_admin`.`ID_REGION_ADMIN` = `darties1`.`dim_departement`.`ID_REGION_ADMIN1`) and (`darties1`.`dim_geographique_admin`.`ID_REGION_ADMIN` < 23)) union select (((`darties1`.`dim_geographique_admin`.`ID_REGION_ADMIN` + 9) * 100) + `darties1`.`dim_magasin`.`ID_MAGASIN`) AS `CODE`,`darties1`.`dim_magasin`.`ID_MAGASIN` AS `ID_MAGASIN` from `darties1`.`dim_geographique_admin` join `darties1`.`dim_departement` join `darties1`.`dim_magasin` where ((`darties1`.`dim_magasin`.`DEP` = `darties1`.`dim_departement`.`ID_DEPARTEMENT`) and (`darties1`.`dim_geographique_admin`.`ID_REGION_ADMIN` = `darties1`.`dim_departement`.`ID_REGION_ADMIN1`) and (`darties1`.`dim_geographique_admin`.`ID_REGION_ADMIN` < 23)) union select ((`darties1`.`dim_geographique_admin`.`ID_REGION_ADMIN` + 9) * 100) AS `CODE`,`darties1`.`dim_magasin`.`ID_MAGASIN` AS `ID_MAGASIN` from `darties1`.`dim_geographique_admin` join `darties1`.`dim_departement` join `darties1`.`dim_magasin` where ((`darties1`.`dim_magasin`.`DEP` = `darties1`.`dim_departement`.`ID_DEPARTEMENT`) and (`darties1`.`dim_geographique_admin`.`ID_REGION_ADMIN` = `darties1`.`dim_departement`.`ID_REGION_ADMIN2`) and (`darties1`.`dim_geographique_admin`.`ID_REGION_ADMIN` >= 23)) union select (((`darties1`.`dim_geographique_admin`.`ID_REGION_ADMIN` + 9) * 100) + `darties1`.`dim_magasin`.`ID_MAGASIN`) AS `CODE`,`darties1`.`dim_magasin`.`ID_MAGASIN` AS `ID_MAGASIN` from `darties1`.`dim_geographique_admin` join `darties1`.`dim_departement` join `darties1`.`dim_magasin` where ((`darties1`.`dim_magasin`.`DEP` = `darties1`.`dim_departement`.`ID_DEPARTEMENT`) and (`darties1`.`dim_geographique_admin`.`ID_REGION_ADMIN` = `darties1`.`dim_departement`.`ID_REGION_ADMIN2`) and (`darties1`.`dim_geographique_admin`.`ID_REGION_ADMIN` >= 23)) order by `CODE`
md5=b5080cd709ffdb147be966211c573b9d
updatable=0
algorithm=0
definer_user=darties1
definer_host=localhost
suid=2
with_check_option=0
timestamp=2016-10-07 09:42:46
create-version=1
source=SELECT 0 AS CODE,ID_MAGASIN FROM dim_magasin\nUNION\nSELECT dim_geographique_com.ID_REGION_COM*100,ID_MAGASIN FROM dim_geographique_com,dim_magasin, dim_departement\nWHERE dim_magasin.DEP=dim_departement.ID_DEPARTEMENT AND dim_geographique_com.ID_REGION_COM=dim_departement.ID_REGION_COM\nUNION\nSELECT dim_departement.ID_REGION_COM*100+ID_MAGASIN as CODE, ID_MAGASIN\nFROM dim_geographique_com,dim_magasin, dim_departement\nWHERE dim_magasin.DEP=dim_departement.ID_DEPARTEMENT AND dim_geographique_com.ID_REGION_COM=dim_departement.ID_REGION_COM\nUNION\nSELECT (DIM_GEOGRAPHIQUE_ADMIN.ID_REGION_ADMIN+9)*100 as CODE,ID_MAGASIN\nFROM dim_geographique_admin,dim_departement,dim_magasin\nWHERE dim_magasin.DEP=dim_departement.ID_DEPARTEMENT AND dim_geographique_admin.ID_REGION_ADMIN=dim_departement.ID_REGION_ADMIN1\nAND dim_geographique_admin.ID_REGION_ADMIN<23\nUNION\nSELECT (dim_geographique_admin.ID_REGION_ADMIN+9)*100+ID_MAGASIN as CODE,ID_MAGASIN\nFROM dim_geographique_admin,dim_departement,dim_magasin\nWHERE dim_magasin.DEP=dim_departement.ID_DEPARTEMENT AND dim_geographique_admin.ID_REGION_ADMIN=dim_departement.ID_REGION_ADMIN1\nAND dim_geographique_admin.ID_REGION_ADMIN<23\nUNION\nSELECT (dim_geographique_admin.ID_REGION_ADMIN+9)*100 as CODE, ID_MAGASIN\nFROM dim_geographique_admin,dim_departement,dim_magasin\nWHERE dim_magasin.DEP=dim_departement.ID_DEPARTEMENT AND dim_geographique_admin.ID_REGION_ADMIN=dim_departement.ID_REGION_ADMIN2\nAND dim_geographique_admin.ID_REGION_ADMIN>=23\nUNION\nSELECT (dim_geographique_admin.ID_REGION_ADMIN+9)*100+ID_MAGASIN as CODE, ID_MAGASIN\nFROM dim_geographique_admin,dim_departement,dim_magasin\nWHERE dim_magasin.DEP=dim_departement.ID_DEPARTEMENT AND dim_geographique_admin.ID_REGION_ADMIN=dim_departement.ID_REGION_ADMIN2\nAND dim_geographique_admin.ID_REGION_ADMIN>=23\nORDER BY 1
client_cs_name=cp850
connection_cl_name=cp850_general_ci
view_body_utf8=select 0 AS `CODE`,`darties1`.`dim_magasin`.`ID_MAGASIN` AS `ID_MAGASIN` from `darties1`.`dim_magasin` union select (`darties1`.`dim_geographique_com`.`ID_REGION_COM` * 100) AS `dim_geographique_com.ID_REGION_COM*100`,`darties1`.`dim_magasin`.`ID_MAGASIN` AS `ID_MAGASIN` from `darties1`.`dim_geographique_com` join `darties1`.`dim_magasin` join `darties1`.`dim_departement` where ((`darties1`.`dim_magasin`.`DEP` = `darties1`.`dim_departement`.`ID_DEPARTEMENT`) and (`darties1`.`dim_geographique_com`.`ID_REGION_COM` = `darties1`.`dim_departement`.`ID_REGION_COM`)) union select ((`darties1`.`dim_departement`.`ID_REGION_COM` * 100) + `darties1`.`dim_magasin`.`ID_MAGASIN`) AS `CODE`,`darties1`.`dim_magasin`.`ID_MAGASIN` AS `ID_MAGASIN` from `darties1`.`dim_geographique_com` join `darties1`.`dim_magasin` join `darties1`.`dim_departement` where ((`darties1`.`dim_magasin`.`DEP` = `darties1`.`dim_departement`.`ID_DEPARTEMENT`) and (`darties1`.`dim_geographique_com`.`ID_REGION_COM` = `darties1`.`dim_departement`.`ID_REGION_COM`)) union select ((`darties1`.`dim_geographique_admin`.`ID_REGION_ADMIN` + 9) * 100) AS `CODE`,`darties1`.`dim_magasin`.`ID_MAGASIN` AS `ID_MAGASIN` from `darties1`.`dim_geographique_admin` join `darties1`.`dim_departement` join `darties1`.`dim_magasin` where ((`darties1`.`dim_magasin`.`DEP` = `darties1`.`dim_departement`.`ID_DEPARTEMENT`) and (`darties1`.`dim_geographique_admin`.`ID_REGION_ADMIN` = `darties1`.`dim_departement`.`ID_REGION_ADMIN1`) and (`darties1`.`dim_geographique_admin`.`ID_REGION_ADMIN` < 23)) union select (((`darties1`.`dim_geographique_admin`.`ID_REGION_ADMIN` + 9) * 100) + `darties1`.`dim_magasin`.`ID_MAGASIN`) AS `CODE`,`darties1`.`dim_magasin`.`ID_MAGASIN` AS `ID_MAGASIN` from `darties1`.`dim_geographique_admin` join `darties1`.`dim_departement` join `darties1`.`dim_magasin` where ((`darties1`.`dim_magasin`.`DEP` = `darties1`.`dim_departement`.`ID_DEPARTEMENT`) and (`darties1`.`dim_geographique_admin`.`ID_REGION_ADMIN` = `darties1`.`dim_departement`.`ID_REGION_ADMIN1`) and (`darties1`.`dim_geographique_admin`.`ID_REGION_ADMIN` < 23)) union select ((`darties1`.`dim_geographique_admin`.`ID_REGION_ADMIN` + 9) * 100) AS `CODE`,`darties1`.`dim_magasin`.`ID_MAGASIN` AS `ID_MAGASIN` from `darties1`.`dim_geographique_admin` join `darties1`.`dim_departement` join `darties1`.`dim_magasin` where ((`darties1`.`dim_magasin`.`DEP` = `darties1`.`dim_departement`.`ID_DEPARTEMENT`) and (`darties1`.`dim_geographique_admin`.`ID_REGION_ADMIN` = `darties1`.`dim_departement`.`ID_REGION_ADMIN2`) and (`darties1`.`dim_geographique_admin`.`ID_REGION_ADMIN` >= 23)) union select (((`darties1`.`dim_geographique_admin`.`ID_REGION_ADMIN` + 9) * 100) + `darties1`.`dim_magasin`.`ID_MAGASIN`) AS `CODE`,`darties1`.`dim_magasin`.`ID_MAGASIN` AS `ID_MAGASIN` from `darties1`.`dim_geographique_admin` join `darties1`.`dim_departement` join `darties1`.`dim_magasin` where ((`darties1`.`dim_magasin`.`DEP` = `darties1`.`dim_departement`.`ID_DEPARTEMENT`) and (`darties1`.`dim_geographique_admin`.`ID_REGION_ADMIN` = `darties1`.`dim_departement`.`ID_REGION_ADMIN2`) and (`darties1`.`dim_geographique_admin`.`ID_REGION_ADMIN` >= 23)) order by `CODE`
