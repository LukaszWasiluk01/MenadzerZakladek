<?php
require("db.php");
$id = $_POST["id"];
$idKategorii = $_POST["idKategorii"];
$opis = $_POST["opis"];
$url = $_POST["url"];

$sql = "UPDATE zakladki SET opis='$opis', url='$url', idKategorii=$idKategorii  WHERE id=$id";
$conn->query($sql);
$conn->close();
header("location: index.php");
