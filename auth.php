<!DOCTYPE html>
<html>
<link rel="stylesheet" type="text/css" href="styles.css">
<meta http-equiv="Cache-Control" content="no-cache">

<head>
  <meta charset="UTF-8" />
  <title>Вход на сайт</title>
  <link rel="shortcut icon" href="data/logo.jfif" type="image/x-icon">
</head>

<body>
<div class="bgimg img-island">
    <div class="topleft">
        <p>109.194.35.237</p>
    </div>
    <div class="middle">
		<h1>В разработке</h1>
	</div>
    <div class="container">
	<?php
		include('tpl/form.inc');
	?>	
		
	<form action="registr.html">
	<button type="submit" class="btn register">Запросить доступ</button>
	</form>

	<div class="link_st use-margin">
	<span><a href="forgot.html">Забыли пароль?</a></span>
	</div>
    </div>
</div>
</body>
</html>
