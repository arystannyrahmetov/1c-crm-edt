///////////////////////////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 2022, ООО 1С-Софт
// Все права защищены. Эта программа и сопроводительные материалы предоставляются 
// в соответствии с условиями лицензии Attribution 4.0 International (CC BY 4.0)
// Текст лицензии доступен по ссылке:
// https://creativecommons.org/licenses/by/4.0/legalcode
///////////////////////////////////////////////////////////////////////////////////////////////////////

#Если Сервер Или ТолстыйКлиентОбычноеПриложение Или ВнешнееСоединение Тогда

#Область ОписаниеПеременных

#КонецОбласти

#Область ОбработчикиСобытий

Процедура ПередЗаписью(Отказ, Замещение)
	
	Если ОбменДанными.Загрузка Тогда
		Возврат;
	КонецЕсли;
	
	Если Количество() > 0 Тогда
		НовыеИсполнителиЗадач = Выгрузить();
		УстановитьПривилегированныйРежим(Истина);
		ГруппыИсполнителейЗадач = БизнесПроцессыИЗадачиСервер.ГруппыИсполнителейЗадач(НовыеИсполнителиЗадач);
		УстановитьПривилегированныйРежим(Ложь);
		Индекс = 0;
		Для каждого Запись Из ЭтотОбъект Цикл
			Запись.ГруппаИсполнителейЗадач = ГруппыИсполнителейЗадач[Индекс];
			Индекс = Индекс + 1;
		КонецЦикла
	КонецЕсли;
	
КонецПроцедуры

#КонецОбласти

#Иначе
ВызватьИсключение НСтр("ru = 'Недопустимый вызов объекта на клиенте.'");
#КонецЕсли