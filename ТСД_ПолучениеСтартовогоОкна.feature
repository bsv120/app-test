﻿#language: ru
@tree
@ExportScenarios

Функционал: Возвращение к точке старта

Сценарий: Я возвращаюсь в основное меню

//И я запоминаю значение поля с именем "РеквизитстрЗаголовок" как "ИмяПеременной1"
//Дано я выполняю код встроенного языка 'Рез = СтрНайти("$ИмяПеременной1$", "РАЗМЕЩЕНИЕ КОНТЕЙНЕРОВ"); Контекст.Вставить("Результат", Рез);' 
//Если переменная "Результат" имеет значение "1" Тогда

//И я запоминаю значение поля с именем "РеквизитстрЗаголовок" как "ИмяПеременной1"
//И я вывожу значение переменной "ИмяПеременной1"
////И я запоминаю значение поля с именем "РеквизитстрКомментарий1" как "ИмяПеременной2"
//
//И я вывожу значение переменной "ИмяПеременной2"


//РеквизитстрКомментарий4' стал равен 'ОШИБКА.
//	Когда открылось окно 'Эмулятор ТСД (epf v1.8 нагрузочное тестирование) [124]'
//	И я нажимаю на кнопку с именем 'ФормаВыбратьТекущееЗначение'
//	И я нажимаю на кнопку с именем 'Команда15'
//	И я нажимаю на кнопку с именем 'КнопкакнВернуться'

// Для того чтобы было удобно завершить сценарий по "Прерываю цикл" - организуем цикл. 
И я делаю 1 раз
	И Пауза 1
	Если поле с именем "РеквизитстрЗаголовок0" существует Тогда
		Если значение поля "РеквизитстрЗаголовок0" содержит текст 'ОСНОВНОЕ МЕНЮ' Тогда
			И я прерываю цикл

	Если значение поля'РеквизитстрЗаголовок' содержит текст 'РАЗМЕЩЕНИЕ КОНТЕЙНЕРОВ'
		Если поле с именем "КнопкакнВернуться" существует Тогда
			И я нажимаю на кнопку с именем 'КнопкакнВернуться'
			И Пауза 1
			И я нажимаю на кнопку с именем 'Команда18'
			И я прерываю цикл


	Если поле с именем "КнопкакнВернуться" существует Тогда
		И я нажимаю на кнопку с именем 'КнопкакнВернуться'
		И я прерываю цикл


	Если поле с именем "РеквизитстрКомментарий1" существует Тогда
		Если значение поля "РеквизитстрКомментарий1" содержит текст 'Не найдено задание. Выберите другую операцию или рабочий поток, или повторите попытку поиска задания позже' Тогда
			И я нажимаю на кнопку с именем 'КнопкакнВернуться'
			И Пауза 1
			И я нажимаю на кнопку с именем 'КнопкакнВернуться'
			И Пауза 1
			И я прерываю цикл

	Если значение поля "РеквизитстрЗаголовок" содержит текст 'ПРИЕМКА' Тогда
		Если поле с именем "КнопкакнДа" существует Тогда
			И я нажимаю на кнопку с именем 'КнопкакнДа'
			И Пауза 1
			И я нажимаю на кнопку с именем 'Команда20'
			И Пауза 1
			И я нажимаю на кнопку с именем 'КнопкакнВернуться'
			И Пауза 1
			И я прерываю цикл

	// Ошибка с предложением инвентаризации 
	Если поле с именем "КнопкакнДа" существует Тогда
		И я нажимаю на кнопку с именем 'КнопкакнНет'
		И Пауза 1
		И я нажимаю на кнопку с именем 'Команда16'
		И Пауза 1
		И я нажимаю на кнопку с именем 'КнопкакнВернуться'
		И Пауза 1
		И я прерываю цикл


	Если поле с именем "РеквизитстрКомментарий1" существует Тогда
		Если значение поля "РеквизитстрКомментарий1" содержит текст 'Создать инвентаризацию ячейки: ' Тогда
			И я нажимаю на кнопку с именем 'КнопкакнНет'
			И Пауза 1
			И я нажимаю на кнопку с именем 'Команда13'
			И Пауза 1
			И я нажимаю на кнопку с именем 'КнопкакнВернуться'
			И Пауза 1
			И я прерываю цикл
	
	Если поле с именем "РеквизитстрКомментарий2" существует Тогда
		Если значение поля "РеквизитстрКомментарий2" содержит текст 'ОШИБКА. Не найдено активных приемок. Отсканируйте ворота' Тогда
			И я нажимаю на кнопку с именем 'Команда13'
			И Пауза 1
			И я нажимаю на кнопку с именем 'КнопкакнВернуться'
			И Пауза 1
			И я прерываю цикл


	Если значение поля "РеквизитстрЗаголовок" содержит текст 'ВЫБОР ПРИЕМКИ' Тогда
		Попытка
			И я нажимаю на кнопку с именем 'Команда12'
		Исключение	
		И я нажимаю на кнопку с именем 'Команда13'
		И Пауза 1
		И я нажимаю на кнопку с именем 'КнопкакнВернуться'
		И Пауза 1
		И я прерываю цикл

	Если значение поля "РеквизитстрЗаголовок" содержит текст 'ПРИЕМКА' Тогда
		Если поле с именем "РеквизитстрКомментарий10" существует Тогда
			Если значение поля 'РеквизитстрКомментарий10' содержит текст 'ОШИБКА. Ожидаемая приемка принята. Введите количество' Тогда
				И я нажимаю на кнопку с именем 'Команда20'
				И Пауза 1
				И я запоминаю строку "1" в переменную "Ошибка"  
				И я прерываю цикл

		Если поле с именем "РеквизитстрЗаголовок1" существует Тогда
			Если значение поля 'РеквизитстрЗаголовок1' содержит текст 'НОВАЯ ПАРТИЯ' Тогда
				И я нажимаю на кнопку с именем 'ФормаСкопироватьКонтейнер'
				И Пауза 1
				И я нажимаю на кнопку с именем 'ФормаВыбратьТекущееЗначение'
				И Пауза 1
				И я нажимаю на кнопку с именем 'ФормаСкопироватьКонтейнер'
				И Пауза 1
				И я нажимаю на кнопку с именем 'ФормаВыбратьТекущееЗначение'
				И Пауза 1
				И я нажимаю на кнопку с именем 'КнопкакнДа'
				И Пауза 1
				И я нажимаю на кнопку с именем 'Команда15'
				И Пауза 1
				И я нажимаю на кнопку с именем 'КнопкакнВернуться'
				И Пауза 1

		Если поле с именем "РеквизитстрКомментарий4" существует Тогда
			И я нажимаю на кнопку с именем 'Команда15'
			И Пауза 1
			И я нажимаю на кнопку с именем 'КнопкакнВернуться'
			И я запоминаю строку "1" в переменную "Ошибка"  
			И я прерываю цикл

		Если поле с именем "РеквизитстрКомментарий5" существует Тогда
			И я нажимаю на кнопку с именем 'Команда19'
			И Пауза 1
			И я нажимаю на кнопку с именем 'КнопкакнВернуться'
			И я запоминаю строку "1" в переменную "Ошибка"  
			И я прерываю цикл

	//Если значение поля "РеквизитстрЗаголовок" содержит текст 'ПРИЕМКА' Тогда
		Если поле с именем "РеквизитстрКомментарий3" существует Тогда
			И я нажимаю на кнопку с именем 'Команда12'
			И Пауза 1
			И я нажимаю на кнопку с именем 'Команда20'
			И Пауза 1
			И я нажимаю на кнопку с именем 'КнопкакнВернуться'
			И я запоминаю строку "1" в переменную "Ошибка"  
			И я прерываю цикл

	//Если значение поля "РеквизитстрЗаголовок" содержит текст 'ПРИЕМКА' Тогда
		Если поле с именем "ТаблицаТаблица" существует Тогда
			И я нажимаю на кнопку с именем 'Команда12'
			И Пауза 1
			И я нажимаю на кнопку с именем 'Команда19'
			И Пауза 1
			И я нажимаю на кнопку с именем 'КнопкакнВернуться'
			И Пауза 1
			И я запоминаю строку "1" в переменную "Ошибка"  
			И я прерываю цикл

	
		Если поле с именем "РеквизитКоличествоУпаковок" существует Тогда
			Если элемент "РеквизитКоличествоУпаковок" доступен для редактирования Тогда
				И я нажимаю на кнопку с именем 'Команда20'
				И Пауза 1
				И я нажимаю на кнопку с именем 'КнопкакнВернуться'
				И Пауза 1
				И я запоминаю строку "1" в переменную "Ошибка"  
				И я прерываю цикл

		Если поле с именем "РеквизитстрКомментарий5" существует Тогда
			Если значение поля "РеквизитстрКомментарий5" содержит текст 'Отсканируйте номенклатуру или введите артикул' Тогда
				И я нажимаю на кнопку с именем 'Команда19'
				И Пауза 1
				И я нажимаю на кнопку с именем 'КнопкакнВернуться'
				И Пауза 1
				И я запоминаю строку "1" в переменную "Ошибка"  
				И я прерываю цикл


		Если поле с именем "РеквизитНоменклатура" существует Тогда
			Если элемент "РеквизитНоменклатура" доступен для редактирования Тогда
				И я нажимаю на кнопку с именем 'Команда19'
				И Пауза 1
				И я нажимаю на кнопку с именем 'КнопкакнВернуться'
				И Пауза 1
				И я запоминаю строку "1" в переменную "Ошибка"  
				И я прерываю цикл

	//Если значение поля "РеквизитстрЗаголовок" содержит текст 'ПРИЕМКА' Тогда
		Если поле с именем "РеквизитПартияНоменклатуры" существует Тогда
			Если элемент "РеквизитПартияНоменклатуры" доступен для редактирования Тогда
				И я нажимаю на кнопку с именем 'Команда20'
				И Пауза 1
				И я нажимаю на кнопку с именем 'КнопкакнВернуться'
				И Пауза 1
				И я запоминаю строку "1" в переменную "Ошибка"  
				И я прерываю цикл

	//Если значение поля "РеквизитстрЗаголовок" содержит текст 'ПРИЕМКА' Тогда
		И я запоминаю строку "0" в переменную "Ошибка"  
		Если поле с именем "РеквизитстрКомментарий4" существует Тогда
			Если значение поля "РеквизитстрКомментарий4" содержит текст 'Отсканируйте контейнер' Тогда
				И я нажимаю на кнопку с именем 'Команда16'
				И Пауза 1
				И я нажимаю на кнопку с именем 'КнопкакнВернуться'
				И я запоминаю строку "1" в переменную "Ошибка"  

		Если поле с именем "РеквизитстрКомментарий2" существует Тогда
			Если значение поля "РеквизитстрКомментарий2" содержит текст 'Отсканируйте ворота' Тогда
				И я нажимаю на кнопку с именем 'Команда13'
				И Пауза 1
				И я нажимаю на кнопку с именем 'КнопкакнВернуться'
				И я запоминаю строку "1" в переменную "Ошибка"  

		Если переменная "Ошибка" имеет значение "1" Тогда
			Тогда я прерываю цикл

		попытка
			И я нажимаю на кнопку с именем 'Команда15'
			И Пауза 1
		исключение
			И я нажимаю на кнопку с именем 'Команда12'
			И Пауза 1
			И я нажимаю на кнопку с именем 'Команда20'
			И Пауза 1
		И я нажимаю на кнопку с именем 'КнопкакнВернуться'
		И Пауза 1
		И я прерываю цикл

	Если значение поля "РеквизитстрЗаголовок1" содержит текст 'ЗАКРЫТИЕ ОЖИДАЕМОЙ ПРИЕМКИ' Тогда 
		И я нажимаю на кнопку с именем 'Команда14'
		И Пауза 1
		И я нажимаю на кнопку с именем 'КнопкакнВернуться'
		И Пауза 1
		И я прерываю цикл

	Если поле с именем "РеквизитстрЗаголовок1" существует Тогда
		Если значение поля "РеквизитстрЗаголовок1" содержит текст 'МЕНЮ ОТБОР' Тогда 
			И я нажимаю на кнопку с именем 'КнопкакнВернуться'
			И Пауза 1
			И я прерываю цикл

	Если значение поля "РеквизитстрЗаголовок" содержит текст 'РАЗМЕЩЕНИЕ КОНТЕЙНЕРОВ' Тогда 
		Если значение поля "РеквизитстрЗаголовок1" содержит текст 'ПОЛОЖИТЬ' Тогда 
				И я нажимаю на кнопку с именем 'ФормаСкопироватьКонтейнер'
				И Пауза 1
				И я нажимаю на кнопку с именем 'ФормаВыбратьТекущееЗначение'
				И Пауза 1
				И я нажимаю на кнопку с именем 'Команда18'
				И Пауза 1
				И я прерываю цикл

	//Если значение поля "РеквизитстрЗаголовок" содержит текст 'РАЗМЕЩЕНИЕ КОНТЕЙНЕРОВ' Тогда 
		Если поле с именем "КнопкакнВернуться" существует Тогда
			И я нажимаю на кнопку с именем 'КнопкакнВернуться'
			И Пауза 1
			И я нажимаю на кнопку с именем 'Команда18'
			И Пауза 1
			И я прерываю цикл


	Если значение поля "РеквизитстрЗаголовок" содержит текст 'ОТГРУЗКА' Тогда
		Если поле с именем "КнопкакнДа" существует Тогда
			И я нажимаю на кнопку с именем 'Команда18'
			И Пауза 1
			И я нажимаю на кнопку с именем 'КнопкакнВернуться'
			И Пауза 1
			И я прерываю цикл

	Если значение поля "РеквизитстрЗаголовок1" содержит текст 'МЕНЮ ОТГРУЗКА' Тогда
		И я нажимаю на кнопку с именем 'КнопкакнВернуться'
		И Пауза 1
		И я прерываю цикл

	Если значение поля "РеквизитстрЗаголовок" содержит текст 'ОТБОР КОНТЕЙНЕРОВ' Тогда
		Если значение поля "РеквизитстрЗаголовок1" содержит текст 'ВЗЯТЬ' Тогда
			И я нажимаю на кнопку с именем 'Команда19'
			И Пауза 1
			И я нажимаю на кнопку с именем 'КнопкакнВернуться'
			И я прерываю цикл

		Если значение поля "РеквизитстрЗаголовок1" содержит текст 'ПОЛОЖИТЬ ВСЕ' Тогда
			И я нажимаю на кнопку с именем 'ФормаСкопироватьКонтейнер'
			И Пауза 1
			И я нажимаю на кнопку с именем 'ФормаВыбратьТекущееЗначение'
			И Пауза 1
			И я нажимаю на кнопку с именем 'Команда19'
			И Пауза 1
			И я нажимаю на кнопку с именем 'КнопкакнВернуться'
			И Пауза 1
			И я прерываю цикл

	Если значение поля "РеквизитстрЗаголовок" не содержит текст 'ОСНОВНОЕ МЕНЮ' Тогда
		Если значение поля "РеквизитстрЗаголовок" содержит текст 'РАЗМЕЩЕНИЕ КОНТЕЙНЕРОВ' Тогда
			Если поле с именем "РеквизитстрКомментарий4" существует Тогда
				И я нажимаю на кнопку с именем 'ФормаВыбратьТекущееЗначение'
				И Пауза 1
			Если поле с именем "РеквизитстрКомментарий5" существует Тогда
				И я нажимаю на кнопку с именем 'Команда16'
				И Пауза 1
			Если значение поля "РеквизитстрЗаголовок2" содержит текст 'БЛОКИРОВКА' Тогда
				И я нажимаю на кнопку с именем 'КнопкакнВернуться'
				И Пауза 1

			Попытка
				И я нажимаю на кнопку с именем 'ФормаСкопироватьКонтейнер'
				И Пауза 1
				И я нажимаю на кнопку с именем 'Команда15'
			Исключение  
				И я нажимаю на кнопку с именем 'Команда16'
			И Пауза 1
			И я нажимаю на кнопку с именем 'КнопкакнВернуться'
			И Пауза 1
		Иначе   
			Если значение поля "РеквизитстрЗаголовок" содержит текст 'ПЕРЕМЕЩЕНИЕ КОНТЕЙНЕРОВ' Тогда
				И я нажимаю на кнопку с именем 'Команда15'
				И Пауза 1
				И я нажимаю на кнопку с именем 'КнопкакнВернуться'
				И Пауза 1
			Иначе   
				Если значение поля "РеквизитстрЗаголовок" содержит текст 'ОТБОР КОНТЕЙНЕРОВ' Тогда
					И я нажимаю на кнопку с именем 'Команда13'
					И Пауза 1
					И я нажимаю на кнопку с именем 'КнопкакнВернуться'
					И Пауза 1
				Иначе   
					Если значение поля "РеквизитстрЗаголовок" содержит текст 'СВОБОДНАЯ ОТГРУЗКА КОНТЕЙНЕРОВ' Тогда
						И я нажимаю на кнопку с именем 'Команда12'
						И Пауза 1
						И я нажимаю на кнопку с именем 'КнопкакнВернуться'
						И Пауза 1
