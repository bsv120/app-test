﻿#language: ru
@tree

Функционал: Робот по размещению контейнеров
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


Переменные: 
	ЧислоВыполнений = 100
	НомерТСД = "121"
	ПарольПользователя = ""

Контекст:
	И я подключаю профиль TestClient "WMS_TEST"
	//И Я открыл новый сеанс TestClient или подключил уже существующий
	//И Я подключаю уже запущенный клиент тестирования "WMS_DEMO
	//И Я закрыл все окна клиентского приложения

Сценарий: Я размещаю контейнер
Попытка
	// Авторизация ТСД
	Когда открылось окно 'Эмулятор ТСД (epf v1.8 нагрузочное тестирование)*'
	Если поле с именем "СписокСеансов" существует Тогда
		И Я авторизуюсь в ТСД

	// Находим начальную точку старта
	И Я возвращаюсь в основное меню
	И Пауза 1
	
Исключение 
	И я закрываю TestClient "WMS_TEST"	


// Небольшие костыли, чтобы ТСД 121 не выбирал контейнер. Все остальные должны будут выбирать случайным образом
И я запоминаю строку "Выбирать" в переменную "ДействиеВыбора"  
Если существует переменная "_НомерТСД" Тогда
	Если переменная "_НомерТСД" имеет значение "121" Тогда	
		И я запоминаю строку "НеВыбирать" в переменную "ДействиеВыбора"  
Если переменная "НомерТСД" имеет значение "121" Тогда	
	И я запоминаю строку "НеВыбирать" в переменную "ДействиеВыбора"	

// Запомним время начала выполнения операции
Дано я выполняю код встроенного языка 'ВремяНачалаЗамера=ТекущаяУниверсальнаяДатаВМиллисекундах(); Контекст.Вставить("ВремяНачалаЗамера", СокрЛП(ВремяНачалаЗамера));' 
И я запоминаю значение выражения  '1' в переменную "ТекущийШаг"
И я делаю "ЧислоВыполнений" раз

	Попытка
		Если поле с именем "КнопкакнРазмещение" существует Тогда
			И я нажимаю на кнопку с именем 'КнопкакнРазмещение'
			И Пауза 1

		Если поле с именем "КнопкакнПовторить" существует Тогда
			И я нажимаю на кнопку с именем 'КнопкакнВернуться'
			И Пауза 60
			Дано я выполняю код встроенного языка 'ВремяНачалаЗамера=ТекущаяУниверсальнаяДатаВМиллисекундах(); Контекст.Вставить("ВремяНачалаЗамера", СокрЛП(ВремяНачалаЗамера));' 
		Если поле с именем 'КнопкакнРазмещениеКонтейнеров' существует Тогда
			И я нажимаю на кнопку с именем 'КнопкакнРазмещениеКонтейнеров'
			//И Пауза 1
			И я жду доступности элемента с именем "РеквизитКонтейнер" в течение 10 секунд

		Если поле с именем "КнопкакнРазмещениеКонтейнеров" существует Тогда
			И я нажимаю на кнопку с именем 'КнопкакнРазмещениеКонтейнеров'

		Если переменная "ДействиеВыбора" имеет значение "Выбирать" Тогда		
			И я Пропускаю задачу случайным образом		

		
		И я нажимаю на кнопку с именем 'ФормаСкопироватьКонтейнер'
		И я жду доступности элемента с именем "РеквизитКонтейнер" в течение 10 секунд
		И я нажимаю на кнопку с именем 'ФормаВыбратьТекущееЗначение'
		И я жду доступности элемента с именем "РеквизитЯчейка" в течение 10 секунд
		И я нажимаю на кнопку с именем 'ФормаСкопироватьКонтейнер'
		И я жду доступности элемента с именем "РеквизитЯчейка" в течение 10 секунд
		И я нажимаю на кнопку с именем 'ФормаВыбратьТекущееЗначение'
		И я жду доступности элемента с именем "РеквизитКонтейнер" в течение 10 секунд

		// Отправляем сообщение о предыдущем замере
		Если существует переменная "_НомерТСД" Тогда
			И в поле с именем 'Сообщение' я ввожу текст 'Автобот-размещение контейнера;$$_НомерТСД$$;$ВремяНачалаЗамера$'
		Иначе	
			И в поле с именем 'Сообщение' я ввожу текст 'Автобот-размещение контейнера;{НомерТСД};$ВремяНачалаЗамера$'
		// Запомним время начала выполнения операции
		Дано я выполняю код встроенного языка 'ВремяНачалаЗамера=ТекущаяУниверсальнаяДатаВМиллисекундах(); Контекст.Вставить("ВремяНачалаЗамера", СокрЛП(ВремяНачалаЗамера));' 
		И я активизирую поле с именем "РеквизитКонтейнер"
		
			//И я нажимаю на кнопку с именем 'Отправить'

			//И Пауза 1
			//И я жду доступности элемента с именем "РеквизитКонтейнер" в течение 10 секунд
			// Нажать Еще-Вернуться в меню
			//И я нажимаю на кнопку с именем 'Команда18'					
			//И Пауза 1
			//И я жду доступности элемента с именем "КнопкакнРазмещение" в течение 10 секунд
			// Нажать Вернуться в основное меню
			//Если поле с именем "КнопкакнВернуться" существует Тогда
			//	И я нажимаю на кнопку с именем 'КнопкакнВернуться'			
		Исключение
			И Я возвращаюсь в основное меню
И Я закрыл все окна клиентского приложения
Исключение
	И Я закрыл все окна клиентского приложения

попытка
	И Я закрываю окно 'Эмулятор ТСД (epf v1.8 нагрузочное тестирование)*'
	Тогда открылось окно 'Выход'
	И я нажимаю на кнопку с именем 'Button0'
Исключение
	
И я закрываю TestClient "WMS_TEST"



			

