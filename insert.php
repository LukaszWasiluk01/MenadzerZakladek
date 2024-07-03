<?php
/* TO DO
require("db.php");
$idUzytkownika = // to do
$idKategorii = $_POST["idKategorii"];
$opis = $_POST["opis"];
$url = $_POST["url"];

$sql = "INSERT INTO zakladki (idKategorii, idUzytkownika, opis, url) VALUES ('$idKategorii', '$idUzytkownika', '$opis', '$url')";
$conn->query($sql);
$conn->close();
*/
header("location: index.php");
