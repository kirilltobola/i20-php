<?php

require 'functions.php';

$path = parse_url($_SERVER['REQUEST_URI'])['path'];
$controllers_dir = __DIR__."/app/controllers/";

$routes = [
    '/categories' => $controllers_dir.'categories.php',
    '/category' => $controllers_dir.'category.php',
    '/product' => $controllers_dir.'product.php',
    '/feedback' => $controllers_dir.'feedback.php',
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
