<?php
require("db.php");
require("session.php");
$idZakladki = $_POST["idZakladki"];
$idUzytkownika = $_SESSION["id"];
$sql = "DELETE FROM zakladki WHERE id=$idZakladki AND idUzytkownika=$idUzytkownika";
$conn->query($sql);
$conn->close();
header("location: index.php");
