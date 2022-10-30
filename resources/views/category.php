<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Категория товаров</title>

    <!--  fonts  -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;1,100;1,300;1,400&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="/resources/css/category.css">
    <link rel="stylesheet" href="/resources/css/utilities.css">
</head>
<body>
    <a class="go-back-btn ml-2" href="/categories">Назад</a>
    <div class="ml-2">
        <h1><?= $current_category['title'] ?></h1>
        <span><?= $current_category['description'] ?></span>
    </div>
    <div class="product_container mt-2 ml-2">

    <?php foreach ($results as $result) : ?>
        <div class="product_item mt-1 ml-1">
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
