chcp 1251
rem Редактируем файл параметров запуска скрипта ванессы. Изменяем номер порта запуска и номера ТСД (совпадают)
copy VAParams_otbor_orig.json VAParams_otbor.json
nhrt.exe -spt:"000" -t:"%1" VAParams_otbor.json

rem Запускаем цикл который должен повториться
rem Число перемещаемых контейнеров задается в фиче

for /l %%x in (1, 1, 50) do (
	"C:\Program Files\1cv8\8.3.21.1393\bin\1cv8c" /N"" /TestManager /Execute "C:\Work\Vanessa\vanessa-automation-single\vanessa-automation-single.epf" /IBConnectionString "File=""C:\Work\WMS"";" /C"StartFeaturePlayer;QuietInstallVanessaExt;VAParams=VAParams_otbor.json"
)

