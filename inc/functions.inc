<?php
function getElementsByGroup($groupid){
global $db,$link,$sql_prefix;
    $group = null;
    $group["params"] = $db -> fetch($db -> query($link, "SELECT * FROM ".$sql_prefix."structure WHERE id='$groupid'"));
    $group["elements"] = $db -> fetch($db -> query($link, "SELECT * FROM ".$sql_prefix."structure WHERE parent='$groupid'"));
    return $group;
}
?>