﻿#language: ru
@tree

Функционал: Робот по отгрузке контейнера
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
	НомерТСД = "210"
	ПарольПользователя = ""

Контекст:
	И я подключаю профиль TestClient "WMS_TEST"
	//И Я открыл новый сеанс TestClient или подключил уже существующий
	//И Я подключаю уже запущенный клиент тестирования "WMS_DEMO
	//И Я закрыл все окна клиентского приложения

Сценарий: Я отгружаю контейнер

Попытка
	// Авторизация ТСД
	Когда открылось окно 'Эмулятор ТСД (epf v1.8 нагрузочное тестирование)*'
	Если поле с именем "СписокСеансов" существует Тогда
		И Я авторизуюсь в ТСД
		
	// Находим начальную точку старта
	И Я возвращаюсь в основное меню
	И Пауза 1
	И я нажимаю на кнопку с именем 'КнопкакнОтгрузка'
	И Пауза 1
Исключение
	И я закрываю TestClient "WMS_TEST"

И я делаю "ЧислоВыполнений" раз
	Попытка
		Если поле с именем "КнопкакнОтгрузка" существует Тогда
			И я нажимаю на кнопку с именем 'КнопкакнОтгрузка'
			И Пауза 1

		Если поле с именем "КнопкакнПовторить" существует Тогда
			И я нажимаю на кнопку с именем 'КнопкакнВернуться'
			И Пауза 20
		Иначе
			И Я Пропускаю отбор контейнера случайным образом
			// Отсылаем замер о выполняемой операции
			И в поле с именем 'Сообщение' я ввожу текст 'Автобот. Отгрузка контейнера;{НомерТСД}'
			И я активизирую поле с именем "РеквизитКонтейнер"

			// Копируем номер контейнера
			И я нажимаю на кнопку с именем 'ФормаСкопироватьКонтейнер'
			И я жду доступности элемента с именем "РеквизитКонтейнер" в течение 4 секунд
			// F12
			И я нажимаю на кнопку с именем 'ФормаВыбратьТекущееЗначение'
			И я жду доступности элемента с именем "КнопкакнДа" в течение 4 секунд
			И я нажимаю на кнопку с именем 'КнопкакнДа'
			И Пауза 1
			Если поле с именем "КнопкакнПовторить" существует Тогда
				И я нажимаю на кнопку с именем 'КнопкакнВернуться'
				И Пауза 20
			//Иначе 
			//	И я жду доступности элемента с именем "РеквизитКонтейнер" в течение 4 секунд
	Исключение
		И я прерываю цикл
попытка
	И Я закрываю окно 'Эмулятор ТСД (epf v1.8 нагрузочное тестирование)*'
	Тогда открылось окно 'Выход'
	И я нажимаю на кнопку с именем 'Button0'
Исключение
	
И я закрываю TestClient "WMS_TEST"



			

