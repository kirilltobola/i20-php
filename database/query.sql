-- Получение списка категорий с указанием количества товаров.
SELECT c.id category_id, c.title category_title, c.description category_description, COUNT(T.product_id) count_products
FROM (
    SELECT cp.category_id, cp.product_id
    FROM category_product cp

    UNION

    SELECT c.id category_id, p.id product_id
    FROM categories c
    JOIN products p
    ON c.id = p.main_category_id
) AS T
JOIN categories c
ON c.id = category_id
JOIN products p
ON T.product_id = p.id AND p.active = 1
GROUP BY category_id
ORDER BY count_products DESC;

-- Получение списка категорий с указанием количества товаров + отображение пустых категорий.
SELECT c.id category_id, c.title category_title, c.description category_description, COUNT(T.product_id) count_products
FROM (
    SELECT cp.category_id, cp.product_id
    FROM category_product cp

    UNION

    SELECT c.id category_id, p.id product_id
    FROM categories c
    JOIN products p
    ON c.id = p.main_category_id
) AS T
JOIN products p
ON T.product_id = p.id AND p.active = 1
RIGHT JOIN categories c
ON c.id = category_id
GROUP BY category_id
ORDER BY count_products DESC;

-- Получение списка категорий с указанием количества товаров И показывать категории с количеством товаров >= 2.
SELECT c.id category_id, c.title category_title, c.description category_description, COUNT(T.product_id) count_products
FROM (
    SELECT cp.category_id, cp.product_id
    FROM category_product cp

    UNION

    SELECT c.id category_id, p.id product_id
    FROM categories c
    JOIN products p
    ON c.id = p.main_category_id
) AS T
JOIN products p
ON T.product_id = p.id AND p.active = 1
RIGHT JOIN categories c
ON c.id = category_id
GROUP BY category_id
HAVING count_products >= 2
ORDER BY count_products DESC;

-- Получить список товаров в выбранной категории
SELECT
    product_id,
    p.title product_title,
    p.main_category_id main_category_id,
    c.title main_category_title,
    url image_url,
    alt image_alt,
    c1.id current_category_id,
    c1.title current_category_title,
    c1.description current_category_description
FROM (
    SELECT cp.category_id, cp.product_id
    FROM category_product cp

    UNION

    SELECT c.id category_id, p.id product_id
    FROM categories c
    JOIN products p
    ON c.id = p.main_category_id
) AS T
-- получить информацию о товарах
JOIN products p
ON T.product_id = p.id and p.active = 1
-- для получения заголовка и описания выбранной категории
JOIN categories c1
ON T.category_id = c1.id AND c1.id = 2
-- получить главную категорию товара
JOIN categories c
ON c.id = p.main_category_id
-- получить картинку для анонса
JOIN images i
ON i.id = p.main_image_id
LIMIT 12 OFFSET 0;

-- Получение информации о товаре + главная картинка + главная категория
SELECT 
    p.id product_id, 
    p.title product_title,
    p.price,
    p.price_discount,
    p.price_promo,
    p.description,
    i.url main_image_url,
    i.alt main_image_alt
FROM products p
JOIN images i
ON p.active = 1 AND p.main_image_id = i.id AND p.id = 1
JOIN categories c
ON p.main_category_id = c.id;

-- Получение дополнительных картинок
SELECT i.url, i.alt
FROM images i
JOIN product_image pi
ON i.id = pi.image_id
JOIN products p
ON pi.product_id = p.id AND p.id = 1;

-- Получение доплнительных категорий товара
SELECT c.id, c.title, c.description
FROM categories c
JOIN category_product cp
ON c.id = cp.category_id
JOIN products p
ON cp.product_id = p.id AND p.id = 1;
