cp VAParams_orig.json VAParams.json

sed -i "s/000/${1}/g" VAParams.json
sed -i "s/� ������ �� �����/� �������� �������/g" VAParams.json
sed -i "s/���� �� ���������/\/home\/bsv\/Work\/WMS\/�����������_����02.epf\\\/g" VAParams.json

/opt/1cv8/x86_64/8.3.21.1393/1cv8c /TestManager "/S sitec-app01.sitec.corp\wms_testmanager" /Execute vanessa-automation-single.epf ";" /C "StartFeaturePlayer;QuietInstallVanessaExt;VAParams=VAParams.json"
