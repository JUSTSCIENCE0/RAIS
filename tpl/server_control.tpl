<div class="container_middle_center">
        <b>Управление сервером: </b><br/>
<?php  
	global $fp_host, $fp_server, $start_time;
	if (isset($_COOKIE['START_TIME']))
	{
		$start_time = intval($_COOKIE['START_TIME']);
	}

	require "./inc/rcon.inc";
	$test_client = new MinecraftClient;

	if (!$fp_host)
	{
		if(isset($action)&&$action=='on_host')
		{
			exec("wakeonlan 70:85:c2:4a:b9:7b");
		}
		include("./tpl/start_host_form.tpl");
	}
	else
	{
		if(!$fp_server)
		{
			if(isset($action)&&$action=='start_server')
			{	
				$start_time = time();
				setcookie('START_TIME', strval($start_time));
				fwrite($fp_host, "start");
			}
			
			if (!$start_time || ((time() - $start_time) > 60))
			{
				include("./tpl/start_server_form.tpl");
			}
			else
			{
				echo "Сервер стартует, обновите статус позже";
			}
		}
		else
		{
			//fclose($fp_server);
			//$test_client->Init("192.168.1.13", 25575);
			//$test_client->Auth("ThisIsMyMinecraftServer1337!");
			
			if(isset($action)&&$action=='send_command')
			{
				$test_client->Init("192.168.1.13", 25575);
				$test_client->Auth("ThisIsMyMinecraftServer1337!");
				$test_client->SendCommand($command);
			}

			include("./tpl/server_control_form.tpl");
		}
	}
?>
</div>