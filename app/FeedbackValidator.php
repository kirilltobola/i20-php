<?php

namespace App;

class FeedbackValidator
{
    private string $email_pattern = "/\w+@\w+\.\w+$/";
    private string $date_pattern = "/\d{4}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[01])$/";
    private string $bool_pattern = "/^[01]$/";
    private string $non_empty_pattern = "/[\S]+/";

    public function validateData(array $data): array
    {
        $input_name_pattern = [
            'username' => [$this->non_empty_pattern, "Обязательное поле"],
            'email' => [$this->email_pattern, "Поле может содержать только латиницу <br> и следующие символы: ._-@"],
            'date_of_birth' => [$this->date_pattern, "Допустимый формат даты: yyyy-mm-dd"],
            'sex' => [$this->bool_pattern, "Обязательное поле"],
            'subject' => [$this->non_empty_pattern, "Обязательное поле"],
            'point' => [$this->non_empty_pattern, "Обязательное поле"],
            'agree' => [$this->non_empty_pattern, "Обязательное поле"],
        ];

        $errors = [];
        foreach ($input_name_pattern as $input_name => $pattern) {
            if (!array_key_exists($input_name, $data)) {
                $errors[$input_name] = $pattern[1];
                continue;
            }

            if (!$this->validate($data[$input_name], $pattern[0])) {
                $errors[$input_name] = $pattern[1];
            }
        }
        return $errors;
    }

    private function validate(string $subject, string $pattern): bool
    {
        preg_match($pattern, $subject, $matches);
        if (count($matches) > 0) {
            return true;
        }
        return false;
    }
}