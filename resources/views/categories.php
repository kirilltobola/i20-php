<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Категории товаров</title>

    <link rel="stylesheet" type="text/css" href="/resources/css/cards.css">
    <link rel="stylesheet" type="text/css" href="/resources/css/utilities.css">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;300;400;500;700&display=swap" rel="stylesheet">
</head>
<body>
<div class="nav-bar">
    <a class="nav-bar__item p-1" href="/feedback">Оставить отзыв</a>
</div>
<div class="card-container">
    <?php foreach ($results as $result) : ?>
        <div class="card-img">
            <div class="card-img__head card-img__head_blue">
                <p class="card-img__number"><?= $result['count_products'] ?></p>
            </div>
            <div class="card-img__body">
                <p class="card-img__content">
                    <a href="category?category_id=<?= $result['category_id'] ?>&page=1">
                        <?= $result['category_title'] ?>
                    </a>
                </p>
            </div>
        </div>
    <?php endforeach; ?>
</div>
</body>
</html>
