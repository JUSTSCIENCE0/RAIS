<?php
    class myDB {

    function connect($sql_host, $sql_login, $sql_password, $sql_dbname, $sql_charset){
	$link = new mysqli($sql_host, $sql_login, $sql_password, $sql_dbname);
	if (mysqli_connect_errno()) {
	    printf("Подключение к серверу MySQL невозможно. Код ошибки: %s\n", mysqli_connect_error());
	    exit;
	}
	$link -> set_charset($sql_charset);
    return $link;
    }

    function query($link, $query_str) {
	$query = $link -> query("$query_str");
    return $query;
    }

    function fetch($query) {
    $res = null;
	$count=1;
	while($row = $query -> fetch_assoc()){
	    foreach($row as $key => $val){
	    $res[$count][$key]=$val;
	    }
	    $count++;
	}
    return $res;
    }

    function close($link) {
	$link -> close();
    }
}
?>