// @strict-types

#Если Сервер Или ТолстыйКлиентОбычноеПриложение Или ВнешнееСоединение Тогда

#Область ОбработчикиСобытий

Процедура ПередЗаписью(Отказ, Замещение)
	
	Если ОбменДанными.Загрузка Тогда
		Возврат;
	КонецЕсли;
	
	ИменаКоллекций = "Измерения,Ресурсы,Реквизиты";
	УдаляемыеКоллекции = СтрРазделить(ИменаКоллекций, ",");
	МетаданныеРегистра = Метаданные.РегистрыСведений.ИТМ_НастройкиДинамическихСписков;
	
	Для Каждого ТекущаяЗапись Из ЭтотОбъект Цикл
		
		ТекущиеНастройки = ТекущаяЗапись.Настройки.Получить(); //Структура
		Если НЕ ТипЗнч(ТекущиеНастройки) = Тип("Структура") Тогда
			Продолжить;
		КонецЕсли;
		
		Для Каждого ТекущаяКоллекция Из УдаляемыеКоллекции Цикл
			Для Каждого ОписаниеСвойства Из МетаданныеРегистра[ТекущаяКоллекция] Цикл //ОбъектМетаданных
				ТекущиеНастройки.Удалить(ОписаниеСвойства.Имя);
			КонецЦикла;
		КонецЦикла;
		
		ТекущаяЗапись.Настройки = Новый ХранилищеЗначения(ТекущиеНастройки);
		
	КонецЦикла;
	
КонецПроцедуры

#КонецОбласти

#КонецЕсли