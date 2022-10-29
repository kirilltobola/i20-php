<?php

require 'app/DataBaseHandler.php';

$db_handler = new \App\DataBaseHandler();
$results = $db_handler->getProducts($_GET['category_id']);
$current_category = [
    'title' => $results[0]['current_category_title'],
    'description' => $results[0]['current_category_description'],
];

if (count($results) < 1) {
    abort();
}

require "resources/views/category.php";
