<footer class="text-center">
    <?php
    if (isset($_SESSION["login"])) {
        echo "<input type='text' id='reportText' placeholder='Wpisz treść zgłoszenia'>";
        echo "<button type='button' id='sendReport'>Wyślij zgłoszenie</button>";
        echo "<script src='./Scripts/footerScript.js'></script>";
    }
    ?>
    <p>&copy; 2024 Łukasz Wasiluk</p>
</footer>
<?php
$conn->close();
?>