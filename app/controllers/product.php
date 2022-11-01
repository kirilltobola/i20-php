<?php

require 'app/DataBaseHandler.php';

$db_handler = new \App\DataBaseHandler();
$product_id = $_GET['id'];
if (!is_numeric($product_id) || $product_id < 1) {
    abort();
}

$results = $db_handler->getProduct($product_id);
$main_info = $results['main_info'][0];
if (!isset($main_info) || count($main_info) < 1) {
    abort();
}

$images = $results['images'];
array_unshift(
    $images,
    [
        'url' => $main_info['main_image_url'],
        'alt' => $main_info['main_image_alt'],
    ]
);

$categories = $results['categories'];
array_unshift(
    $categories,
    [
        'id' => $main_info['main_category_id'],
        'title' => $main_info['main_category_title'],
        'desc' => 'some desk'
    ]
);

$go_back_url = "/category?category_id={$main_info['main_category_id']}&page=1";
if(isset($_SERVER['HTTP_REFERER'])) {
    $parsed_url = parse_url($_SERVER['HTTP_REFERER']);
    $query = $parsed_url['query'];
    $path = $parsed_url['path'];

    if ($path == '/category') {
        parse_str($query, $get_array);
        foreach ($categories as $category) {
            if ($category['id'] == $get_array['category_id']) {
                $go_back_url = $_SERVER['HTTP_REFERER'];
            }
        }
    }
}
require "resources/views/product.php";