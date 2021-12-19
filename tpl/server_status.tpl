<div class="container_middle_left">
        <b>Статус сервера: </b><br/>
<?php
	global $fp_host, $fp_server;

	if ($fp_host = fsockopen('192.168.1.13', 7777, $errCode, $errStr, 1))
	{
		echo "Хост активен<br/>";
		if ($fp_server = fsockopen('192.168.1.13', 25575, $errCode, $errStr, 1))
		{
			echo "Сервер запущен<br/>";
		}
		else
		{
			echo "Сервер отключен<br/>";
		}
	}
	else
	{
		echo "Хост отключен<br/>";
	}
	
	
?>
	<form action="./">
            <button type="submit" class="btn login">Обновить статус</button>
        </form>
</div>