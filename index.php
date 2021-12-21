<?php
	extract($_REQUEST);
	
	require "./set/global.set";
	require "./set/db.set";
	require "./inc/db.inc";

	$db = new myDB();
	$link = $db -> connect($sql_host, $sql_login, $sql_password, $sql_dbname, $sql_charset);

	require "./inc/functions.inc";
	require "./inc/auth.inc";

	require "./inc/update_psw.inc";

	include("./tpl/head.tpl");

	if(session_status()==1)
	{	
		include('./tpl/auth_form.tpl');
	}
	else
	{
		if ($user['is_first_login'] == 1)
		{
			include('./tpl/change_passwd.tpl');
		}
		else
		{
			include('./tpl/main_form.tpl');
		}
	}
	
	include("./tpl/foot.tpl");

	$db -> close($link);
?>	
