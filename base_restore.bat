chcp 1251
rem Удалить в чистоя базе текущий сессии ТСД !!!
cpdb database --srvr sitec-app01.sitec.corp --user sa --pwd assa@2022 restore --db wms_test01 --bak-path c:\backup\wms_test01_clear_090920ds22.bak --create-db --shrink-db --db-owner sa --db-recovery SIMPLE 
