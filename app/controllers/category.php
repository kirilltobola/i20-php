<?php

require 'app/DataBaseHandler.php';

$db_handler = new \App\DataBaseHandler();
$category_id = $_GET['category_id'];
$page = $_GET['page'];
if (!is_numeric($category_id) || !is_numeric($page) || $category_id < 1 || $page < 1) {
    abort();
}

$results = $db_handler->getProducts($category_id, 12, $page);
$current_category = [
    'title' => $results[0]['current_category_title'],
    'description' => $results[0]['current_category_description'],
];

if (count($results) < 1) {
    abort();
}

require "resources/views/category.php";
