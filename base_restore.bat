chcp 1251
cpdb database --srvr sitec-app01.sitec.corp --user sa --pwd assa@2022 restore --db wms_test01 --bak-path c:\backup\wms_test01_clear_XXX31082022.bak --create-db --shrink-db --db-owner sa --db-recovery SIMPLE 
