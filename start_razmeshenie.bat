chcp 1251
rem Редактируем файл параметров запуска скрипта ванессы. Изменяем номер порта запуска и номера ТСД (совпадают)
copy VAParams_razmeshenie_orig.json VAParams_razmeshenie.json
nhrt.exe -spt:"000" -t:"%1" VAParams_razmeshenie.json

rem Запускаем цикл который должен повториться
rem Число перемещаемых контейнеров задается в фиче

for /l %%x in (1, 1, 50) do (
	"C:\Program Files\1cv8\8.3.21.1393\bin\1cv8c" /N"" /TestManager /Execute "C:\Work\Vanessa\vanessa-automation-single\vanessa-automation-single.epf" /IBConnectionString "File=""C:\Work\WMS"";" /C"StartFeaturePlayer;QuietInstallVanessaExt;VAParams=VAParams_razmeshenie.json"
)

