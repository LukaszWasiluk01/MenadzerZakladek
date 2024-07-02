<?php
require("db.php");
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Menedżer zakładek</title>
    <link rel="stylesheet" href="./Styles/styles.css">
</head>

<body>
    <?php
    require("menu.php");
    ?>
    <main class="text-center">
        <h1>Moje zakładki</h1>
        <div class="center-80">
            <?php
            $sql = "SELECT id, nazwa FROM kategorie";
            $result = $conn->query($sql);
            echo "<a href='index.php'>Wszyskie</a>";
            while ($row = $result->fetch_object()) {
                echo " <a href='index.php?idKat={$row->id}'>{$row->nazwa}</a>";
            }
            ?>
            <form>
                <p>
                    <input type="text" name="fraza">
                    <input type="submit" value="Wyszukaj">
                </p>
            </form>
            <?php
            $sql = "SELECT id, url, opis FROM zakladki";
            if (isset($_GET["idKat"])) {
                $idKat = $_GET["idKat"];
                $sql .= " WHERE idKategorii = $idKat";
            } elseif (isset($_GET["fraza"])) {
                $fraza = $_GET["fraza"];
                $sql .= " WHERE opis LIKE '%$fraza%'";
            }
            $result = $conn->query($sql);

            if ($result->num_rows > 0) {
                echo "<table>";
                while ($row = $result->fetch_assoc()) {
                    echo "<tr>";
                    echo "<td>{$row['opis']}</td>";
                    echo "<td><a href={$row['url']} target='_blank'>Przejdź do linku</a></td>";
                    echo "<td>";
                    echo "<form method='POST' action='delete.php'>";
                    echo "<input type='hidden' name='idZakladki' value='{$row['id']}'>";
                    echo "<input type='submit' value='Usuń zakładkę'>";
                    echo "</form>";
                    echo "</td>";
                    echo "</tr>";
                }
                echo "</table>";
            } else {
                echo "Nie znaleziono żadnych zakładek.";
            }
            ?>
        </div>
    </main>
    <?php
    require("footer.php");
    ?>
</body>

</html>