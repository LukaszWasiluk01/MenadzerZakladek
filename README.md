# MenadzerZakladek
Projekt indywidualny "Menadżer zakładek" wykonany na przedmiot "Podstawy technologii WWW" przez Łukasza Wasiluka.

# Wymagania

- [XAMPP](https://www.apachefriends.org/pl/index.html)

# Instrukcja przygotowania serwera apache

1. Uruchom XAMPP Control Panel
1. Naciśnij przycisk z napisem "Explorer", który otworzy eksplorator plików
1. Odszukaj katalog htdocs i umieść w nim folder z aplikacją webową (menedzerZakladek)

# Instrukcja przygotowania systemu bazodanowego

1. Uruchom XAMPP Control Panel
1. Uruchom system bazodanowy MySQL za pomocą przycisku "Start" w odpowiednim wierszu
1. Przejdź do panelu administracyjnego klikając przycisk "Admin"
1. W panelu administracyjnym wybierz "Databases" z menu wyborów
1. Utwórz bazę danych o nazwie "zakladkidb" i ustaw kodowanie na utf8_polish_ci
1. Następnie z menu na górze panelu wybierz "import"
1. Wybierz plik "zakladkidb.sql", który został dostarczony wraz z aplikacją webową
1. Na koniec kliknij przycisk "Import", aby zakończyć importowanie bazy danych

# Instrukcja uruchomienia projektu
1. Uruchom XAMPP Control Panel
1. Upewnij się, że zostało wykonane przygotowanie systemu apache i systemu bazodanowego
1. Naciśnij przycisk "Start" w wierszach odpowiadających serwerowi apache oraz systemowi bazodanowemu MySQL.
1. Przejdź na adres [http://localhost/menadzerZakladek/](http://localhost/menadzerZakladek/)