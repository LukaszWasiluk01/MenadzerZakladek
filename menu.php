<?php
require("db.php");
?>
<header>
    <nav class="navbar">
        <div class="center-80">
            <a href="index.php">Moje zakładki</a>
            <div class="dropdown">
                <button class="dropbtn">Nazwa_uzytkownika</button>
                <div class="dropdown-content">
                    <a href="grupy-zakladek.php">Moje grupy zakladek</a>
                    <a href="znajomi.php">Znajomi</a>
                    <a href="zaproszenia.php">Oczekujące zaproszenia</a>
                    <a href="preferencje.php">Moje preferencje</a>
                    <a href="logout.php">Wyloguj</a>
                </div>
            </div>
        </div>
    </nav>
</header>