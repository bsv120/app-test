chcp 1251
copy VAParams_orig.json VAParams.json

nhrt.exe -spt:"000" -t:"%1" VAParams_razmeshenie.json
nhrt.exe -spt:"Я ничего не делаю" -t:"Я размещаю контейнер" VAParams.json
nhrt.exe -spt:"Путь до эмулятора" -t:"C:\\Work\\WMS\\ЭмуляторТСД_Тест02.epf\" VAParams.json

rem Запускаем цикл который должен повториться
rem Число перемещаемых контейнеров задается в фиче

for /l %%x in (1, 1, 50) do (
	"C:\Program Files\1cv8\8.3.21.1393\bin\1cv8c" /N"" /TestManager /Execute "C:\Work\Vanessa\vanessa-automation-single\vanessa-automation-single.epf" /IBConnectionString "File=""C:\Work\WMS"";" /C"StartFeaturePlayer;QuietInstallVanessaExt;VAParams=VAParams_razmeshenie.json"
)

