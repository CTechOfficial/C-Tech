TYPE=VIEW
query=select concat(cast(year(now()) as char charset cp850),\'_1_\',cast(year(now()) as char charset cp850)) AS `CODE_TEMPS`,cast(year(now()) as char charset cp850) AS `LIB_TEMPS`,19 AS `ORDRE` union all select concat(`darties1`.`dim_temps`.`ANNEE`,\'_4_\',`darties1`.`dim_temps`.`MOIS`) AS `CONCAT(ANNEE,\'_4_\',MOIS)`,concat(\' \',`darties1`.`dim_temps`.`LIB_MOIS`,\' (\',`darties1`.`dim_temps`.`ANNEE`,\')\') AS `CONCAT(\' \',LIB_MOIS,\' (\',ANNEE,\')\')`,`darties1`.`dim_temps`.`MOIS` AS `MOIS` from `darties1`.`dim_temps` where ((`darties1`.`dim_temps`.`ANNEE` = year(now())) and concat(cast(year(now()) as char charset cp850),lpad(`darties1`.`dim_temps`.`MOIS`,2,0)) in (select distinct `darties1`.`faits_ventes_star`.`ID_TEMPS` from `darties1`.`faits_ventes_star` where (`darties1`.`faits_ventes_star`.`CA_REEL` is not null))) union all select distinct concat(`darties1`.`dim_temps`.`ANNEE`,\'_3_\',`darties1`.`dim_temps`.`TRIMESTRE`) AS `CONCAT(ANNEE,\'_3_\',TRIMESTRE)`,concat(\' Trimestre \',`darties1`.`dim_temps`.`TRIMESTRE`,\' (\',`darties1`.`dim_temps`.`ANNEE`,\')\') AS `CONCAT(\' Trimestre \',TRIMESTRE,\' (\',ANNEE,\')\')`,(12 + `darties1`.`dim_temps`.`TRIMESTRE`) AS `12+TRIMESTRE` from `darties1`.`dim_temps` where ((`darties1`.`dim_temps`.`ANNEE` = year(now())) and (concat(cast(year(now()) as char charset cp850),lpad((((`darties1`.`dim_temps`.`TRIMESTRE` - 1) * 3) + 1),2,0)) in (select distinct `darties1`.`faits_ventes_star`.`ID_TEMPS` from `darties1`.`faits_ventes_star` where (`darties1`.`faits_ventes_star`.`CA_REEL` is not null)) or concat(cast(year(now()) as char charset cp850),lpad((((`darties1`.`dim_temps`.`TRIMESTRE` - 1) * 3) + 2),2,0)) in (select distinct `darties1`.`faits_ventes_star`.`ID_TEMPS` from `darties1`.`faits_ventes_star` where (`darties1`.`faits_ventes_star`.`CA_REEL` is not null)) or concat(cast(year(now()) as char charset cp850),lpad((((`darties1`.`dim_temps`.`TRIMESTRE` - 1) * 3) + 3),2,0)) in (select distinct `darties1`.`faits_ventes_star`.`ID_TEMPS` from `darties1`.`faits_ventes_star` where (`darties1`.`faits_ventes_star`.`CA_REEL` is not null)))) union all select distinct concat(`darties1`.`dim_temps`.`ANNEE`,\'_2_\',`darties1`.`dim_temps`.`SEMESTRE`) AS `CONCAT(ANNEE,\'_2_\',SEMESTRE)`,concat(\' Semestre \',`darties1`.`dim_temps`.`SEMESTRE`,\' (\',`darties1`.`dim_temps`.`ANNEE`,\')\') AS `CONCAT(\' Semestre \',SEMESTRE,\' (\',ANNEE,\')\')`,(16 + `darties1`.`dim_temps`.`SEMESTRE`) AS `16+SEMESTRE` from `darties1`.`dim_temps` where ((`darties1`.`dim_temps`.`ANNEE` = year(now())) and (concat(cast(year(now()) as char charset cp850),lpad((((`darties1`.`dim_temps`.`SEMESTRE` - 1) * 6) + 1),2,0)) in (select distinct `darties1`.`faits_ventes_star`.`ID_TEMPS` from `darties1`.`faits_ventes_star` where (`darties1`.`faits_ventes_star`.`CA_REEL` is not null)) or concat(cast(year(now()) as char charset cp850),lpad((((`darties1`.`dim_temps`.`SEMESTRE` - 1) * 6) + 2),2,0)) in (select distinct `darties1`.`faits_ventes_star`.`ID_TEMPS` from `darties1`.`faits_ventes_star` where (`darties1`.`faits_ventes_star`.`CA_REEL` is not null)) or concat(cast(year(now()) as char charset cp850),lpad((((`darties1`.`dim_temps`.`SEMESTRE` - 1) * 6) + 3),2,0)) in (select distinct `darties1`.`faits_ventes_star`.`ID_TEMPS` from `darties1`.`faits_ventes_star` where (`darties1`.`faits_ventes_star`.`CA_REEL` is not null)) or concat(cast(year(now()) as char charset cp850),lpad((((`darties1`.`dim_temps`.`SEMESTRE` - 1) * 6) + 4),2,0)) in (select distinct `darties1`.`faits_ventes_star`.`ID_TEMPS` from `darties1`.`faits_ventes_star` where (`darties1`.`faits_ventes_star`.`CA_REEL` is not null)) or concat(cast(year(now()) as char charset cp850),lpad((((`darties1`.`dim_temps`.`SEMESTRE` - 1) * 6) + 5),2,0)) in (select distinct `darties1`.`faits_ventes_star`.`ID_TEMPS` from `darties1`.`faits_ventes_star` where (`darties1`.`faits_ventes_star`.`CA_REEL` is not null)) or concat(cast(year(now()) as char charset cp850),lpad((((`darties1`.`dim_temps`.`SEMESTRE` - 1) * 6) + 6),2,0)) in (select distinct `darties1`.`faits_ventes_star`.`ID_TEMPS` from `darties1`.`faits_ventes_star` where (`darties1`.`faits_ventes_star`.`CA_REEL` is not null)))) union all select concat(cast((year(now()) - 1) as char charset cp850),\'_1_\',cast((year(now()) - 1) as char charset cp850)) AS `CODE_TEMPS`,cast((year(now()) - 1) as char charset cp850) AS `LIB_TEMPS`,39 AS `ORDRE` union all select concat(`darties1`.`dim_temps`.`ANNEE`,\'_4_\',`darties1`.`dim_temps`.`MOIS`) AS `CONCAT(ANNEE,\'_4_\',MOIS)`,concat(\' \',`darties1`.`dim_temps`.`LIB_MOIS`,\' (\',`darties1`.`dim_temps`.`ANNEE`,\')\') AS `CONCAT(\' \',LIB_MOIS,\' (\',ANNEE,\')\')`,(20 + `darties1`.`dim_temps`.`MOIS`) AS `20+MOIS` from `darties1`.`dim_temps` where ((`darties1`.`dim_temps`.`ANNEE` = (year(now()) - 1)) and concat(cast((year(now()) - 1) as char charset cp850),lpad(`darties1`.`dim_temps`.`MOIS`,2,0)) in (select distinct `darties1`.`faits_ventes_star`.`ID_TEMPS` from `darties1`.`faits_ventes_star` where (`darties1`.`faits_ventes_star`.`CA_REEL` is not null))) union all select distinct concat(`darties1`.`dim_temps`.`ANNEE`,\'_3_\',`darties1`.`dim_temps`.`TRIMESTRE`) AS `CONCAT(ANNEE,\'_3_\',TRIMESTRE)`,concat(\' Trimestre \',`darties1`.`dim_temps`.`TRIMESTRE`,\' (\',`darties1`.`dim_temps`.`ANNEE`,\')\') AS `CONCAT(\' Trimestre \',TRIMESTRE,\' (\',ANNEE,\')\')`,(32 + `darties1`.`dim_temps`.`TRIMESTRE`) AS `32+TRIMESTRE` from `darties1`.`dim_temps` where ((`darties1`.`dim_temps`.`ANNEE` = (year(now()) - 1)) and (concat(cast((year(now()) - 1) as char charset cp850),lpad((((`darties1`.`dim_temps`.`TRIMESTRE` - 1) * 3) + 1),2,0)) in (select distinct `darties1`.`faits_ventes_star`.`ID_TEMPS` from `darties1`.`faits_ventes_star` where (`darties1`.`faits_ventes_star`.`CA_REEL` is not null)) or concat(cast((year(now()) - 1) as char charset cp850),lpad((((`darties1`.`dim_temps`.`TRIMESTRE` - 1) * 3) + 2),2,0)) in (select distinct `darties1`.`faits_ventes_star`.`ID_TEMPS` from `darties1`.`faits_ventes_star` where (`darties1`.`faits_ventes_star`.`CA_REEL` is not null)) or concat(cast((year(now()) - 1) as char charset cp850),lpad((((`darties1`.`dim_temps`.`TRIMESTRE` - 1) * 3) + 3),2,0)) in (select distinct `darties1`.`faits_ventes_star`.`ID_TEMPS` from `darties1`.`faits_ventes_star` where (`darties1`.`faits_ventes_star`.`CA_REEL` is not null)))) union all select distinct concat(`darties1`.`dim_temps`.`ANNEE`,\'_2_\',`darties1`.`dim_temps`.`SEMESTRE`) AS `CONCAT(ANNEE,\'_2_\',SEMESTRE)`,concat(\' Semestre \',`darties1`.`dim_temps`.`SEMESTRE`,\' (\',`darties1`.`dim_temps`.`ANNEE`,\')\') AS `CONCAT(\' Semestre \',SEMESTRE,\' (\',ANNEE,\')\')`,(36 + `darties1`.`dim_temps`.`SEMESTRE`) AS `36+SEMESTRE` from `darties1`.`dim_temps` where ((`darties1`.`dim_temps`.`ANNEE` = (year(now()) - 1)) and (concat(cast((year(now()) - 1) as char charset cp850),lpad((((`darties1`.`dim_temps`.`SEMESTRE` - 1) * 6) + 1),2,0)) in (select distinct `darties1`.`faits_ventes_star`.`ID_TEMPS` from `darties1`.`faits_ventes_star` where (`darties1`.`faits_ventes_star`.`CA_REEL` is not null)) or concat(cast((year(now()) - 1) as char charset cp850),lpad((((`darties1`.`dim_temps`.`SEMESTRE` - 1) * 6) + 2),2,0)) in (select distinct `darties1`.`faits_ventes_star`.`ID_TEMPS` from `darties1`.`faits_ventes_star` where (`darties1`.`faits_ventes_star`.`CA_REEL` is not null)) or concat(cast((year(now()) - 1) as char charset cp850),lpad((((`darties1`.`dim_temps`.`SEMESTRE` - 1) * 6) + 3),2,0)) in (select distinct `darties1`.`faits_ventes_star`.`ID_TEMPS` from `darties1`.`faits_ventes_star` where (`darties1`.`faits_ventes_star`.`CA_REEL` is not null)) or concat(cast((year(now()) - 1) as char charset cp850),lpad((((`darties1`.`dim_temps`.`SEMESTRE` - 1) * 6) + 4),2,0)) in (select distinct `darties1`.`faits_ventes_star`.`ID_TEMPS` from `darties1`.`faits_ventes_star` where (`darties1`.`faits_ventes_star`.`CA_REEL` is not null)) or concat(cast((year(now()) - 1) as char charset cp850),lpad((((`darties1`.`dim_temps`.`SEMESTRE` - 1) * 6) + 5),2,0)) in (select distinct `darties1`.`faits_ventes_star`.`ID_TEMPS` from `darties1`.`faits_ventes_star` where (`darties1`.`faits_ventes_star`.`CA_REEL` is not null)) or concat(cast((year(now()) - 1) as char charset cp850),lpad((((`darties1`.`dim_temps`.`SEMESTRE` - 1) * 6) + 6),2,0)) in (select distinct `darties1`.`faits_ventes_star`.`ID_TEMPS` from `darties1`.`faits_ventes_star` where (`darties1`.`faits_ventes_star`.`CA_REEL` is not null)))) union all select concat(cast((year(now()) - 2) as char charset cp850),\'_1_\',cast((year(now()) - 2) as char charset cp850)) AS `CODE_TEMPS`,cast((year(now()) - 2) as char charset cp850) AS `LIB_TEMPS`,59 AS `ORDRE` union all select concat(`darties1`.`dim_temps`.`ANNEE`,\'_4_\',`darties1`.`dim_temps`.`MOIS`) AS `CONCAT(ANNEE,\'_4_\',MOIS)`,concat(\' \',`darties1`.`dim_temps`.`LIB_MOIS`,\' (\',`darties1`.`dim_temps`.`ANNEE`,\')\') AS `CONCAT(\' \',LIB_MOIS,\' (\',ANNEE,\')\')`,(40 + `darties1`.`dim_temps`.`MOIS`) AS `40+MOIS` from `darties1`.`dim_temps` where ((`darties1`.`dim_temps`.`ANNEE` = (year(now()) - 2)) and concat(cast((year(now()) - 2) as char charset cp850),lpad(`darties1`.`dim_temps`.`MOIS`,2,0)) in (select distinct `darties1`.`faits_ventes_star`.`ID_TEMPS` from `darties1`.`faits_ventes_star` where (`darties1`.`faits_ventes_star`.`CA_REEL` is not null))) union all select distinct concat(`darties1`.`dim_temps`.`ANNEE`,\'_3_\',`darties1`.`dim_temps`.`TRIMESTRE`) AS `CONCAT(ANNEE,\'_3_\',TRIMESTRE)`,concat(\' Trimestre \',`darties1`.`dim_temps`.`TRIMESTRE`,\' (\',`darties1`.`dim_temps`.`ANNEE`,\')\') AS `CONCAT(\' Trimestre \',TRIMESTRE,\' (\',ANNEE,\')\')`,(52 + `darties1`.`dim_temps`.`TRIMESTRE`) AS `52+TRIMESTRE` from `darties1`.`dim_temps` where ((`darties1`.`dim_temps`.`ANNEE` = (year(now()) - 2)) and (concat(cast((year(now()) - 2) as char charset cp850),lpad((((`darties1`.`dim_temps`.`TRIMESTRE` - 1) * 3) + 1),2,0)) in (select distinct `darties1`.`faits_ventes_star`.`ID_TEMPS` from `darties1`.`faits_ventes_star` where (`darties1`.`faits_ventes_star`.`CA_REEL` is not null)) or concat(cast((year(now()) - 2) as char charset cp850),lpad((((`darties1`.`dim_temps`.`TRIMESTRE` - 1) * 3) + 2),2,0)) in (select distinct `darties1`.`faits_ventes_star`.`ID_TEMPS` from `darties1`.`faits_ventes_star` where (`darties1`.`faits_ventes_star`.`CA_REEL` is not null)) or concat(cast((year(now()) - 2) as char charset cp850),lpad((((`darties1`.`dim_temps`.`TRIMESTRE` - 1) * 3) + 3),2,0)) in (select distinct `darties1`.`faits_ventes_star`.`ID_TEMPS` from `darties1`.`faits_ventes_star` where (`darties1`.`faits_ventes_star`.`CA_REEL` is not null)))) union all select distinct concat(`darties1`.`dim_temps`.`ANNEE`,\'_2_\',`darties1`.`dim_temps`.`SEMESTRE`) AS `CONCAT(ANNEE,\'_2_\',SEMESTRE)`,concat(\' Semestre \',`darties1`.`dim_temps`.`SEMESTRE`,\' (\',`darties1`.`dim_temps`.`ANNEE`,\')\') AS `CONCAT(\' Semestre \',SEMESTRE,\' (\',ANNEE,\')\')`,(56 + `darties1`.`dim_temps`.`SEMESTRE`) AS `56+SEMESTRE` from `darties1`.`dim_temps` where ((`darties1`.`dim_temps`.`ANNEE` = (year(now()) - 2)) and (concat(cast((year(now()) - 2) as char charset cp850),lpad((((`darties1`.`dim_temps`.`SEMESTRE` - 1) * 6) + 1),2,0)) in (select distinct `darties1`.`faits_ventes_star`.`ID_TEMPS` from `darties1`.`faits_ventes_star` where (`darties1`.`faits_ventes_star`.`CA_REEL` is not null)) or concat(cast((year(now()) - 2) as char charset cp850),lpad((((`darties1`.`dim_temps`.`SEMESTRE` - 1) * 6) + 2),2,0)) in (select distinct `darties1`.`faits_ventes_star`.`ID_TEMPS` from `darties1`.`faits_ventes_star` where (`darties1`.`faits_ventes_star`.`CA_REEL` is not null)) or concat(cast((year(now()) - 2) as char charset cp850),lpad((((`darties1`.`dim_temps`.`SEMESTRE` - 1) * 6) + 3),2,0)) in (select distinct `darties1`.`faits_ventes_star`.`ID_TEMPS` from `darties1`.`faits_ventes_star` where (`darties1`.`faits_ventes_star`.`CA_REEL` is not null)) or concat(cast((year(now()) - 2) as char charset cp850),lpad((((`darties1`.`dim_temps`.`SEMESTRE` - 1) * 6) + 4),2,0)) in (select distinct `darties1`.`faits_ventes_star`.`ID_TEMPS` from `darties1`.`faits_ventes_star` where (`darties1`.`faits_ventes_star`.`CA_REEL` is not null)) or concat(cast((year(now()) - 2) as char charset cp850),lpad((((`darties1`.`dim_temps`.`SEMESTRE` - 1) * 6) + 5),2,0)) in (select distinct `darties1`.`faits_ventes_star`.`ID_TEMPS` from `darties1`.`faits_ventes_star` where (`darties1`.`faits_ventes_star`.`CA_REEL` is not null)) or concat(cast((year(now()) - 2) as char charset cp850),lpad((((`darties1`.`dim_temps`.`SEMESTRE` - 1) * 6) + 6),2,0)) in (select distinct `darties1`.`faits_ventes_star`.`ID_TEMPS` from `darties1`.`faits_ventes_star` where (`darties1`.`faits_ventes_star`.`CA_REEL` is not null)))) order by `ORDRE`
md5=332eba2eec377bb202b9917bb1fe356a
updatable=0
algorithm=0
definer_user=darties1
definer_host=localhost
suid=2
with_check_option=0
timestamp=2016-10-07 09:42:47
create-version=1
source=SELECT CONCAT( cast( YEAR( NOW( ) ) AS char ) , \'_1_\', cast( YEAR( NOW( ) ) AS char ) ) AS CODE_TEMPS, cast( YEAR( NOW( ) ) AS char ) AS LIB_TEMPS, 19 AS ORDRE \nUNION ALL\nSELECT CONCAT(ANNEE,\'_4_\',MOIS),CONCAT(\' \',LIB_MOIS,\' (\',ANNEE,\')\'),MOIS from dim_temps \nWHERE ANNEE=YEAR(NOW()) AND CONCAT( cast( YEAR( NOW( ) ) AS char ),lpad(MOIS, 2, 0)) IN (SELECT DISTINCT ID_TEMPS FROM faits_ventes_star where CA_REEL is not null)\nUNION ALL\nSELECT DISTINCT CONCAT(ANNEE,\'_3_\',TRIMESTRE),CONCAT(\' Trimestre \',TRIMESTRE,\' (\',ANNEE,\')\'),12+TRIMESTRE from dim_temps \nWHERE ANNEE=YEAR(NOW()) AND (CONCAT( cast( YEAR( NOW( ) ) AS char ),lpad((TRIMESTRE-1)*3+1, 2, 0)) IN (SELECT DISTINCT ID_TEMPS FROM faits_ventes_star where CA_REEL is not null) \nOR CONCAT( cast( YEAR( NOW( ) ) AS char ),lpad((TRIMESTRE-1)*3+2, 2, 0)) IN (SELECT DISTINCT ID_TEMPS FROM faits_ventes_star where CA_REEL is not null)\nOR CONCAT( cast( YEAR( NOW( ) ) AS char ),lpad((TRIMESTRE-1)*3+3, 2, 0)) IN (SELECT DISTINCT ID_TEMPS FROM faits_ventes_star where CA_REEL is not null)\n)\nUNION ALL\nSELECT DISTINCT CONCAT(ANNEE,\'_2_\',SEMESTRE),CONCAT(\' Semestre \',SEMESTRE,\' (\',ANNEE,\')\'),16+SEMESTRE from dim_temps \nWHERE ANNEE=YEAR(NOW()) AND (CONCAT( cast( YEAR( NOW( ) ) AS char ),lpad((SEMESTRE-1)*6+1, 2, 0)) IN (SELECT DISTINCT ID_TEMPS FROM faits_ventes_star where CA_REEL is not null) \nOR CONCAT( cast( YEAR( NOW( ) ) AS char ),lpad((SEMESTRE-1)*6+2, 2, 0)) IN (SELECT DISTINCT ID_TEMPS FROM faits_ventes_star where CA_REEL is not null)\nOR CONCAT( cast( YEAR( NOW( ) ) AS char ),lpad((SEMESTRE-1)*6+3, 2, 0)) IN (SELECT DISTINCT ID_TEMPS FROM faits_ventes_star where CA_REEL is not null)\nOR CONCAT( cast( YEAR( NOW( ) ) AS char ),lpad((SEMESTRE-1)*6+4, 2, 0)) IN (SELECT DISTINCT ID_TEMPS FROM faits_ventes_star where CA_REEL is not null) \nOR CONCAT( cast( YEAR( NOW( ) ) AS char ),lpad((SEMESTRE-1)*6+5, 2, 0)) IN (SELECT DISTINCT ID_TEMPS FROM faits_ventes_star where CA_REEL is not null)\nOR CONCAT( cast( YEAR( NOW( ) ) AS char ),lpad((SEMESTRE-1)*6+6, 2, 0)) IN (SELECT DISTINCT ID_TEMPS FROM faits_ventes_star where CA_REEL is not null)\n)\nUNION ALL\nSELECT CONCAT( cast( YEAR( NOW( ) )-1 AS char ) , \'_1_\', cast( YEAR( NOW( ) )-1 AS char ) ) AS CODE_TEMPS, cast( YEAR( NOW( ) )-1 AS char ) AS LIB_TEMPS, 39 AS ORDRE \nUNION ALL\nSELECT CONCAT(ANNEE,\'_4_\',MOIS),CONCAT(\' \',LIB_MOIS,\' (\',ANNEE,\')\'),20+MOIS from dim_temps \nWHERE ANNEE=YEAR(NOW())-1 AND CONCAT( cast( YEAR( NOW( ) )-1 AS char ),lpad(MOIS, 2, 0)) IN (SELECT DISTINCT ID_TEMPS FROM faits_ventes_star where CA_REEL is not null)\nUNION ALL\nSELECT DISTINCT CONCAT(ANNEE,\'_3_\',TRIMESTRE),CONCAT(\' Trimestre \',TRIMESTRE,\' (\',ANNEE,\')\'),32+TRIMESTRE from dim_temps \nWHERE ANNEE=YEAR(NOW())-1 AND (CONCAT( cast( YEAR( NOW( ) )-1 AS char ),lpad((TRIMESTRE-1)*3+1, 2, 0)) IN (SELECT DISTINCT ID_TEMPS FROM faits_ventes_star where CA_REEL is not null) \nOR CONCAT( cast( YEAR( NOW( ) )-1 AS char ),lpad((TRIMESTRE-1)*3+2, 2, 0)) IN (SELECT DISTINCT ID_TEMPS FROM faits_ventes_star where CA_REEL is not null)\nOR CONCAT( cast( YEAR( NOW( ) )-1 AS char ),lpad((TRIMESTRE-1)*3+3, 2, 0)) IN (SELECT DISTINCT ID_TEMPS FROM faits_ventes_star where CA_REEL is not null)\n)\nUNION ALL\nSELECT DISTINCT CONCAT(ANNEE,\'_2_\',SEMESTRE),CONCAT(\' Semestre \',SEMESTRE,\' (\',ANNEE,\')\'),36+SEMESTRE from dim_temps \nWHERE ANNEE=YEAR(NOW())-1 AND (CONCAT( cast( YEAR( NOW( ) )-1 AS char ),lpad((SEMESTRE-1)*6+1, 2, 0)) IN (SELECT DISTINCT ID_TEMPS FROM faits_ventes_star where CA_REEL is not null) \nOR CONCAT( cast( YEAR( NOW( ) )-1 AS char ),lpad((SEMESTRE-1)*6+2, 2, 0)) IN (SELECT DISTINCT ID_TEMPS FROM faits_ventes_star where CA_REEL is not null)\nOR CONCAT( cast( YEAR( NOW( ) )-1 AS char ),lpad((SEMESTRE-1)*6+3, 2, 0)) IN (SELECT DISTINCT ID_TEMPS FROM faits_ventes_star where CA_REEL is not null)\nOR CONCAT( cast( YEAR( NOW( ) )-1 AS char ),lpad((SEMESTRE-1)*6+4, 2, 0)) IN (SELECT DISTINCT ID_TEMPS FROM faits_ventes_star where CA_REEL is not null) \nOR CONCAT( cast( YEAR( NOW( ) )-1 AS char ),lpad((SEMESTRE-1)*6+5, 2, 0)) IN (SELECT DISTINCT ID_TEMPS FROM faits_ventes_star where CA_REEL is not null)\nOR CONCAT( cast( YEAR( NOW( ) )-1 AS char ),lpad((SEMESTRE-1)*6+6, 2, 0)) IN (SELECT DISTINCT ID_TEMPS FROM faits_ventes_star where CA_REEL is not null)\n)\nUNION ALL\nSELECT CONCAT( cast( YEAR( NOW( ) )-2 AS char ) , \'_1_\', cast( YEAR( NOW( ) )-2 AS char ) ) AS CODE_TEMPS, cast( YEAR( NOW( ) )-2 AS char ) AS LIB_TEMPS, 59 AS ORDRE \nUNION ALL\nSELECT CONCAT(ANNEE,\'_4_\',MOIS),CONCAT(\' \',LIB_MOIS,\' (\',ANNEE,\')\'),40+MOIS from dim_temps \nWHERE ANNEE=YEAR(NOW())-2 AND CONCAT( cast( YEAR( NOW( ) )-2 AS char ),lpad(MOIS, 2, 0)) IN (SELECT DISTINCT ID_TEMPS FROM faits_ventes_star where CA_REEL is not null)\nUNION ALL\nSELECT DISTINCT CONCAT(ANNEE,\'_3_\',TRIMESTRE),CONCAT(\' Trimestre \',TRIMESTRE,\' (\',ANNEE,\')\'),52+TRIMESTRE from dim_temps \nWHERE ANNEE=YEAR(NOW())-2 AND (CONCAT( cast( YEAR( NOW( ) )-2 AS char ),lpad((TRIMESTRE-1)*3+1, 2, 0)) IN (SELECT DISTINCT ID_TEMPS FROM faits_ventes_star where CA_REEL is not null) \nOR CONCAT( cast( YEAR( NOW( ) )-2 AS char ),lpad((TRIMESTRE-1)*3+2, 2, 0)) IN (SELECT DISTINCT ID_TEMPS FROM faits_ventes_star where CA_REEL is not null)\nOR CONCAT( cast( YEAR( NOW( ) )-2 AS char ),lpad((TRIMESTRE-1)*3+3, 2, 0)) IN (SELECT DISTINCT ID_TEMPS FROM faits_ventes_star where CA_REEL is not null)\n)\nUNION ALL\nSELECT DISTINCT CONCAT(ANNEE,\'_2_\',SEMESTRE),CONCAT(\' Semestre \',SEMESTRE,\' (\',ANNEE,\')\'),56+SEMESTRE from dim_temps \nWHERE ANNEE=YEAR(NOW())-2 AND (CONCAT( cast( YEAR( NOW( ) )-2 AS char ),lpad((SEMESTRE-1)*6+1, 2, 0)) IN (SELECT DISTINCT ID_TEMPS FROM faits_ventes_star where CA_REEL is not null) \nOR CONCAT( cast( YEAR( NOW( ) )-2 AS char ),lpad((SEMESTRE-1)*6+2, 2, 0)) IN (SELECT DISTINCT ID_TEMPS FROM faits_ventes_star where CA_REEL is not null)\nOR CONCAT( cast( YEAR( NOW( ) )-2 AS char ),lpad((SEMESTRE-1)*6+3, 2, 0)) IN (SELECT DISTINCT ID_TEMPS FROM faits_ventes_star where CA_REEL is not null)\nOR CONCAT( cast( YEAR( NOW( ) )-2 AS char ),lpad((SEMESTRE-1)*6+4, 2, 0)) IN (SELECT DISTINCT ID_TEMPS FROM faits_ventes_star where CA_REEL is not null) \nOR CONCAT( cast( YEAR( NOW( ) )-2 AS char ),lpad((SEMESTRE-1)*6+5, 2, 0)) IN (SELECT DISTINCT ID_TEMPS FROM faits_ventes_star where CA_REEL is not null)\nOR CONCAT( cast( YEAR( NOW( ) )-2 AS char ),lpad((SEMESTRE-1)*6+6, 2, 0)) IN (SELECT DISTINCT ID_TEMPS FROM faits_ventes_star where CA_REEL is not null)\n)\nORDER BY 3
client_cs_name=cp850
connection_cl_name=cp850_general_ci
view_body_utf8=select concat(cast(year(now()) as char charset cp850),\'_1_\',cast(year(now()) as char charset cp850)) AS `CODE_TEMPS`,cast(year(now()) as char charset cp850) AS `LIB_TEMPS`,19 AS `ORDRE` union all select concat(`darties1`.`dim_temps`.`ANNEE`,\'_4_\',`darties1`.`dim_temps`.`MOIS`) AS `CONCAT(ANNEE,\'_4_\',MOIS)`,concat(\' \',`darties1`.`dim_temps`.`LIB_MOIS`,\' (\',`darties1`.`dim_temps`.`ANNEE`,\')\') AS `CONCAT(\' \',LIB_MOIS,\' (\',ANNEE,\')\')`,`darties1`.`dim_temps`.`MOIS` AS `MOIS` from `darties1`.`dim_temps` where ((`darties1`.`dim_temps`.`ANNEE` = year(now())) and concat(cast(year(now()) as char charset cp850),lpad(`darties1`.`dim_temps`.`MOIS`,2,0)) in (select distinct `darties1`.`faits_ventes_star`.`ID_TEMPS` from `darties1`.`faits_ventes_star` where (`darties1`.`faits_ventes_star`.`CA_REEL` is not null))) union all select distinct concat(`darties1`.`dim_temps`.`ANNEE`,\'_3_\',`darties1`.`dim_temps`.`TRIMESTRE`) AS `CONCAT(ANNEE,\'_3_\',TRIMESTRE)`,concat(\' Trimestre \',`darties1`.`dim_temps`.`TRIMESTRE`,\' (\',`darties1`.`dim_temps`.`ANNEE`,\')\') AS `CONCAT(\' Trimestre \',TRIMESTRE,\' (\',ANNEE,\')\')`,(12 + `darties1`.`dim_temps`.`TRIMESTRE`) AS `12+TRIMESTRE` from `darties1`.`dim_temps` where ((`darties1`.`dim_temps`.`ANNEE` = year(now())) and (concat(cast(year(now()) as char charset cp850),lpad((((`darties1`.`dim_temps`.`TRIMESTRE` - 1) * 3) + 1),2,0)) in (select distinct `darties1`.`faits_ventes_star`.`ID_TEMPS` from `darties1`.`faits_ventes_star` where (`darties1`.`faits_ventes_star`.`CA_REEL` is not null)) or concat(cast(year(now()) as char charset cp850),lpad((((`darties1`.`dim_temps`.`TRIMESTRE` - 1) * 3) + 2),2,0)) in (select distinct `darties1`.`faits_ventes_star`.`ID_TEMPS` from `darties1`.`faits_ventes_star` where (`darties1`.`faits_ventes_star`.`CA_REEL` is not null)) or concat(cast(year(now()) as char charset cp850),lpad((((`darties1`.`dim_temps`.`TRIMESTRE` - 1) * 3) + 3),2,0)) in (select distinct `darties1`.`faits_ventes_star`.`ID_TEMPS` from `darties1`.`faits_ventes_star` where (`darties1`.`faits_ventes_star`.`CA_REEL` is not null)))) union all select distinct concat(`darties1`.`dim_temps`.`ANNEE`,\'_2_\',`darties1`.`dim_temps`.`SEMESTRE`) AS `CONCAT(ANNEE,\'_2_\',SEMESTRE)`,concat(\' Semestre \',`darties1`.`dim_temps`.`SEMESTRE`,\' (\',`darties1`.`dim_temps`.`ANNEE`,\')\') AS `CONCAT(\' Semestre \',SEMESTRE,\' (\',ANNEE,\')\')`,(16 + `darties1`.`dim_temps`.`SEMESTRE`) AS `16+SEMESTRE` from `darties1`.`dim_temps` where ((`darties1`.`dim_temps`.`ANNEE` = year(now())) and (concat(cast(year(now()) as char charset cp850),lpad((((`darties1`.`dim_temps`.`SEMESTRE` - 1) * 6) + 1),2,0)) in (select distinct `darties1`.`faits_ventes_star`.`ID_TEMPS` from `darties1`.`faits_ventes_star` where (`darties1`.`faits_ventes_star`.`CA_REEL` is not null)) or concat(cast(year(now()) as char charset cp850),lpad((((`darties1`.`dim_temps`.`SEMESTRE` - 1) * 6) + 2),2,0)) in (select distinct `darties1`.`faits_ventes_star`.`ID_TEMPS` from `darties1`.`faits_ventes_star` where (`darties1`.`faits_ventes_star`.`CA_REEL` is not null)) or concat(cast(year(now()) as char charset cp850),lpad((((`darties1`.`dim_temps`.`SEMESTRE` - 1) * 6) + 3),2,0)) in (select distinct `darties1`.`faits_ventes_star`.`ID_TEMPS` from `darties1`.`faits_ventes_star` where (`darties1`.`faits_ventes_star`.`CA_REEL` is not null)) or concat(cast(year(now()) as char charset cp850),lpad((((`darties1`.`dim_temps`.`SEMESTRE` - 1) * 6) + 4),2,0)) in (select distinct `darties1`.`faits_ventes_star`.`ID_TEMPS` from `darties1`.`faits_ventes_star` where (`darties1`.`faits_ventes_star`.`CA_REEL` is not null)) or concat(cast(year(now()) as char charset cp850),lpad((((`darties1`.`dim_temps`.`SEMESTRE` - 1) * 6) + 5),2,0)) in (select distinct `darties1`.`faits_ventes_star`.`ID_TEMPS` from `darties1`.`faits_ventes_star` where (`darties1`.`faits_ventes_star`.`CA_REEL` is not null)) or concat(cast(year(now()) as char charset cp850),lpad((((`darties1`.`dim_temps`.`SEMESTRE` - 1) * 6) + 6),2,0)) in (select distinct `darties1`.`faits_ventes_star`.`ID_TEMPS` from `darties1`.`faits_ventes_star` where (`darties1`.`faits_ventes_star`.`CA_REEL` is not null)))) union all select concat(cast((year(now()) - 1) as char charset cp850),\'_1_\',cast((year(now()) - 1) as char charset cp850)) AS `CODE_TEMPS`,cast((year(now()) - 1) as char charset cp850) AS `LIB_TEMPS`,39 AS `ORDRE` union all select concat(`darties1`.`dim_temps`.`ANNEE`,\'_4_\',`darties1`.`dim_temps`.`MOIS`) AS `CONCAT(ANNEE,\'_4_\',MOIS)`,concat(\' \',`darties1`.`dim_temps`.`LIB_MOIS`,\' (\',`darties1`.`dim_temps`.`ANNEE`,\')\') AS `CONCAT(\' \',LIB_MOIS,\' (\',ANNEE,\')\')`,(20 + `darties1`.`dim_temps`.`MOIS`) AS `20+MOIS` from `darties1`.`dim_temps` where ((`darties1`.`dim_temps`.`ANNEE` = (year(now()) - 1)) and concat(cast((year(now()) - 1) as char charset cp850),lpad(`darties1`.`dim_temps`.`MOIS`,2,0)) in (select distinct `darties1`.`faits_ventes_star`.`ID_TEMPS` from `darties1`.`faits_ventes_star` where (`darties1`.`faits_ventes_star`.`CA_REEL` is not null))) union all select distinct concat(`darties1`.`dim_temps`.`ANNEE`,\'_3_\',`darties1`.`dim_temps`.`TRIMESTRE`) AS `CONCAT(ANNEE,\'_3_\',TRIMESTRE)`,concat(\' Trimestre \',`darties1`.`dim_temps`.`TRIMESTRE`,\' (\',`darties1`.`dim_temps`.`ANNEE`,\')\') AS `CONCAT(\' Trimestre \',TRIMESTRE,\' (\',ANNEE,\')\')`,(32 + `darties1`.`dim_temps`.`TRIMESTRE`) AS `32+TRIMESTRE` from `darties1`.`dim_temps` where ((`darties1`.`dim_temps`.`ANNEE` = (year(now()) - 1)) and (concat(cast((year(now()) - 1) as char charset cp850),lpad((((`darties1`.`dim_temps`.`TRIMESTRE` - 1) * 3) + 1),2,0)) in (select distinct `darties1`.`faits_ventes_star`.`ID_TEMPS` from `darties1`.`faits_ventes_star` where (`darties1`.`faits_ventes_star`.`CA_REEL` is not null)) or concat(cast((year(now()) - 1) as char charset cp850),lpad((((`darties1`.`dim_temps`.`TRIMESTRE` - 1) * 3) + 2),2,0)) in (select distinct `darties1`.`faits_ventes_star`.`ID_TEMPS` from `darties1`.`faits_ventes_star` where (`darties1`.`faits_ventes_star`.`CA_REEL` is not null)) or concat(cast((year(now()) - 1) as char charset cp850),lpad((((`darties1`.`dim_temps`.`TRIMESTRE` - 1) * 3) + 3),2,0)) in (select distinct `darties1`.`faits_ventes_star`.`ID_TEMPS` from `darties1`.`faits_ventes_star` where (`darties1`.`faits_ventes_star`.`CA_REEL` is not null)))) union all select distinct concat(`darties1`.`dim_temps`.`ANNEE`,\'_2_\',`darties1`.`dim_temps`.`SEMESTRE`) AS `CONCAT(ANNEE,\'_2_\',SEMESTRE)`,concat(\' Semestre \',`darties1`.`dim_temps`.`SEMESTRE`,\' (\',`darties1`.`dim_temps`.`ANNEE`,\')\') AS `CONCAT(\' Semestre \',SEMESTRE,\' (\',ANNEE,\')\')`,(36 + `darties1`.`dim_temps`.`SEMESTRE`) AS `36+SEMESTRE` from `darties1`.`dim_temps` where ((`darties1`.`dim_temps`.`ANNEE` = (year(now()) - 1)) and (concat(cast((year(now()) - 1) as char charset cp850),lpad((((`darties1`.`dim_temps`.`SEMESTRE` - 1) * 6) + 1),2,0)) in (select distinct `darties1`.`faits_ventes_star`.`ID_TEMPS` from `darties1`.`faits_ventes_star` where (`darties1`.`faits_ventes_star`.`CA_REEL` is not null)) or concat(cast((year(now()) - 1) as char charset cp850),lpad((((`darties1`.`dim_temps`.`SEMESTRE` - 1) * 6) + 2),2,0)) in (select distinct `darties1`.`faits_ventes_star`.`ID_TEMPS` from `darties1`.`faits_ventes_star` where (`darties1`.`faits_ventes_star`.`CA_REEL` is not null)) or concat(cast((year(now()) - 1) as char charset cp850),lpad((((`darties1`.`dim_temps`.`SEMESTRE` - 1) * 6) + 3),2,0)) in (select distinct `darties1`.`faits_ventes_star`.`ID_TEMPS` from `darties1`.`faits_ventes_star` where (`darties1`.`faits_ventes_star`.`CA_REEL` is not null)) or concat(cast((year(now()) - 1) as char charset cp850),lpad((((`darties1`.`dim_temps`.`SEMESTRE` - 1) * 6) + 4),2,0)) in (select distinct `darties1`.`faits_ventes_star`.`ID_TEMPS` from `darties1`.`faits_ventes_star` where (`darties1`.`faits_ventes_star`.`CA_REEL` is not null)) or concat(cast((year(now()) - 1) as char charset cp850),lpad((((`darties1`.`dim_temps`.`SEMESTRE` - 1) * 6) + 5),2,0)) in (select distinct `darties1`.`faits_ventes_star`.`ID_TEMPS` from `darties1`.`faits_ventes_star` where (`darties1`.`faits_ventes_star`.`CA_REEL` is not null)) or concat(cast((year(now()) - 1) as char charset cp850),lpad((((`darties1`.`dim_temps`.`SEMESTRE` - 1) * 6) + 6),2,0)) in (select distinct `darties1`.`faits_ventes_star`.`ID_TEMPS` from `darties1`.`faits_ventes_star` where (`darties1`.`faits_ventes_star`.`CA_REEL` is not null)))) union all select concat(cast((year(now()) - 2) as char charset cp850),\'_1_\',cast((year(now()) - 2) as char charset cp850)) AS `CODE_TEMPS`,cast((year(now()) - 2) as char charset cp850) AS `LIB_TEMPS`,59 AS `ORDRE` union all select concat(`darties1`.`dim_temps`.`ANNEE`,\'_4_\',`darties1`.`dim_temps`.`MOIS`) AS `CONCAT(ANNEE,\'_4_\',MOIS)`,concat(\' \',`darties1`.`dim_temps`.`LIB_MOIS`,\' (\',`darties1`.`dim_temps`.`ANNEE`,\')\') AS `CONCAT(\' \',LIB_MOIS,\' (\',ANNEE,\')\')`,(40 + `darties1`.`dim_temps`.`MOIS`) AS `40+MOIS` from `darties1`.`dim_temps` where ((`darties1`.`dim_temps`.`ANNEE` = (year(now()) - 2)) and concat(cast((year(now()) - 2) as char charset cp850),lpad(`darties1`.`dim_temps`.`MOIS`,2,0)) in (select distinct `darties1`.`faits_ventes_star`.`ID_TEMPS` from `darties1`.`faits_ventes_star` where (`darties1`.`faits_ventes_star`.`CA_REEL` is not null))) union all select distinct concat(`darties1`.`dim_temps`.`ANNEE`,\'_3_\',`darties1`.`dim_temps`.`TRIMESTRE`) AS `CONCAT(ANNEE,\'_3_\',TRIMESTRE)`,concat(\' Trimestre \',`darties1`.`dim_temps`.`TRIMESTRE`,\' (\',`darties1`.`dim_temps`.`ANNEE`,\')\') AS `CONCAT(\' Trimestre \',TRIMESTRE,\' (\',ANNEE,\')\')`,(52 + `darties1`.`dim_temps`.`TRIMESTRE`) AS `52+TRIMESTRE` from `darties1`.`dim_temps` where ((`darties1`.`dim_temps`.`ANNEE` = (year(now()) - 2)) and (concat(cast((year(now()) - 2) as char charset cp850),lpad((((`darties1`.`dim_temps`.`TRIMESTRE` - 1) * 3) + 1),2,0)) in (select distinct `darties1`.`faits_ventes_star`.`ID_TEMPS` from `darties1`.`faits_ventes_star` where (`darties1`.`faits_ventes_star`.`CA_REEL` is not null)) or concat(cast((year(now()) - 2) as char charset cp850),lpad((((`darties1`.`dim_temps`.`TRIMESTRE` - 1) * 3) + 2),2,0)) in (select distinct `darties1`.`faits_ventes_star`.`ID_TEMPS` from `darties1`.`faits_ventes_star` where (`darties1`.`faits_ventes_star`.`CA_REEL` is not null)) or concat(cast((year(now()) - 2) as char charset cp850),lpad((((`darties1`.`dim_temps`.`TRIMESTRE` - 1) * 3) + 3),2,0)) in (select distinct `darties1`.`faits_ventes_star`.`ID_TEMPS` from `darties1`.`faits_ventes_star` where (`darties1`.`faits_ventes_star`.`CA_REEL` is not null)))) union all select distinct concat(`darties1`.`dim_temps`.`ANNEE`,\'_2_\',`darties1`.`dim_temps`.`SEMESTRE`) AS `CONCAT(ANNEE,\'_2_\',SEMESTRE)`,concat(\' Semestre \',`darties1`.`dim_temps`.`SEMESTRE`,\' (\',`darties1`.`dim_temps`.`ANNEE`,\')\') AS `CONCAT(\' Semestre \',SEMESTRE,\' (\',ANNEE,\')\')`,(56 + `darties1`.`dim_temps`.`SEMESTRE`) AS `56+SEMESTRE` from `darties1`.`dim_temps` where ((`darties1`.`dim_temps`.`ANNEE` = (year(now()) - 2)) and (concat(cast((year(now()) - 2) as char charset cp850),lpad((((`darties1`.`dim_temps`.`SEMESTRE` - 1) * 6) + 1),2,0)) in (select distinct `darties1`.`faits_ventes_star`.`ID_TEMPS` from `darties1`.`faits_ventes_star` where (`darties1`.`faits_ventes_star`.`CA_REEL` is not null)) or concat(cast((year(now()) - 2) as char charset cp850),lpad((((`darties1`.`dim_temps`.`SEMESTRE` - 1) * 6) + 2),2,0)) in (select distinct `darties1`.`faits_ventes_star`.`ID_TEMPS` from `darties1`.`faits_ventes_star` where (`darties1`.`faits_ventes_star`.`CA_REEL` is not null)) or concat(cast((year(now()) - 2) as char charset cp850),lpad((((`darties1`.`dim_temps`.`SEMESTRE` - 1) * 6) + 3),2,0)) in (select distinct `darties1`.`faits_ventes_star`.`ID_TEMPS` from `darties1`.`faits_ventes_star` where (`darties1`.`faits_ventes_star`.`CA_REEL` is not null)) or concat(cast((year(now()) - 2) as char charset cp850),lpad((((`darties1`.`dim_temps`.`SEMESTRE` - 1) * 6) + 4),2,0)) in (select distinct `darties1`.`faits_ventes_star`.`ID_TEMPS` from `darties1`.`faits_ventes_star` where (`darties1`.`faits_ventes_star`.`CA_REEL` is not null)) or concat(cast((year(now()) - 2) as char charset cp850),lpad((((`darties1`.`dim_temps`.`SEMESTRE` - 1) * 6) + 5),2,0)) in (select distinct `darties1`.`faits_ventes_star`.`ID_TEMPS` from `darties1`.`faits_ventes_star` where (`darties1`.`faits_ventes_star`.`CA_REEL` is not null)) or concat(cast((year(now()) - 2) as char charset cp850),lpad((((`darties1`.`dim_temps`.`SEMESTRE` - 1) * 6) + 6),2,0)) in (select distinct `darties1`.`faits_ventes_star`.`ID_TEMPS` from `darties1`.`faits_ventes_star` where (`darties1`.`faits_ventes_star`.`CA_REEL` is not null)))) order by `ORDRE`
