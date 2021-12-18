<div class="container_middle_right">
	<b>Список модификаций:</b>
<?php
	global $db, $link;
	$files = scandir('./mods/');
	foreach ($files as $file)
	{
	//	echo "$file<br/>";
	}

	$mod_list = $db -> fetch($db -> query($link, "SELECT * FROM ".$sql_prefix."mods"));
	foreach ($mod_list as $mod)
	{
		$name = $mod["name"];
		$link = $mod["link"];
		echo "<a href=\"$link\">$name</a><br/>";
	}
?>
	<br/>
        <form action="./mods/archive.zip">
            <button type="submit" class="btn login">Скачать все моды</button>
        </form>
</div>