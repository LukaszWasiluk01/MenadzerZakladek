<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Menadżer zakładek</title>
    <link rel="stylesheet" href="./Styles/styles.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>

<body>
    <?php
    require("menu.php");
    if ($isAdmin === false) {
        header("location: index.php");
    }
    ?>
    <main class="text-center">
        <h1>Zgłoszenia</h1>
        <div class="center-80">
            <form>
                <p>
                    <input type="text" name="fraza">
                    <button type="submit" class="search-button">Wyszukaj</button>
                </p>
            </form>
            <?php
            $sql = "SELECT id, url, opis FROM zakladki WHERE idUzytkownika = {$_SESSION['id']}";
            if (isset($_GET["idKat"])) {
                $idKat = $_GET["idKat"];
                $sql .= " AND idKategorii = $idKat";
            } elseif (isset($_GET["fraza"])) {
                $fraza = $_GET["fraza"];
                $sql .= " AND opis LIKE '%$fraza%'";
            }

            $sql = "SELECT z.tresc AS tresc, z.data AS data, u.login AS nick FROM zgłoszenia z, uzytkownicy u WHERE z.idUzytkownika = u.id";
            if (isset($_GET["fraza"])) {
                $fraza = $_GET["fraza"];
                $sql .= " AND z.tresc LIKE '%$fraza%'";
            }
            $sql .= " ORDER BY z.data DESC";
            $result = $conn->query($sql);

            if ($result->num_rows > 0) {
                echo "<table>";
                echo "<thead>";
                echo "<th>Nick</th>";
                echo "<th>Treść</th>";
                echo "<th>Data</th>";
                echo "
                <tbody>";
                while ($row = $result->fetch_object()) {
                    echo "<tr>";
                    echo "<td><p>{$row->nick}</p></td>";
                    echo "<td><p>{$row->tresc}</p></td>";
                    echo "<td><p>{$row->data}</p></td>";
                    echo "</tr>";
                }
                echo "</tbody>";
                echo "
            </table>";
            } else {
                echo "Nie znaleziono żadnych zgłoszeń.";
            }
            echo "
        </div>";
            ?>
        </div>
    </main>
    <?php
    require("footer.php");
    ?>
</body>

</html>