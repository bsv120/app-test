﻿#language: ru
@tree

Функционал: Робот по приемке контейнеров
// При внешнем запуске переменные передаются в файле VAParams.json 
//   	 "GlobalVars": {
//		"_НомерТСД":"125",
//		"_Пароль": "",
//	}
// При локальном запуске используются переменные описанные ниже.   Подружить имена глобальных переменных с локальными не получилось ;-((  
// Приходится использовать костыли:
//	ЕСЛИ существует переменная "_НомерТСД" Тогда
//		И в поле с именем 'Pattern' ввожу значение глобальной переменной "_НомерТСД"
//	ИНАЧЕ	
//		И в поле с именем 'Pattern' я ввожу текст "НомерТСД"
// Подключаемся к воротам и проводим одну приемку


Переменные: 
	НомерТСД = "111"
	ПарольПользователя = ""
	ЧислоСтрокЗаказа = 100
	ЧислоВыполнений = 1000

Контекст:
	И я подключаю профиль TestClient "WMS_TEST"
	//И Я открыл новый сеанс TestClient или подключил уже существующий
	//И Я подключаю уже запущенный клиент тестирования "WMS_DEMO
	//И Я закрыл все окна клиентского приложения

Сценарий: Я выполняю приемку одного контейнера

Попытка
	Когда открылось окно 'Эмулятор ТСД (epf v1.8 нагрузочное тестирование)*'
	// Выбираем приемку
	И я нажимаю на кнопку с именем 'КнопкакнПриемка'
	И я жду доступности элемента с именем 'КнопкакнВыборПриемки' в течение 10 секунд
	И я нажимаю на кнопку с именем 'КнопкакнВыборПриемки'
	И я жду доступности элемента с именем "РеквизитВорота" в течение 10 секунд
	// Подключаемся к воротам и в поле с именем 'РеквизитВорота' я ввожу текст '01'
	И я нажимаю на кнопку с именем 'ФормаСкопироватьКонтейнер'
	И я жду доступности элемента с именем "РеквизитВорота" в течение 10 секунд
	И я нажимаю на кнопку с именем 'ФормаВыбратьТекущееЗначение'
	И Пауза 1
	// Приемок может не быть, тогда пропускаем.
	Если поле с именем 'РеквизитстрКомментарий2' существует Тогда
		Если значение поля 'РеквизитстрКомментарий2' содержит текст 'ОШИБКА. Не найдено активных приемок. Отсканируйте ворота' Тогда
			И я нажимаю на кнопку с именем 'Команда13'
			И Пауза 1
			И я нажимаю на кнопку с именем 'КнопкакнВернуться'
			И Пауза 10
			Тогда я продолжаю цикл

	// Приемок может быть несколько. Выбираем одну из них
	Если поле с именем 'РеквизитстрЗаголовок' существует Тогда
		Если значение поля 'РеквизитстрЗаголовок' содержит текст 'ВЫБОР ПРИЕМКИ' Тогда
			//И Я Выбираю задачу случайным образом
			И в таблице "ТаблицаТаблица" я выбираю текущую строку
			И я жду доступности элемента с именем "РеквизитКонтейнер" в течение 10 секунд

	И я запоминаю строку "0" в переменную "ОшибкаПриемки"  
	И я делаю "ЧислоСтрокЗаказа" раз
		// подключились к приемке, создаем контейнер
		Если переменная "ОшибкаПриемки" имеет значение "0" Тогда
			И я нажимаю на кнопку с именем 'Команда12'	

		И я жду доступности элемента с именем "РеквизитНоменклатура" в течение 10 секунд
		И в поле с именем 'РеквизитНоменклатура' я ввожу текст ''
		// Открываем спискок товаров  (F4)
		И я нажимаю на кнопку с именем 'Команда13'
		И я жду доступности элемента с именем "ТаблицаТаблица" в течение 5 секунд
		// Нажимаем кнопку "Получить данные"  узнаем штрихкод непринятого товара
		И я нажимаю на кнопку с именем 'ФормаПолучитьДанные'
		И я жду доступности элемента с именем "Команда12" в течение 10 секунд
		И я нажимаю на кнопку с именем 'Команда12'											// Возвращаемся в предыдущее окно
		И я жду доступности элемента с именем "РеквизитНоменклатура" в течение 10 секунд
		И я нажимаю на кнопку с именем 'ФормаСкопироватьКонтейнер'							// Жмем на кнопку, заполняется штрихкод товара
		
		И я жду доступности элемента с именем "РеквизитНоменклатура" в течение 10 секунд

		// Прроверка на сверх приемку
		Если поле с именем 'РеквизитстрКомментарий5' существует Тогда
			И я запоминаю значение поля "РеквизитстрКомментарий5" как "МояСтрока"
			Дано я выполняю код встроенного языка 'Результат = СтрНайти(Контекст.МояСтрока, "сверх"); Контекст.Вставить("Результат", Число(Результат));' 
			Если переменная "Результат" имеет значение 1 Тогда
				И я запоминаю строку "1" в переменную "ОшибкаПриемки"  

		Если переменная "ОшибкаПриемки" имеет значение "0" Тогда
			Если поле "РеквизитНоменклатура" заполнено Тогда
				И я запоминаю строку "0" в переменную "Ошибка"  
			Иначе	
				И я запоминаю строку "1" в переменную "Ошибка"  


			Если переменная "Ошибка" имеет значение "0" Тогда
				// Жмем на кнопку, отправляем штрихкод
				И я нажимаю на кнопку с именем 'ФормаВыбратьТекущееЗначение'
				И я жду доступности элемента "РеквизитстрЗаголовок" в течение 10 секунд
				И я запоминаю строку "0" в переменную "Ошибка"  
				Если поле с именем 'РеквизитстрКомментарий5' существует Тогда
					Если значение поля 'РеквизитстрКомментарий5' содержит текст 'ОШИБКА. Значение должно быть заполнено. Отсканируйте номенклатуру или введите артикул' Тогда
						И я запоминаю строку "1" в переменную "Ошибка"  
					
					Дано я выполняю код встроенного языка 'Результат = СтрНайти(Контекст.РеквизитстрКомментарий5, "ОШИБКА. По документу Ожидаемая приемка"); Контекст.Вставить("Результат", Число(Результат));' 
					Если переменная "Результат" имеет значение 1 Тогда
						И я запоминаю строку "1" в переменную "Ошибка"  
						И я нажимаю на кнопку с именем 'Команда12'										// Возврат Номенклатура

				Если переменная "Ошибка" имеет значение "0" Тогда
					И я нажимаю на кнопку с именем 'ФормаСкопироватьКонтейнер'							// Заполняем номер партии
					И я жду доступности элемента с именем "РеквизитПартияНоменклатуры" в течение 5 секунд
					И я нажимаю на кнопку с именем 'ФормаВыбратьТекущееЗначение'						// Отправляем номер партии

					// Проверка на сверхприемку
					Если поле с именем 'РеквизитстрКомментарий8' существует Тогда
						Если значение поля 'РеквизитстрКомментарий8' содержит текст 'ОШИБКА. Запрещено принимать сверх планового количества. Введите партию' Тогда
							И я запоминаю строку "1" в переменную "ОшибкаПриемки"  
							Тогда я продолжаю цикл



					//И Пауза 1
					Если переменная "ОшибкаПриемки" имеет значение "0" Тогда
						И я жду доступности элемента с именем "РеквизитКоличествоУпаковок" в течение 10 секунд
						Если поле с именем 'РеквизитНомерПартии' существует Тогда
							И я нажимаю на кнопку с именем 'ФормаВыбратьТекущееЗначение'
							И я жду доступности элемента с именем "РеквизитКоличествоУпаковок" в течение 10 секунд
						Если поле с именем 'РеквизитКоличествоУпаковок' существует Тогда
							И я нажимаю на кнопку с именем 'ФормаСкопироватьКонтейнер'	
						// Соглашаемся с тем, что у товара новая партия
						И я нажимаю на кнопку с именем 'ФормаВыбратьТекущееЗначение'

						И я запоминаю строку "0" в переменную "ОшибкаПриемки"  
						И я жду доступности элемента с именем "КнопкакнДа" в течение 5 секунд
						// Жмем на кнопку, подтверждаем приемку товара
						И я нажимаю на кнопку с именем 'КнопкакнДа'
						И я жду доступности элемента с именем "РеквизитКонтейнер" в течение 5 секунд
						Если поле с именем "РеквизитстрКомментарий10" существует Тогда
							Если значение поля "РеквизитстрКомментарий10" содержит текст 'ОШИБКА. Ожидаемая приемка принята. Введите количество' Тогда
								И я запоминаю строку "1" в переменную "Ошибка"  
								Тогда я прерываю цикл		
							Если значение поля "РеквизитстрКомментарий10" содержит текст 'ОШИБКА. Приемка закрыта. Введите количество' Тогда
								И я запоминаю строку "1" в переменную "Ошибка"  
								Тогда я прерываю цикл		

							Если значение поля "РеквизитстрКомментарий10" содержит текст 'ОШИБКА. Не найден подходящий рабочий поток. Введите количество' Тогда
								И я запоминаю строку "1" в переменную "Ошибка"  
								Тогда я прерываю цикл		

							И я запоминаю значение поля "РеквизитстрКомментарий10" как "МояСтрока"
							Дано я выполняю код встроенного языка 'Результат = СтрНайти(Контекст.МояСтрока, "ОШИБКА"); Контекст.Вставить("Результат", Число(Результат));' 
							Если переменная "Результат" имеет значение 1 Тогда
								И я запоминаю строку "1" в переменную "ОшибкаПриемки"  
								//Переходим заново к выбору номенклатуры
								И я нажимаю на кнопку с именем 'Команда12'
							
				//И я жду доступности элемента с именем "РеквизитКонтейнер" в течение 10 секунд
			Если переменная "Ошибка" имеет значение "1" Тогда
				Тогда я прерываю цикл
				
	И я запоминаю строку "Обходим глюк Ванессы. Иначе не выходит из цикла. Ссука" в переменную "Мусор"
	// Выходим в меню приемки
	Попытка
		И я нажимаю на кнопку с именем 'Команда19'
	Исключение
		И я нажимаю на кнопку с именем 'Команда20'
	И Пауза 1
	// Выходим в основное меню
	И я нажимаю на кнопку с именем 'КнопкакнВернуться'

Исключение
	И Я возвращаюсь в основное меню
