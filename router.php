<?php

require 'functions.php';

$path = parse_url($_SERVER['REQUEST_URI'])['path'];
$CONTROLLERS_DIR = __DIR__."/app/controllers/";

$routes = [
    '/categories' => $CONTROLLERS_DIR.'categories.php',
    '/category' => $CONTROLLERS_DIR.'category.php',
    '/product' => $CONTROLLERS_DIR.'product.php',
];

function route(string $path, array $routes): void
{
    if ($path === '/') {
        header("Location: /categories");
        die();
    }

    if (array_key_exists($path, $routes)) {
        require $routes[$path];
    } else {
        abort();
    }
}
route($path, $routes);
