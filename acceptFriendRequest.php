<?php
require("db.php");
require("session.php");
$idZapraszajacego = $_POST["idZapraszajacego"];
$idUzytkownika = $_SESSION["id"];
$sql = "INSERT INTO znajomi (idUzytkownika1, idUzytkownika2) VALUES ('$idUzytkownika', '$idZapraszajacego')";
$conn->query($sql);
$conn->close();
echo "sukces";