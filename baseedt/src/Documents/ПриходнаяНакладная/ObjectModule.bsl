
Процедура ОбработкаЗаполнения(ДанныеЗаполнения, СтандартнаяОбработка)

	Если ТипЗнч(ДанныеЗаполнения) = Тип("ДокументСсылка.Встреча") Тогда
		// Заполнение шапки
		//Контрагент = ДанныеЗаполнения.СписокУчастников;
		Событие = ДанныеЗаполнения.Ссылка;
	ИначеЕсли ТипЗнч(ДанныеЗаполнения) = Тип("ДокументСсылка.ЗапланированноеВзаимодействие") Тогда
		// Заполнение шапки
		Событие = ДанныеЗаполнения.Ссылка;
	ИначеЕсли ТипЗнч(ДанныеЗаполнения) = Тип("ДокументСсылка.СообщениеSMS") Тогда
		// Заполнение шапки
		//Контрагент = ДанныеЗаполнения.СписокУчастников;
		Событие = ДанныеЗаполнения.Ссылка;
	ИначеЕсли ТипЗнч(ДанныеЗаполнения) = Тип("ДокументСсылка.ТелефонныйЗвонок") Тогда
		// Заполнение шапки
		//Контрагент = ДанныеЗаполнения.АбонентКонтакт;
		Событие = ДанныеЗаполнения.Ссылка;
	ИначеЕсли ТипЗнч(ДанныеЗаполнения) = Тип("ДокументСсылка.ЭлектронноеПисьмоВходящее") Тогда
		// Заполнение шапки
		Событие = ДанныеЗаполнения.Ссылка;
	ИначеЕсли ТипЗнч(ДанныеЗаполнения) = Тип("ДокументСсылка.ЭлектронноеПисьмоИсходящее") Тогда
		// Заполнение шапки
		Событие = ДанныеЗаполнения.Ссылка;
	ИначеЕсли ТипЗнч(ДанныеЗаполнения) = Тип("ДокументСсылка.ЗаказКлиента") 
		ИЛИ ТипЗнч(ДанныеЗаполнения) = Тип("ДокументСсылка.РасходнаяНакладная") Тогда
		// Заполнение шапки
		Контрагент = ДанныеЗаполнения.Контрагент;
		Организация = ДанныеЗаполнения.Организация;
		Склад = ДанныеЗаполнения.Склад;
		Событие = ДанныеЗаполнения.Событие;
		ЗаказКлиента = ДанныеЗаполнения.Ссылка;
		Для Каждого ТекСтрокаТовары Из ДанныеЗаполнения.Товары Цикл
			НоваяСтрока = Товары.Добавить();
			НоваяСтрока.Количество = ТекСтрокаТовары.Количество;
			НоваяСтрока.Номенклатура = ТекСтрокаТовары.Номенклатура;
			НоваяСтрока.Сумма = ТекСтрокаТовары.Сумма;
			НоваяСтрока.Цена = ТекСтрокаТовары.Цена;
		КонецЦикла;
	КонецЕсли;
	
КонецПроцедуры

Процедура ОбработкаПроведения(Отказ, Режим)
	
	//Остатки
	Движения.ОстаткиТоваров.Записывать = Истина;
	
	Для Каждого Строка ИЗ Товары Цикл
		
		Движение = Движения.ОстаткиТоваров.Добавить();
		Движение.ВидДвижения = ВидДвиженияНакопления.Приход;
		Движение.Период = Дата;
		Движение.Организация = Организация;
		Движение.Склад = Склад;
		Движение.Номенклатура = Строка.Номенклатура;
		Движение.Количество = Строка.Количество;

	КонецЦикла;
	
КонецПроцедуры
