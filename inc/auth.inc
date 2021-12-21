<?php
global $db, $link, $action, $login, $password, $_COOKIE, $user, $_SESSION;

if(isset($_COOKIE['PHPSESSID'])){
    $user['sessionid']=$_COOKIE['PHPSESSID'];
}

$users = null;

$users = $db -> fetch($db -> query($link, "SELECT * FROM ".$sql_prefix."users WHERE login='$login'"));

if(!isset($_COOKIE['PHPSESSID'])){
    if(isset($action)&&$action=='login'){
	if(($users[1]["login"]==$login)&&($users[1]["password"]==md5($psw))){
	    session_start();
	    $query = $db -> query($link, "UPDATE ".$sql_prefix."users SET session_id='".session_id()."' WHERE login='".$login."'");
	    $curentuser = $db -> fetch($db -> query($link, "SELECT * FROM ".$sql_prefix."users WHERE session_id='".session_id()."'"));
	    $user['id']=$curentuser[1]['id'];
	    $user['login']=$curentuser[1]['login'];
	    $user['is_admin']=$curentuser[1]['is_admin'];
	    $user['is_first_login']=$curentuser[1]['is_first_login'];
	}
    }
}else{
    $curentuser = $db -> fetch($db -> query($link, "SELECT * FROM ".$sql_prefix."users WHERE session_id='".$user['sessionid']."'"));
    $user['id']=$curentuser[1]['id'];
    $user['login']=$curentuser[1]['login'];
    $user['is_admin']=$curentuser[1]['is_admin'];
    $user['is_first_login']=$curentuser[1]['is_first_login'];
    session_start();
}

if(isset($action)&&$action=='logout'){
    $query = $db -> query($link, "UPDATE ".$sql_prefix."users SET session_id='' WHERE login='".$user['login']."'");
    $user['id']='0';
    $user['login']='';
    $user['sessionid']='';
    unset($_COOKIE['PHPSESSID']);
    setcookie(session_name(),'');
    session_destroy();
}
?>