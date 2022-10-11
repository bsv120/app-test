cp VAParams_orig.json VAParams.json

sed -i "s/000/${1}/g" VAParams.json
sed -i "s/Я ничего не делаю/Я размещаю контейнер/g" VAParams.json
sed -i "s/Путь до эмулятора/\/home\/bsv\/Work\/WMS\/ЭмуляторТСД_Тест05.epf\\\/g" VAParams.json

for (( i=1; i <= 50; i++ ))
do
echo $(date "+%D %T") "Loop step is $i"
#/opt/1cv8/x86_64/8.3.21.1393/1cv8c /TestManager "/S sitec-app01.sitec.corp\wms_testmanager" /Execute vanessa-automation-single.epf ";" /C "StartFeaturePlayer;QuietInstallVanessaExt;VAParams=VAParams.json"
/opt/1cv8/x86_64/8.3.21.1393/1cv8c /TestManager "/WS http://sitec-app01.sitec.corp/wms_testmanager" /Execute vanessa-automation-single.epf ";" /C "StartFeaturePlayer;QuietInstallVanessaExt;VAParams=VAParams.json"
done
