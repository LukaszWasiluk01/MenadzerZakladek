<?php
$nick = $_SESSION["login"];
$sql = "SELECT rola FROM uzytkownicy WHERE login = '$nick'";
$result = $conn->query($sql);
if ($result->fetch_object()->rola === "admin") {
    $isAdmin = true;
}
else {
    $isAdmin = false;
}