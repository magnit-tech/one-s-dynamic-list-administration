// @strict-types
// @skip-check module-empty-method

#Область СлужебныйПрограммныйИнтерфейс

#Область СобытияФорм
	
// Событие подключенной формы списка "ПриСозданииНаСервере"
// 
// Параметры:
//  Форма					 - ФормаКлиентскогоПриложения - Управляемая форма
//  ДополнительныеПараметры	 - Структура, Неопределено - Дополнительные параметры
// 
Процедура ПриСозданииНаСервере(Форма, Знач ДополнительныеПараметры = Неопределено) Экспорт
	
	
	
КонецПроцедуры

#КонецОбласти

#Область ПрименениеНастроек

// Выполняется перед применением настройки подсистемы к списку.
// 
// Параметры:
//  Форма - ФормаКлиентскогоПриложения - Форма
//  ОбщиеНастройки - см. ИТМ_АдминистрированиеДинамическихСписковКлиентСервер.НастройкиНаФорме
//  НастройкиСписка - см. ИТМ_АдминистрированиеДинамическихСписковКлиентСервер.ШаблонПараметровДинамическогоСписка
//	СтандартнаяОбработка - Булево - Признак стандартной обработки для основной процедуры
// 
Процедура ПередПрименениемНастройкиПодсистемыКСписку(Форма, ОбщиеНастройки, НастройкиСписка, СтандартнаяОбработка) Экспорт
	
	
	
КонецПроцедуры

// Выполняется после применением настройки подсистемы к списку.
// 
// Параметры:
//  Форма - ФормаКлиентскогоПриложения - Форма
//  ОбщиеНастройки - см. ИТМ_АдминистрированиеДинамическихСписковКлиентСервер.НастройкиНаФорме
//  НастройкиСписка - см. ИТМ_АдминистрированиеДинамическихСписковКлиентСервер.ШаблонПараметровДинамическогоСписка
//  
Процедура ПослеПримененияНастройкиПодсистемыКСписку(Форма, ОбщиеНастройки, НастройкиСписка) Экспорт
	
	
	
КонецПроцедуры

#КонецОбласти

#КонецОбласти
