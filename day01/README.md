## Упражнение 00
Необходимо написать SQL-запрос, который вернет идентификаторы меню и названия пицц из таблицы `menu` и идентификаторы и имена персон из таблицы `person`. Результат должен быть отсортирован сначала по идентификатору объекта, затем по названию объекта.

## Упражнение 01
Измените SQL-запрос из Упражнения 00, убрав столбец object_id и изменив сортировку: сначала для части данных из таблицы `person`, затем из таблицы `menu`. Дубликаты должны сохраняться.

## Упражнение 02
Напишите SQL-запрос, который вернет уникальные названия пицц из таблицы `menu`, отсортированные по названию пиццы в убывающем порядке.

## Упражнение 03
Верните общие строки для атрибутов order_date, person_id из таблицы `person_order` с одной стороны и visit_date, person_id из таблицы `person_visits` с другой стороны. Результирующий набор должен быть отсортирован по action_date в возрастающем порядке, затем по person_id в убывающем порядке.

## Упражнение 04
Напишите SQL-запрос, который вернет разницу значений столбца person_id между таблицами `person_order` и `person_visits` для order_date и visit_date 7 января 2022 года с сохранением дубликатов.

## Упражнение 05
Напишите SQL-запрос, который вернет все возможные комбинации между таблицами `person` и `pizzeria`, отсортированные сначала по идентификатору персоны, затем по идентификатору пиццерии.

## Упражнение 06
Измените SQL-запрос из Упражнения 03, чтобы вернуть имена персон вместо идентификаторов и сортировать по action_date в возрастающем порядке, затем по person_name в убывающем.

## Упражнение 07
Напишите SQL-запрос, который вернет дату заказа из таблицы `person_order` и соответствующее имя персоны, сделавшей заказ, из таблицы `person`. Результат должен быть отсортирован по обоим столбцам в порядке возрастания.

## Упражнение 08
Перепишите SQL-запрос из Упражнения 07, используя NATURAL JOIN. Результат должен быть идентичен.

## Упражнение 09
Напишите 2 SQL-запроса, которые вернут список названий пиццерий, не посещенных персонами, используя операторы IN и EXISTS.

## Упражнение 10
Напишите SQL-запрос, который вернет список имен персон, сделавших заказ на пиццу в соответствующей пиццерии. Результат должен быть отсортирован по 3 столбцам: person_name, pizza_name, pizzeria_name в порядке возрастания.