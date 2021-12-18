<div class="bgimg img-lake">
    <div class="topmenu"><span class="lnkspan">
	<b>Сервер - 109.194.35.237:55555</b>
	<a class="lnk topright" href="?action=logout">Выйти</a>
    </span></div>
    <div class="main_logo"> </div>
<?php
    include("./tpl/server_status.tpl");
    include("./tpl/mods_list.tpl");

    if ($user['is_admin'] == 1 )
    {
	include("./tpl/server_control.tpl");
    }
?>
</div>
