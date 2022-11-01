<?php

function abort($status_code=404): void
{
    $code_desc = [
        '404' => "Запрашиваемый ресурс не найден.",
        '500' => "Ошибка на сервере"
    ];

    http_response_code($status_code);
    $desc = $code_desc[$status_code];
    require "resources/views/error.php";
    die();
}

function saveCookies(array $data): void
{
    foreach ($data as $k => $v) {
        setcookie($k, $v, time()+3600, '/');
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
