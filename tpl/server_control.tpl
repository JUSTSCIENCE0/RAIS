<div class="container_middle_center">
        <b>Управление сервером: </b><br/>
<?php  
	global $fp_host, $fp_server;

	require "./inc/rcon.inc";
	$test_client = new MinecraftClient;

	if (!$fp_host)
	{
		include("./tpl/start_host_form.tpl");
	}
	else
	{
		if(!$fp_server)
		{
			include("./tpl/start_server_form.tpl");
		}
		else
		{
			//fclose($fp_server);
			
			if(isset($action)&&$action=='send_command')
			{
				echo "$command<br/>";
				$test_client->Init("192.168.1.13", 25575);
				$test_client->Auth("ThisIsMyMinecraftServer1337!");
				$test_client->SendCommand($command);
			}

			include("./tpl/server_control_form.tpl");
		}
	}
?>
</div>