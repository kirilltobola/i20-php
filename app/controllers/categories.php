<?php
include 'app/DataBaseHandler.php';

$db_handler = new \App\DataBaseHandler();
$results = $db_handler->getCategories();

require "resources/views/categories.php";
