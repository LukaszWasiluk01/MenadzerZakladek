<?php
require("db.php");
require("session.php");
$idZnajomego = $_POST["idZnajomego"];
$idUzytkownika = $_SESSION["id"];
$sql = "DELETE FROM znajomi WHERE";
$sql .= " (idUzytkownika1=$idZnajomego AND idUzytkownika2=$idUzytkownika)";
$sql .= " OR (idUzytkownika1=$idUzytkownika AND idUzytkownika2=$idZnajomego)";
$conn->query($sql);
$conn->close();
echo "sukces";
