<?php
/*
 * Shoputils
 *
 * ПРИМЕЧАНИЕ К ЛИЦЕНЗИОННОМУ СОГЛАШЕНИЮ
 *
 * Этот файл связан лицензионным соглашением, которое можно найти в архиве,
 * вместе с этим файлом. Файл лицензии называется: LICENSE.1.5.x.RUS.txt
 * Так же лицензионное соглашение можно найти по адресу:
 * http://opencart.shoputils.ru/LICENSE.1.5.x.RUS.txt
 * 
 * =================================================================
 * OPENCART 1.5.x ПРИМЕЧАНИЕ ПО ИСПОЛЬЗОВАНИЮ
 * =================================================================
 *  Этот файл предназначен для Opencart 1.5.x. Shoputils не
 *  гарантирует правильную работу этого расширения на любой другой 
 *  версии Opencart, кроме Opencart 1.5.x. 
 *  Shoputils не поддерживает программное обеспечение для других 
 *  версий Opencart.
 * =================================================================
*/

$_['heading_title']               = 'Интеркасса 2.0';

// Tab 
$_['tab_log']                     = 'Журнал';

// Text 
$_['text_payment']                = 'Оплата';
$_['text_success']                = 'Настройки модуля обновлены!';
$_['text_shoputils_ik']           = '<a onclick="window.open(\'http://www.interkassa.com/\');"><img src="../image/payment/shoputils_ik.jpg" alt="Interkassa.com" title="Interkassa.com"/></a>';
$_['text_order_status_cart']      = 'Корзина';
$_['text_ik_log_off']             = 'Выключен';
$_['text_ik_log_short']           = 'Частичный (Только результары операций)';
$_['text_ik_log_full']            = 'Полный (Все запросы)';

$_['text_ik_parameters']          = 'Параметры для настройки приема платежей через Интеркассу';
$_['text_ik_urls']                = 'В разделе "Мои кассы -> Настройки кассы -> Интерфейс" необходимо везде установить следующие значения:<br />
<b>"Тип запроса" - "POST"<br />
везде выключить "Разрешить переопределять в запросе "</b><br>';


// Entry
$_['entry_ik_log']                = 'Журнал:';
$_['entry_ik_log_help']           = 'Журнал запросов от Интеркассы сохраняется в файле: system/logs/shoputils_ik.txt';
$_['entry_ik_shop_id']            = 'Идентификатор кассы:';
$_['entry_ik_shop_id_help']       = 'Идентификатор кассы зарегистрированного в системе «INTERKASSA». Узнать его можно в разделе «Мои кассы». Пример: 529a6e08bf4efcae2d1b8488
';
$_['entry_ik_sign_hash']          = 'Секретный ключ:';
$_['entry_ik_sign_hash_help']     = 'Используется SCI (Интеркассой) при формировании цифровой подписи. Должен совпадать с секретным ключем в разделе "Мои кассы -> Настройки кассы -> Безопасность -> Секретный ключ".';
$_['entry_ik_sign_test_key']      = 'Тестовый ключ:';
$_['entry_ik_sign_test_key_help'] = 'Используется SCI (Интеркассой) при формировании цифровой подписи, если платеж был совершен через тестовую платежную систему. Должен совпадать с тестовым ключем в разделе "Мои кассы -> Настройки кассы -> Безопасность -> Тестовый ключ".';

$_['entry_ik_currency']           = 'Валюта магазина:';
$_['entry_ik_currency_help']      = 'Валюта, в которой магазин передает сумму платежа на платежный шлюз "Интеркасса". На 01.12.2013 Интеркасса принимает следующие валюты: RUB, UAH, EUR, USD.';
$_['entry_ik_test_mode']          = 'Тестовый режим:';
$_['entry_ik_test_mode_help']     = 'В тестовом режиме можно проверить настройки модуля и Интеркассы через тестовую валюту Интеркассы, выбрав при оплате "Тестовая платежная система". В этом случае для подписывания ЭЦП (электронной цифровой подписи) используется тестовый ключ. Для приема реальных платежей - тестовый режим необходимо выключить.';
$_['entry_log_file']              = 'Файл журнала:';
$_['entry_log_file_help']         = 'Последние %d строк из файла журнала.';
$_['entry_status']                = 'Статус:';
$_['entry_order_status']          = 'Статус заказа после оплаты:';
$_['entry_geo_zone']              = 'Географическая зона:';
$_['entry_sort_order']            = 'Порядок сортировки:';
$_['entry_ik_success_url']        = 'URL успешной оплаты:';
$_['entry_ik_fail_url']           = 'URL неуспешной оплаты :';
$_['entry_ik_pending_url']        = 'URL ожидания проведения платежа:';
$_['entry_ik_status_url']         = 'URL взаимодействия :';


// Error
$_['error_permission']            = 'У Вас нет прав для управления этим модулем!';
$_['error_ik_shop_id']            = 'Необходимо заполнить поле "Идентификатор кассы"!';
$_['error_ik_sign_hash']          = 'Необходимо заполнить поле "Секретный ключ"!';
$_['error_ik_sign_test_key']      = 'Необходимо заполнить поле "Тестовый ключ"!';
?>