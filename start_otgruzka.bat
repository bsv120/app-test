chcp 1251
copy VAParams_orig.json VAParams.json

nhrt.exe -spt:"000" -t:"%1" VAParams_otgruzka.json
nhrt.exe -spt:"� ������ �� �����" -t:"� �������� ���������" VAParams.json
nhrt.exe -spt:"���� �� ���������" -t:"C:\\Work\\WMS\\�����������_����02.epf\" VAParams.json


rem ��������� ���� ������� ������ �����������
rem ����� ������������ ����������� �������� � ����

for /l %%x in (1, 1, 50) do (
	"C:\Program Files\1cv8\8.3.21.1393\bin\1cv8c" /N"" /TestManager "/S sitec-app01.sitec.corp\wms_testmanager" /Execute "C:\Work\Vanessa\vanessa-automation-single\vanessa-automation-single.epf" ";" /C"StartFeaturePlayer;QuietInstallVanessaExt;VAParams=VAParams.json"
)

