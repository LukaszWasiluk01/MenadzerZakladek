<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Menedżer zakładek</title>
    <link rel="stylesheet" href="./Styles/styles.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>

<body>
    <?php
    require("menu.php");
    ?>
    <main class="text-center">
        <h1>Moi znajomi</h1>
        <div class="center-80">
            <form>
                <p>
                    <input type="text" name="fraza">
                    <button type="submit" class="search-button">Wyszukaj</button>
                </p>
            </form>
            <?php
            $sql = "SELECT uzytkownicy.id as id, uzytkownicy.login as login, uzytkownicy.awatar as awatar
                    FROM znajomi
                    JOIN uzytkownicy ON znajomi.idUzytkownika2 = uzytkownicy.id
                    WHERE idUzytkownika1 = {$_SESSION['id']}
                    AND (idUzytkownika1, idUzytkownika2) IN (
                        SELECT idUzytkownika2, idUzytkownika1 FROM znajomi
                    )
                    AND idUzytkownika1 <> idUzytkownika2";

            $result = $conn->query($sql);

            if ($result->num_rows > 0) {
                echo "<table>";
                echo "<thead>";
                echo "<th>Awatar</th>";
                echo "<th>Nazwa użytkownika</th>";
                echo "<th>Link do zakładek znajomego</th>";
                echo "<th>Link do usunięcia znajomego</th>";
                echo "<tbody>";
                while ($row = $result->fetch_assoc()) {
                    echo "<tr id={$row['id']}>";
                    echo "<td><img src='./Images/{$row['awatar']}' alt='Avatar' class='avatar'></td>";
                    echo "<td>{$row['login']}</td>";
                    echo "<td><a href='friendBookmarks.php?idZnajomego={$row['id']}&&login={$row['login']}' class='button success-btn'>Przejdz do zakladek znajomego</a></td>";
                    echo "<td><button class='button delete-btn' data-id={$row['id']}>Usuń znajomego</button></td>";
                    echo "</tr>";
                }
                echo "</tbody>";
                echo "</table>";
            } else {
                echo "Nie znaleziono żadnych znajomych.";
            }
            echo "</div>";
            ?>
        </div>
    </main>
    <?php
    require("footer.php");
    ?>
    <script src="./Scripts/friendsScript.js"></script>
</body>

</html>