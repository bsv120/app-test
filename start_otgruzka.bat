chcp 1251
rem ����������� ���� ���������� ������� ������� �������. �������� ����� ����� ������� � ������ ��� (���������)
copy VAParams_otgruzka_orig.json VAParams_otgruzka.json
nhrt.exe -spt:"000" -t:"%1" VAParams_otgruzka.json

rem ��������� ���� ������� ������ �����������
rem ����� ������������ ����������� �������� � ����

for /l %%x in (1, 1, 50) do (
	"C:\Program Files\1cv8\8.3.21.1393\bin\1cv8c" /N"" /TestManager /Execute "C:\Work\Vanessa\vanessa-automation-single\vanessa-automation-single.epf" /IBConnectionString "File=""C:\Work\WMS"";" /C"StartFeaturePlayer;QuietInstallVanessaExt;VAParams=VAParams_otgruzka.json"
)

