<?php
require("db.php");
require("session.php");

$idUzytkownika = $_SESSION["id"];
$tresc = $_POST["reportText"];
$sql = "INSERT INTO zgłoszenia (idUzytkownika, tresc) VALUES ('$idUzytkownika', '$tresc')";
$conn->query($sql);
$conn->close();
echo "sukces";
