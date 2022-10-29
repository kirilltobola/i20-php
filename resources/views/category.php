<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Категория товаров</title>

    <link rel="stylesheet" href="/resources/css/category.css">
</head>
<body>
    <div style="margin-left: 5%">
        <h1><?= $current_category['title'] ?></h1>
        <span><?= $current_category['description'] ?></span>
    </div>
    <div class="product_container">

    <?php foreach ($results as $result) : ?>
        <div class="product_item">
            <div>
                <img width="300" height="300" src="<?= $result['image_url'] ?>" alt="<?= $result['image_alt'] ?>">
            </div>
            <div class="product_desc">
                <h3>
                    <a href="product?id=<?= $result['product_id'] ?>"><?= $result['product_title'] ?></a>
                </h3>
                <a href="category?category_id=<?= $result['main_category_id'] ?>&page=1"><?= $result['main_category_title'] ?></a>
            </div>
        </div>
    <?php endforeach; ?>
    </div>
</body>
</html>
