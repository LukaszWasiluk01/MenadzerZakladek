<?php
$conn = new mysqli("localhost", "root", "", "zakladkidb");
if ($conn->connect_error) {
    exit("Connection failed: " . $conn->connect_error);
}
