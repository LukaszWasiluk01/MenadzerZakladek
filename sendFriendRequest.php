<?php
require("db.php");
require("session.php");
$login = $_POST["login"];
$sql = "SELECT id FROM uzytkownicy WHERE login = '$login'";
$result = $conn->query($sql);
$idZaproszonego = $result->fetch_object()->id;
$idZapraszajacego = $_SESSION["id"];
$sql = "SELECT idUzytkownika1 FROM znajomi WHERE idUzytkownika1 = '$idZapraszajacego' AND idUzytkownika2 = '$idZaproszonego'";
$result = $conn->query($sql);
if ($result->num_rows == 0) {
    $sql = "INSERT INTO znajomi (idUzytkownika1, idUzytkownika2) VALUES ('$idZapraszajacego', '$idZaproszonego')";
    $conn->query($sql);
    echo "sukces";
} else {
    echo "zaproszenie już istnieje";
}
$conn->close();
