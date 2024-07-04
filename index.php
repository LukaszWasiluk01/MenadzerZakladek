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
    ?>
    <main class="text-center">
        <h1>Moje zakładki</h1>
        <div class="center-80">
            <?php
            $sql = "SELECT id, nazwa FROM kategorie";
            $result = $conn->query($sql);
            echo "<a href='index.php' class='filter-link'>Wszyskie</a>";
            while ($row = $result->fetch_object()) {
                echo " <a href='index.php?idKat={$row->id}' class='filter-link'>{$row->nazwa}</a>";
            }
            ?>
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
            if (isset($_GET["page"])) {
                $page  = $_GET["page"];
            } else {
                $page = 1;
            }

            $limit = 20;
            $page_index = ($page - 1) * $limit;
            $sqlToCountRecords = str_replace("id, url, opis", "count(*)", $sql);
            $sql .= " LIMIT $page_index, $limit";
            $result = $conn->query($sql);

            if ($result->num_rows > 0) {
                echo "<table>";
                echo "<thead>";
                echo "<th>Opis zakładki</th>";
                echo "<th>Link do adresu URL zakładki</th>";
                echo "<th>Link do edycji zakładki</th>";
                echo "<th>Link do usunięcia zakładki</th>";
                echo "<tbody>";
                while ($row = $result->fetch_assoc()) {
                    echo "<tr>";
                    echo "<td>{$row['opis']}</td>";
                    echo "<td><a href={$row['url']} target='_blank' class='button success-btn'>Przejdź do linku</a></td>";
                    echo "<td><a href='updateForm.php?idZakladki={$row['id']}' class='button update-btn'>Edytuj zakładkę</a></td>";
                    echo "<td>";
                    echo "<form method='POST' action='delete.php'>";
                    echo "<input type='hidden' name='idZakladki' value='{$row['id']}'>";
                    echo "<input type='submit' value='Usuń zakładkę' class='button delete-btn'>";
                    echo "</form>";
                    echo "</td>";
                    echo "</tr>";
                }
                echo "</tbody>";
                echo "</table>";

                $result = $conn->query($sqlToCountRecords);
                $numberOfRecords = $result->fetch_row()[0];
                $total_pages = ceil($numberOfRecords / $limit);
                $params = $_GET;
                echo "<div class='pagination'>";
                if ($page >= 2) {
                    $params['page'] = ($page - 1);
                    $new_query_string = http_build_query($params);
                    echo "<a class='button' href='index.php?" . $new_query_string . "'>Poprzednia strona</a>";
                }

                echo "Strona $page z $total_pages";

                if ($page < $total_pages) {
                    unset($params['page']);
                    $params['page'] = ($page + 1);
                    $new_query_string = http_build_query($params);
                    echo "<a class='button' href='index.php?" . $new_query_string . "'>Następna strona</a>";
                }
            } else {
                echo "Nie znaleziono żadnych zakładek.";
            }
            echo "</div>";
            ?>
        </div>
    </main>
    <?php
    require("footer.php");
    ?>
</body>

</html>