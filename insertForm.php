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
        <h1>Dodaj zakładkę</h1>
        <form action="insert.php" method="POST">
            <p>
                <label for="opis">Opis:</label>
                <textarea id="opis" name="opis" cols="30" rows="10"></textarea>
            </p>
            <p>
                <label for="url">Url:</label>
                <textarea id="url" name="url" cols="30" rows="10"></textarea>
            </p>
            <p>
                <label for="idKategorii">Kategoria:</label>
                <select id="idKategorii" name="idKategorii" required>
                    <?php
                    $sql = "SELECT id, nazwa FROM kategorie";
                    $result = $conn->query($sql);
                    while ($row = $result->fetch_object()) {
                        echo "<option value='{$row->id}'>{$row->nazwa}</option>";
                    }
                    ?>
                </select>
            </p>
            <p>
                <input type="submit" value="Dodaj zakładkę">
            </p>
        </form>
        <a href="index.php">Anuluj i wróć do listy swoich zakładek</a>
        </div>
    </main>
    <?php
    require("footer.php");
    ?>
</body>

</html>