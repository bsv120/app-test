chcp 1251
copy VAParams_orig.json VAParams.json

nhrt.exe -spt:"000" -t:"%1" VAParams_razmeshenie.json
nhrt.exe -spt:"� ������ �� �����" -t:"� �������� ���������" VAParams.json
nhrt.exe -spt:"���� �� ���������" -t:"C:\\Work\\WMS\\�����������_����02.epf\" VAParams.json

rem ��������� ���� ������� ������ �����������
rem ����� ������������ ����������� �������� � ����

for /l %%x in (1, 1, 50) do (
	"C:\Program Files\1cv8\8.3.21.1393\bin\1cv8c" /N"" /TestManager /Execute "C:\Work\Vanessa\vanessa-automation-single\vanessa-automation-single.epf" /IBConnectionString "File=""C:\Work\WMS"";" /C"StartFeaturePlayer;QuietInstallVanessaExt;VAParams=VAParams_razmeshenie.json"
)

