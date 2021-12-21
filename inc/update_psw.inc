<?php

if(isset($action)&&$action=='change_passwd')
{
	$psw_hash = md5($new_psw);
	$db -> query($link, "UPDATE ".$sql_prefix."users SET password='$psw_hash', is_first_login=0 WHERE session_id='".session_id()."'");
	
	$user['is_first_login']=0;
}

?>