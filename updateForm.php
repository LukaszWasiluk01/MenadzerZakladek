<?php
require("db.php");
?>
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
        <div class="form-center-30">
            <h1>Edytuj zakładkę</h1>
            <?php
            $idZakladki = $_GET["idZakladki"];
            $sql = "SELECT id, idKategorii, url, opis FROM zakladki WHERE id=$idZakladki";
            $result = $conn->query($sql);
            $row = $result->fetch_object();
            $idKategorii = $row->idKategorii;
            ?>
            <form action="update.php" method="POST">
                <input type="hidden" name="id" value="<?= $row->id ?>">
                <p><label for="opis">Opis</label></p>
                <p>
                    <textarea id="opis" name="opis" cols="30" rows="10"><?= $row->opis ?></textarea>
                </p>
                <p><label for="url">URL</label></p>
                <p>
                    <textarea id="url" name="url" cols="30" rows="10"><?= $row->url ?></textarea>
                </p>
                <p>
                    <label for="idKategorii">Kategoria:</label>
                    <select id="idKategorii" name="idKategorii" required>
                        <?php
                        $sql = "SELECT id, nazwa FROM kategorie";
                        $result = $conn->query($sql);
                        while ($row = $result->fetch_object()) {
                            $output = "<option value='{$row->id}'";
                            if ($row->id === $idKategorii) {
                                $output .= " selected";
                            }
                            $output .= ">" . $row->nazwa . "</option>";
                            echo  $output;
                        }
                        ?>
                    </select>
                </p>
                <p>
                    <input type="submit" value="Zapisz zmiany" class="button update-btn">
                </p>
            </form>
            <a href="index.php" class="button delete-btn">Anuluj i wróć do listy swoich zakładek</a>
        </div>
    </main>
    <?php
    require("footer.php");
    ?>
</body>

</html>