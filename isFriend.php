<?php
if (isset($_GET["idZnajomego"])) {
    $sql = "SELECT count(*) FROM znajomi";
    $sql .= " WHERE (idUzytkownika1 = {$_SESSION['id']} AND idUzytkownika2 = {$_GET['idZnajomego']})";
    $sql .= " OR (idUzytkownika1 = {$_GET['idZnajomego']} AND idUzytkownika2 = {$_SESSION['id']})";
    $result = $conn->query($sql);
    $numberOfRecords = $result->fetch_row()[0];
    if ($numberOfRecords !== 2){
        header("index.php");
    }
} else {
    header("index.php");
}
