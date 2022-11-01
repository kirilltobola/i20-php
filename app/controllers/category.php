<?php

require 'app/DataBaseHandler.php';

$db_handler = new \App\DataBaseHandler();
$category_id = $_GET['category_id'];
$page = $_GET['page'];

if (!isset($category_id) || !isset($page)) {
    abort();
}
if (!is_numeric($category_id) || !is_numeric($page) || $category_id < 1 || $page < 1) {
    abort();
}

$limit = 12;
$results = $db_handler->getProducts($category_id, $limit, $page);
$current_category = $db_handler->getCategory($category_id)[0];
$products = $db_handler->countProductsInCategory($category_id)[0]['products'];

$disable_backwards = false;
if ($page <= 1) {
    $disable_backwards = true;
}

$disable_forwards = false;
if ($limit * $page >= $products) {
    $disable_forwards = true;
}

if (count($results) < 1) {
    abort();
}

require "resources/views/category.php";
