<?php

require 'app/DataBaseHandler.php';
require 'app/FeedbackValidator.php';

use App\FeedbackValidator;

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

    if (count($errors) > 0) {
        $data = $_POST;
        require 'resources/views/feedback.php';
        die();
    }
    saveCookies($_POST);
    $data = $_POST;
    $data['agree'] = '1';

    $db_handler = new \App\DataBaseHandler();
    $db_handler->saveFeedback($data);

    require 'resources/views/success.php';
}
