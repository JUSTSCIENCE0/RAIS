<!DOCTYPE html>
<html>
<link rel="stylesheet" type="text/css" href="styles.css">
<meta http-equiv="Cache-Control" content="no-cache">

<head>
  <meta charset="UTF-8" />
  <title>Сервер майнкрафта</title>
  <link rel="shortcut icon" href="data/logo.jfif" type="image/x-icon">
</head>

<?php
	//extract($_REQUEST);

	//require "./set/global.set";
	//require "./set/db.set";
	//require "./inc/db.inc";

	//$db = new myDB();
	//$link = $db -> connect($sql_host, $sql_login, $sql_password, $sql_dbname, $sql_charset);

	$mysqli = mysqli_connect("127.0.0.1", "science", "MinecraftDatabase2021?", "mine_db");
	mysqli_set_charset($mysql, 'utf8');
	$result = mysqli_query($mysqli, "SELECT * FROM users");
	
	//auth
	if(isset($_POST['action'])&&$_POST['action']=='login')
	{
//		if(!isset($_COOKIE['PHPSESSID']))
//		{
			while($row = mysqli_fetch_assoc($result))
			{
				if($row['login']==$_POST['login']&&$row['password']==md5($_POST['psw']))
				{
					session_start();
				}
			}
//		}
	}

	//logout
	if(isset($_GET['action'])&&$_GET['action']=='logout')
	{	
		unset($_COOKIE['PHPSESSID']);
		setcookie(session_name(), '');
	}
?>

<body>
<?php
	if(session_status()==1)
	{	
		include('tpl/auth_form.inc');
	}
	else
	{
		include('tpl/main_form.inc');
	}
?>	
</body>
</html>
