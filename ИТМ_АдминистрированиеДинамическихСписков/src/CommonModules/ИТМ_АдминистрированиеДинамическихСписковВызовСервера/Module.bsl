// @strict-types

#Область СлужебныйПрограммныйИнтерфейс

// см. ИТМ_АдминистрированиеДинамическихСписков.ОбработатьНакопленныеСобытияОбновления
Процедура ОбработатьНакопленныеСобытияОбновления(ИсторияОбновления) Экспорт
	
	ИТМ_АдминистрированиеДинамическихСписков.ОбработатьНакопленныеСобытияОбновления(ИсторияОбновления);
	
КонецПроцедуры

// Данные из ключа списка.
// 
// Параметры:
//  КлючСписка - СправочникСсылка.КлючевыеОперации - Ключ списка
// 
// Возвращаемое значение:
//  Структура - Данные из ключа списка:
// * ПолноеИмяФормы - Строка - Полное имя формы
// * ИмяЭлемента - Строка - Имя элемента ДС
Функция ДанныеИзКлючаСписка(КлючСписка) Экспорт
	
	ПолноеИмяКлюча  = ОбщегоНазначения.ЗначениеРеквизитаОбъекта(КлючСписка, "Имя");
	Разделитель     = ИТМ_АдминистрированиеДинамическихСписковКлиентСервер.РазделительФормыИЭлемента();
	ЧастиИмениКлюча = СтрЗаменить(ПолноеИмяКлюча, Разделитель, Символы.ПС);
	
	Результат = Новый Структура;
	Результат.Вставить("ПолноеИмяФормы", СтрПолучитьСтроку(ЧастиИмениКлюча, 1));
	Результат.Вставить("ИмяЭлемента"   , СтрПолучитьСтроку(ЧастиИмениКлюча, 2));
	
	Возврат Результат;
	
КонецФункции

#КонецОбласти
