<?php
require("db.php");
$idZakladki = $_POST["idZakladki"];
$sql = "DELETE FROM zakladki WHERE id=$idZakladki";
$conn->query($sql);
$conn->close();
header("location: index.php");
