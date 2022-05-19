///////////////////////////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 2022, ООО 1С-Софт
// Все права защищены. Эта программа и сопроводительные материалы предоставляются 
// в соответствии с условиями лицензии Attribution 4.0 International (CC BY 4.0)
// Текст лицензии доступен по ссылке:
// https://creativecommons.org/licenses/by/4.0/legalcode
///////////////////////////////////////////////////////////////////////////////////////////////////////

#Область ОбработчикиСобытийФормы

&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	
	Если ЗначениеЗаполнено(Параметры.РежимВыполнения) Тогда
		ОбщегоНазначенияКлиентСервер.УстановитьЭлементОтбораДинамическогоСписка(Список, "РежимВыполнения", Параметры.РежимВыполнения);
		ОтборРежимВыполнения = Параметры.РежимВыполнения;
	КонецЕсли;
	
КонецПроцедуры

&НаКлиенте
Процедура ОбработкаОповещения(ИмяСобытия, Параметр, Источник)
	Если ВРег(ИмяСобытия) = ВРег("Запись_ОбработчикиОбновления") Тогда
		Элементы.Список.Обновить();
	КонецЕсли;
КонецПроцедуры

#КонецОбласти

#Область ОбработчикиСобытийЭлементовШапкиФормы

&НаКлиенте
Процедура ОтборСтатусПриИзменении(Элемент)
	ОбщегоНазначенияКлиентСервер.УстановитьЭлементОтбораДинамическогоСписка(Список, "Статус", ОтборСтатус, , , ЗначениеЗаполнено(ОтборСтатус));
КонецПроцедуры

&НаКлиенте
Процедура ОтборРежимВыполненияПриИзменении(Элемент)
	ОбщегоНазначенияКлиентСервер.УстановитьЭлементОтбораДинамическогоСписка(Список, "РежимВыполнения", ОтборРежимВыполнения, , , ЗначениеЗаполнено(ОтборРежимВыполнения));
КонецПроцедуры

#КонецОбласти

