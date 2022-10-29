<?php

require 'app/DataBaseHandler.php';

$db_handler = new \App\DataBaseHandler();
$results = $db_handler->getProduct($_GET['id']);
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

require "resources/views/product.php";
