﻿#language: ru
@tree

Функционал: Робот по отбору контейнера
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
	НомерТСД = "146"
	ПарольПользователя = ""

Контекст:
	И я подключаю профиль TestClient "WMS_TEST"
	//И Я открыл новый сеанс TestClient или подключил уже существующий
	//И Я подключаю уже запущенный клиент тестирования "WMS_DEMO
	//И Я закрыл все окна клиентского приложения

Сценарий: Я отбираю контейнер

Попытка
	// Авторизация ТСД
	Когда открылось окно 'Эмулятор ТСД (epf v1.8 нагрузочное тестирование)*'
	Если поле с именем "СписокСеансов" существует Тогда
		И Я авторизуюсь в ТСД
		
	// Находим начальную точку старта
	И Я возвращаюсь в основное меню
	И Пауза 1

	И я нажимаю на кнопку с именем 'КнопкакнОтбор'
	И Пауза 1
Исключение
	И я закрываю TestClient "WMS_TEST"


// Запомним время начала выполнения операции
Дано я выполняю код встроенного языка 'ВремяНачалаЗамера=ТекущаяУниверсальнаяДатаВМиллисекундах(); Контекст.Вставить("ВремяНачалаЗамера", СокрЛП(ВремяНачалаЗамера));' 
И я делаю "ЧислоВыполнений" раз
	Попытка
		Если поле с именем "КнопкакнОтборКонтейнеров" существует Тогда
			И я нажимаю на кнопку с именем 'КнопкакнОтборКонтейнеров'
			И Пауза 1			

		Если поле с именем "КнопкакнПовторить" существует Тогда
			И я нажимаю на кнопку с именем 'КнопкакнВернуться'
			И Пауза 20
		Иначе	
			И Я Пропускаю отбор контейнера случайным образом

			// Отправляем сообщение о предыдущем замере
			Если существует переменная "_НомерТСД" Тогда
				И в поле с именем 'Сообщение' я ввожу текст 'Автобот-отбор контейнера;$$_НомерТСД$$;$ВремяНачалаЗамера$'
			Иначе	
				И в поле с именем 'Сообщение' я ввожу текст 'Автобот-отбор контейнера;{НомерТСД};$ВремяНачалаЗамера$'

			И я активизирую поле с именем "РеквизитКонтейнер"
			// Копируем номер контейнера
			И я нажимаю на кнопку с именем 'ФормаСкопироватьКонтейнер'
			//И Пауза 1
			И я жду доступности элемента с именем "РеквизитКонтейнер" в течение 4 секунд
			// F12
			И я нажимаю на кнопку с именем 'ФормаВыбратьТекущееЗначение'
			//И Пауза 1
			И я жду доступности элемента с именем "РеквизитЯчейка" в течение 4 секунд
			// Копируем номер ячейки
			И я нажимаю на кнопку с именем 'ФормаСкопироватьКонтейнер'
			//И Пауза 1
			И я жду доступности элемента с именем "РеквизитЯчейка" в течение 4 секунд
			// Кладем контейнер
			И я нажимаю на кнопку с именем 'ФормаВыбратьТекущееЗначение'
			// Выход в Esc
			И Пауза 1
			Если поле с именем "КнопкакнПовторить" существует Тогда
				И я нажимаю на кнопку с именем 'КнопкакнВернуться'
				И Пауза 20
			Иначе
				И я жду доступности элемента с именем "Команда17" в течение 4 секунд
//				И я нажимаю на кнопку с именем 'Команда17'
				// Выход в основное меню
//				И я жду доступности элемента с именем "КнопкакнВернуться" в течение 4 секунд
//				И я нажимаю на кнопку с именем 'КнопкакнВернуться'
				//И Пауза 1
//				И я жду доступности элемента с именем "РеквизитКонтейнер" в течение 4 секунд

			// Запомнить время  отправки. Это будет считать временем начала новой итерации
			Дано я выполняю код встроенного языка 'ВремяНачалаЗамера=ТекущаяУниверсальнаяДатаВМиллисекундах(); Контекст.Вставить("ВремяНачалаЗамера", СокрЛП(ВремяНачалаЗамера));' 

	Исключение
		И я прерываю цикл


попытка
	И Я закрываю окно 'Эмулятор ТСД (epf v1.8 нагрузочное тестирование)*'
	Тогда открылось окно 'Выход'
	И я нажимаю на кнопку с именем 'Button0'
Исключение

И Я закрыл все окна клиентского приложения
И я закрываю TestClient "WMS_TEST"



			

