chcp 1251
copy VAParams_orig.json VAParams.json

nhrt.exe -spt:"000" -t:"%1" VAParams.json
nhrt.exe -spt:"� ������ �� �����" -t:"� �������� ���������" VAParams.json
nhrt.exe -spt:"���� �� ���������" -t:"C:\\Work\\WMS\\�����������_����04.epf\" VAParams.json

rem ��������� ���� ������� ������ �����������
rem ����� ������������ ����������� �������� � ����

"C:\Program Files\1cv8\8.3.21.1393\bin\1cv8c" /N"" /TestManager "/WS http://sitec-app01.sitec.corp/wms_testmanager" /Execute "C:\Work\Vanessa\vanessa-automation-single\vanessa-automation-single.epf" ";" /C"StartFeaturePlayer;QuietInstallVanessaExt;VAParams=VAParams.json"
