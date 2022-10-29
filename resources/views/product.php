<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Товар</title>

    <!--  fonts  -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;1,100;1,300;1,400&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="resources/css/utilities.css">
    <link rel="stylesheet" href="resources/css/product.css">
    <link rel="stylesheet" href="resources/css/notification.css">


    <script src="resources/js/product.js"></script>
</head>
<body>
<div id="notification-container" class="notification-container">
    <div id="notification-content" class="notification-content"></div>
</div>

<div class="container">
    <div class="scroll ml-2 mt-2">
        <?php foreach ($images as $image) : ?>
            <div class="scroll__item mt-2">
                <img class="image_small" src="<?= $image['url'] ?>" alt="<?= $image['alt'] ?>">
            </div>
        <?php endforeach; ?>

        <div class="scroll__footer mt-2" style="text-align: center">
            <button class="btn scroll__btn">
                <img src="/resources/static/arrow-down.svg" alt="arrow down">
            </button>
        </div>
    </div>

    <div class="image-container mt-3">
        <img id="zoomed-image" class="image" src="<?= $images[0]['url'] ?>" alt="<?= $images[0]['alt'] ?>">
    </div>

    <div class="product mt-3">
        <h1 class="product__name"><?= $main_info['product_title'] ?></h1>

        <div class="product__categories mt-2 w-600">
            <?php foreach ($categories as $category) : ?>
                <a class="link" href="category?category_id=<?= $category['id'] ?>&page=1"><?= $category['title'] ?></a>
            <?php endforeach; ?>
        </div>

        <div class="product__price mt-3 w-400">
            <div>
                <span class="price price_old"><?= $main_info['price'] ?></span>
                &nbsp;
                <span class="price price_rub price_discount"><?= $main_info['price_discount'] ?></span>
            </div>

            <div>
                <span class="price price_rub"><?= $main_info['price_promo'] ?></span> &mdash; c промокодом
            </div>
        </div>

        <div class="product__delivery p-2 mt-2 w-400">
            <div>
                <img src="/resources/static/check-lg.svg" alt="check">
                <span class="ml-1">В наличии в магазине <a class="link" href="#">Lamoda</a></span>
            </div>
            <div class="mt-1">
                <img src="/resources/static/truck.svg" alt="truck">
                <span class="ml-1">Бесплатная доставка</span>
            </div>
        </div>

        <div class="counter mt-3">
            <button id="minus" class="btn btn_counter btn_disabled" disabled>
                <img height="25" src="/resources/static/dash.svg" alt="dash">
            </button>

            <input readonly type="number" id="cnt" class="counter__value" value="1">

            <button id="plus" class="btn btn_counter">
                <img height="25" src="/resources/static/plus.svg" alt="plus">
            </button>
        </div>

        <div class="mt-2">
            <button id="buy-btn" class="btn btn_action btn_primary">Купить</button>
            <button class="btn btn_action ml-2">В избранное</button>
        </div>

        <div class="product__description mt-3">
            <?= $main_info['description'] ?>
        </div>

        <div class="product__share w-400 mt-3">
            <span>ПОДЕЛИТЬСЯ:</span>
            <div class="btn-container_share">
                <button class="btn btn_share ml-2">
                    <img src="/resources/static/telegram.svg" width="24" height="33" alt="telegram">
                </button>
                <button class="btn btn_share ml-1">
                    <img src="/resources/static/google.svg" width="24" height="33" alt="google">
                </button>
                <button class="btn btn_share ml-1">
                    <img src="/resources/static/facebook.svg" width="24" height="33" alt="facebook">
                </button>
                <button class="btn btn_share ml-1">
                    <img src="/resources/static/twitter.svg" width="24" height="33" alt="twitter">
                </button>

                <div class="container-share-btn ml-2">
                    <button class="btn share_counter">123</button>
                    <span class="triangle-left"></span>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
