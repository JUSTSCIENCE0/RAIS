<!DOCTYPE html>
<html>
<link rel="stylesheet" type="text/css" href="./tpl/styles.css">

<head>
  <meta charset="UTF-8" />
  <title>Запрос на регистрацию</title>
  <link rel="shortcut icon" href="data/logo.jfif" type="image/x-icon">
</head>

<body>
<div class="bgimg img-glade">

<?php
	extract($_REQUEST);
	
	if(isset($action)&&$action=='request')
	{
		require "./set/global.set";
		require "./set/db.set";
		require "./inc/db.inc";
		$db = new myDB();
		$link = $db -> connect($sql_host, $sql_login, $sql_password, $sql_dbname, $sql_charset);
		$res = $db -> query($link, "INSERT INTO requsts (email, name, nick, description) VALUES ('$email', '$name', '$nick', '$description')");
		$db -> close($link);
	}
?>

    <div class="container">
	<form action="" method="post">
		<input type="hidden" name="action" value="request">
		<label for="email"><b>E-mail</b></label>
		<input type="text" class="use-margin" placeholder="Введите E-mail" name="email" required>
		
		<label for="name"><b>Имя</b></label>
		<input type="text" class="use-margin" placeholder="Введите имя" name="name" required>
		
		<label for="nick"><b>Ник</b></label>
		<input type="text" class="use-margin" placeholder="Введите никнейм в Minecraft" name="nick" required>
		
		<label for="description"><b>Описание</b></label>
		<textarea class="descr" placeholder="Опишите, почему я должен выдать доступ" name="description" required></textarea>

		<button type="submit" class="btn login">Отправить</button>
	</form>
    </div>
</div>
</body>
</html>
