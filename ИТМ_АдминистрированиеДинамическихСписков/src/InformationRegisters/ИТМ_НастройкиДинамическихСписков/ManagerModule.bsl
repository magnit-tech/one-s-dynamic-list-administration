// @strict-types

#Если Сервер Или ТолстыйКлиентОбычноеПриложение Или ВнешнееСоединение Тогда

#Область ПрограммныйИнтерфейс

// Возвращает настройки динамического списка из базы
//
// Параметры:
//  КлючСписка	 - Строка, СправочникСсылка.КлючевыеОперации - Ключ списка
// 
// Возвращаемое значение:
//  см. ИТМ_АдминистрированиеДинамическихСписковКлиентСервер.ШаблонПараметровДинамическогоСписка
Функция НастройкиСписка(Знач КлючСписка) Экспорт
	
	НастройкиСписка = ИТМ_АдминистрированиеДинамическихСписковКлиентСервер.ШаблонПараметровДинамическогоСписка();
	КлючСписка      = ИТМ_АдминистрированиеДинамическихСписков.КлючСписка(КлючСписка);
	Если НЕ ЗначениеЗаполнено(КлючСписка) Тогда
		Возврат НастройкиСписка;
	КонецЕсли;
	
	Запрос = Новый Запрос;
	Запрос.Текст = "ВЫБРАТЬ
	|	Настройки,
	|	КлючСписка,
	|	Использование
	|ИЗ
	|	РегистрСведений.ИТМ_НастройкиДинамическихСписков
	|ГДЕ
	|	КлючСписка = &КлючСписка";
	Запрос.УстановитьПараметр("КлючСписка", КлючСписка);
	РезультатЗапроса = Запрос.Выполнить();
	Если НЕ РезультатЗапроса.Пустой() Тогда
		
		Выборка	= РезультатЗапроса.Выбрать();
		Выборка.Следующий();
		
		Для Каждого КолонкаРезультата Из РезультатЗапроса.Колонки Цикл
			ИмяТекущейКолонки = КолонкаРезультата.Имя;
			ТекущееЗначение   = Выборка[ИмяТекущейКолонки]; //Произвольный
			Если ТипЗнч(ТекущееЗначение) = Тип("ХранилищеЗначения") Тогда
				ЗначениеСтруктурой = ТекущееЗначение.Получить(); //Структура
				ИТМ_АдминистрированиеДинамическихСписковКлиентСервер.ДополнитьСтруктуруРекурсивно(
					НастройкиСписка, ЗначениеСтруктурой, Истина);
			Иначе
				НастройкиСписка.Вставить(ИмяТекущейКолонки, ТекущееЗначение);
			КонецЕсли;
		КонецЦикла;
		
	КонецЕсли;
	
	//@skip-check constructor-function-return-section - Баг ЕДТ
	Возврат НастройкиСписка;
	
КонецФункции

// Добавляет запись в регистр
//
// Параметры:
//  КлючСписка	  - СправочникСсылка.КлючевыеОперации - Ключ списка
//  Использование - Булево - Использование настроек 
//  Настройки     - см. ИТМ_АдминистрированиеДинамическихСписковКлиентСервер.ШаблонПараметровДинамическогоСписка
//
Процедура ДобавитьЗапись(КлючСписка, Использование = Ложь, Настройки = Неопределено) Экспорт
	
	МенеджерЗаписи = НовыйМенеджерЗаписи(КлючСписка, Использование, Настройки);
	МенеджерЗаписи.Записать(Истина);
	
КонецПроцедуры

// Возвращает новый менеджер записи по параметрам
//
// Параметры:
//  КлючСписка	  - СправочникСсылка.КлючевыеОперации - Ключ списка
//  Использование - Булево - Использование настроек 
//  Настройки     - см. ИТМ_АдминистрированиеДинамическихСписковКлиентСервер.ШаблонПараметровДинамическогоСписка
// 
// Возвращаемое значение:
//  РегистрСведенийМенеджерЗаписи.ИТМ_НастройкиДинамическихСписков - Менеджер записи
//
Функция НовыйМенеджерЗаписи(КлючСписка, Использование = Ложь, Настройки = Неопределено) Экспорт
	
	МенеджерЗаписи = СоздатьМенеджерЗаписи();
	МенеджерЗаписи.КлючСписка = КлючСписка;
	МенеджерЗаписи.Использование = Использование;
	МенеджерЗаписи.Настройки = Новый ХранилищеЗначения(Настройки);
	
	Возврат МенеджерЗаписи;
	
КонецФункции

#КонецОбласти

#КонецЕсли
