TYPE=VIEW
query=select 0 AS `CODE_ENSEIGNE`,`darties1`.`dim_enseigne`.`ID_ENSEIGNE` AS `ID_ENSEIGNE` from `darties1`.`dim_enseigne` union all select `darties1`.`dim_enseigne`.`ID_ENSEIGNE` AS `CODE_ENSEIGNE`,`darties1`.`dim_enseigne`.`ID_ENSEIGNE` AS `ID_ENSEIGNE` from `darties1`.`dim_enseigne`
md5=ec7deb3bc0cad3cc9ae5d049e4334145
updatable=0
algorithm=0
definer_user=darties1
definer_host=localhost
suid=2
with_check_option=0
timestamp=2016-10-07 09:42:46
create-version=1
source=SELECT 0 AS CODE_ENSEIGNE, ID_ENSEIGNE\nFROM dim_enseigne\nUNION ALL\nSELECT dim_enseigne.ID_ENSEIGNE as CODE_ENSEIGNE, dim_enseigne.ID_ENSEIGNE\nFROM dim_enseigne
client_cs_name=cp850
connection_cl_name=cp850_general_ci
view_body_utf8=select 0 AS `CODE_ENSEIGNE`,`darties1`.`dim_enseigne`.`ID_ENSEIGNE` AS `ID_ENSEIGNE` from `darties1`.`dim_enseigne` union all select `darties1`.`dim_enseigne`.`ID_ENSEIGNE` AS `CODE_ENSEIGNE`,`darties1`.`dim_enseigne`.`ID_ENSEIGNE` AS `ID_ENSEIGNE` from `darties1`.`dim_enseigne`