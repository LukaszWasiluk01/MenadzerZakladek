<?php
require("db.php");
require("session.php");
$id = $_POST["id"];
$idUzytkownika = $_SESSION['id'];
$idKategorii = $_POST["idKategorii"];
$opis = $_POST["opis"];
$url = $_POST["url"];

$sql = "UPDATE zakladki SET opis='$opis', url='$url', idKategorii=$idKategorii, dataUtworzenia=now() WHERE id=$id AND idUzytkownika=$idUzytkownika";
$conn->query($sql);
$conn->close();
header("location: index.php");
