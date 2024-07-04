<?php
require("db.php");
require("session.php");
?>
<header>
    <nav class="navbar">
        <div class="center-80">
            <a href="index.php">Moje zakładki</a>
            <a href="insertForm.php">Dodaj zakładkę</a>
            <div class="dropdown">
                <button class="dropbtn"><?= $_SESSION["login"] ?><img src="./Images/<?= $_SESSION["awatar"] ?>" alt="Avatar" class="avatar"></button>
                <div class="dropdown-content">
                    <a href="grupy-zakladek.php">Moje grupy zakladek</a>
                    <a href="friends.php">Znajomi</a>
                    <a href="zaproszenia.php">Oczekujące zaproszenia</a>
                    <a href="preferencje.php">Moje preferencje</a>
                    <a href="logout.php">Wyloguj</a>
                </div>
            </div>
        </div>
    </nav>
</header>