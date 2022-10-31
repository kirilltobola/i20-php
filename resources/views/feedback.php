<!DOCTYPE html>
<html lang="ru">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Обратная связь</title>

	<link rel="stylesheet" type="text/css" href="resources/css/feedback.css">

	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Raleway:wght@100;200;300;400;500;600;700;800&display=swap" rel="stylesheet">
</head>
<body>
	<div class="parent">
	<div class="form-container">
		<h1 class="form-header">Обратная связь</h1>

		<form method="POST" action="/feedback">
			<div class="form-group">
				<label class="from-group__label" for="username">Имя</label>
				<input type="text" id="username" name="username" class="form-control" value="<?= $data['username'] ?>">
                <div class="alert alert-danger"><?= $errors['username'] ?></div>
			</div>

            <div class="form-group">
                <label class="from-group__label" for="email">email</label>
                <input type="email" id="email" name="email" class="form-control" value="<?= $data['email'] ?>">
                <div class="alert alert-danger"><?= $errors['email'] ?></div>
            </div>

            <div class="form-group">
                <label class="from-group__label" for="date_of_birth">Дата рождения</label>
                <input type="date" id="date_of_birth" name="date_of_birth" class="form-control" value="<?= $data['date_of_birth'] ?>">
                <div class="alert alert-danger"><?= $errors['date_of_birth'] ?></div>
            </div>

            <div class="form-group">
                <fieldset>
                    <legend>Пол</legend>
                    <label class="from-group__label" for="male">Мужчина</label>
                    <input type="radio" id="male" name="sex" class="form-control" value="0" <?php if ($data['sex'] == 0) echo 'checked'; ?>>
                    <label class="from-group__label" for="female">Женщина</label>
                    <input type="radio" id="female" name="sex" class="form-control" value="1" <?php if ($data['sex'] == 1) echo 'checked'; ?>>
                </fieldset>
                <div class="alert alert-danger"><?= $errors['sex'] ?></div>
            </div>

            <div class="form-group">
                <label class="from-group__label" for="subject">Тема обращения</label>
                <input type="text" id="subject" name="subject" class="form-control" value="<?= $data['subject'] ?>">
                <div class="alert alert-danger"><?= $errors['subject'] ?></div>
            </div>

            <div class="form-group">
                <label class="from-group__label" for="point">Суть вопроса</label>
                <textarea id="point" name="point" class="form-control"><?php echo $data['point'] ?></textarea>
                <div class="alert alert-danger"><?= $errors['point'] ?></div>
            </div>

            <div class="form-group form-group_last">
                <label class="from-group__label" for="agree">С контактом ознакомлен</label>
                <input type="checkbox" id="agree" name="agree" class="form-control" <?php if ($data['agree'] == 'on') echo 'checked'; ?>>
                <div class="alert alert-danger"><?= $errors['agree'] ?></div>
            </div>

			<div class="form-group">
				<button class="login-button" type="submit">Отправить</button>
			</div>
		</form>
	</div>
	</div>
</body>
</html>
