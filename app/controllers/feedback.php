<?php

require 'app/DataBaseHandler.php';
require 'app/FeedbackValidator.php';

use App\FeedbackValidator;

// TODO: move to functions.php
function saveCookies(array $data): void
{
    foreach ($data as $k => $v) {
        setcookie($k, $v, time()+160, '/');
    }
}

function getCookies(array $data): array
{
    $res = [];
    foreach ($data as $key) {
        $res[$key] = $_COOKIE[$key];
    }
    return $res;
}

if ($_SERVER['REQUEST_METHOD'] === 'GET') {
    $data = getCookies([
       'username',
       'email',
       'date_of_birth',
       'sex'
    ]);

    require 'resources/views/feedback.php';
} else {
    $validator = new FeedbackValidator();
    $errors = $validator->validateData($_POST);

    //var_dump($errors);
    if (count($errors) > 0) {
        $data = $_POST;
        require 'resources/views/feedback.php';
        die();
    }
    saveCookies($_POST);
    $data = $_POST;
    $data['agree'] = '1';
    //var_dump($data);

    $db_handler = new \App\DataBaseHandler();
    $db_handler->saveFeedback($data);

    require 'resources/views/success.php';
}
