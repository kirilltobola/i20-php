<?php

function abort($status_code=404): void
{
    http_response_code($status_code);
    require "resources/views/{$status_code}.php";
    die();
}