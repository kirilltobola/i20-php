<?php

namespace App;

class FeedbackValidator
{
    private string $email_pattern = "/\w+@\w+\.\w+$/";
    private string $date_pattern = "/\d{4}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[01])$/";
    private string $bool_pattern = "/^[01]$/";
    private string $non_empty_pattern = "/.+/";

    public function validateData(array $data): array
    {
        $input_name_pattern = [
            'username' => $this->non_empty_pattern,
            'email' => $this->email_pattern,
            'date_of_birth' => $this->date_pattern,
            'sex' => $this->bool_pattern,
            'subject' => $this->non_empty_pattern,
            'point' => $this->non_empty_pattern,
            'agree' => $this->non_empty_pattern,
        ];

        $errors = [];
        foreach ($input_name_pattern as $input_name => $pattern) {
            if (!array_key_exists($input_name, $data)) {
                $errors[$input_name] = 'error';
                continue;
            }

            if (!$this->validate($data[$input_name], $pattern)) {
                $errors[$input_name] = 'error';
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