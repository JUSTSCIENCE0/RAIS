<?php
	extract($_REQUEST);
	
	require "./set/global.set";
	require "./set/db.set";
	require "./inc/db.inc";

	$db = new myDB();
	$link = $db -> connect($sql_host, $sql_login, $sql_password, $sql_dbname, $sql_charset);

	require "./inc/functions.inc";
	require "./inc/auth.inc";

	if(!isset($id)||empty($id))
	{
		$id = $startid;
	}

	$page = $db -> fetch($db -> query($link, "SELECT * FROM ".$sql_prefix."structure WHERE id='$id'"));
	
	if($page==null)
	{
		$page = $db -> fetch($db -> query($link, "SELECT * FROM ".$sql_prefix."structure WHERE id='404'"));
	}

	include("./tpl/head.tpl");

	if(session_status()==1)
	{	
		include('./tpl/auth_form.tpl');
	}
	else
	{
		include('./tpl/main_form.tpl');
	}
	
	include("./tpl/foot.tpl");

	$db -> close($link);
?>	
