-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Lip 02, 2024 at 07:51 PM
-- Wersja serwera: 10.4.32-MariaDB
-- Wersja PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `zakladkidb`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `kategorie`
--

CREATE TABLE `kategorie` (
  `id` int(10) UNSIGNED NOT NULL,
  `nazwa` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Dumping data for table `kategorie`
--

INSERT INTO `kategorie` (`id`, `nazwa`) VALUES
(1, 'youtube'),
(2, 'netflix'),
(3, 'blogi');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `kolekcjaprawa`
--

CREATE TABLE `kolekcjaprawa` (
  `idKolekcjaZakladek` int(10) UNSIGNED NOT NULL,
  `idUzytkownika` int(10) UNSIGNED NOT NULL,
  `tylkoOdczyt` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Dumping data for table `kolekcjaprawa`
--

INSERT INTO `kolekcjaprawa` (`idKolekcjaZakladek`, `idUzytkownika`, `tylkoOdczyt`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `kolekcjazakladek`
--

CREATE TABLE `kolekcjazakladek` (
  `id` int(10) UNSIGNED NOT NULL,
  `idUzytkownika` int(10) UNSIGNED NOT NULL,
  `nazwa` varchar(64) NOT NULL,
  `opis` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Dumping data for table `kolekcjazakladek`
--

INSERT INTO `kolekcjazakladek` (`id`, `idUzytkownika`, `nazwa`, `opis`) VALUES
(1, 2, 'Strony z filmami', 'To są wszystkie znane mi strony z filmami.');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `preferencje`
--

CREATE TABLE `preferencje` (
  `idUzytkownika` int(10) UNSIGNED NOT NULL,
  `rozmiarCzcionki` int(11) NOT NULL DEFAULT 16,
  `czyCiemneTlo` tinyint(1) NOT NULL DEFAULT 0,
  `czyPrywatny` tinyint(1) NOT NULL DEFAULT 0,
  `czyTylkoZnajomi` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Dumping data for table `preferencje`
--

INSERT INTO `preferencje` (`idUzytkownika`, `rozmiarCzcionki`, `czyCiemneTlo`, `czyPrywatny`, `czyTylkoZnajomi`) VALUES
(1, 16, 0, 0, 0),
(2, 16, 0, 0, 0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `uzytkownicy`
--

CREATE TABLE `uzytkownicy` (
  `id` int(10) UNSIGNED NOT NULL,
  `login` varchar(64) NOT NULL,
  `haslo` varchar(64) NOT NULL,
  `email` varchar(64) NOT NULL,
  `rola` varchar(64) NOT NULL DEFAULT 'user',
  `utworzonyData` timestamp NOT NULL DEFAULT current_timestamp(),
  `awatar` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Dumping data for table `uzytkownicy`
--

INSERT INTO `uzytkownicy` (`id`, `login`, `haslo`, `email`, `rola`, `utworzonyData`, `awatar`) VALUES
(1, 'admin', 'admin', 'admin@example.com', 'admin', '2024-07-02 17:41:23', 'admin.jpg'),
(2, 'test', 'test', 'test@example.com', 'user', '2024-07-02 17:41:47', 'test.jpg');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zakladkakolekcji`
--

CREATE TABLE `zakladkakolekcji` (
  `idKolekcjaZakladek` int(10) UNSIGNED NOT NULL,
  `idZakladki` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Dumping data for table `zakladkakolekcji`
--

INSERT INTO `zakladkakolekcji` (`idKolekcjaZakladek`, `idZakladki`) VALUES
(1, 2);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zakladki`
--

CREATE TABLE `zakladki` (
  `id` int(10) UNSIGNED NOT NULL,
  `idUzytkownika` int(10) UNSIGNED NOT NULL,
  `idKategorii` int(10) UNSIGNED NOT NULL,
  `url` text NOT NULL,
  `opis` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Dumping data for table `zakladki`
--

INSERT INTO `zakladki` (`id`, `idUzytkownika`, `idKategorii`, `url`, `opis`) VALUES
(1, 2, 1, 'https://www.youtube.com/', 'Strona główna youtube'),
(2, 1, 2, 'https://www.netflix.com/pl/', 'Strona główna netflixa');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zgłoszenia`
--

CREATE TABLE `zgłoszenia` (
  `id` int(10) UNSIGNED NOT NULL,
  `idUzytkownika` int(10) UNSIGNED NOT NULL,
  `tresc` text NOT NULL,
  `data` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Dumping data for table `zgłoszenia`
--

INSERT INTO `zgłoszenia` (`id`, `idUzytkownika`, `tresc`, `data`) VALUES
(1, 2, 'Brakuje kategorii!', '2024-07-02 17:44:54');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `znajomi`
--

CREATE TABLE `znajomi` (
  `idUzytkownika1` int(10) UNSIGNED NOT NULL,
  `idUzytkownika2` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Dumping data for table `znajomi`
--

INSERT INTO `znajomi` (`idUzytkownika1`, `idUzytkownika2`) VALUES
(1, 2),
(2, 1);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `kategorie`
--
ALTER TABLE `kategorie`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `kolekcjaprawa`
--
ALTER TABLE `kolekcjaprawa`
  ADD KEY `idKolekcjaZakladek` (`idKolekcjaZakladek`),
  ADD KEY `idUzytkownika` (`idUzytkownika`);

--
-- Indeksy dla tabeli `kolekcjazakladek`
--
ALTER TABLE `kolekcjazakladek`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idUzytkownika` (`idUzytkownika`);

--
-- Indeksy dla tabeli `preferencje`
--
ALTER TABLE `preferencje`
  ADD KEY `idUzytkownika` (`idUzytkownika`);

--
-- Indeksy dla tabeli `uzytkownicy`
--
ALTER TABLE `uzytkownicy`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `zakladkakolekcji`
--
ALTER TABLE `zakladkakolekcji`
  ADD KEY `idKolekcjaZakladek` (`idKolekcjaZakladek`),
  ADD KEY `idZakladki` (`idZakladki`);

--
-- Indeksy dla tabeli `zakladki`
--
ALTER TABLE `zakladki`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idKategoria` (`idKategorii`),
  ADD KEY `idUzytkownika` (`idUzytkownika`);

--
-- Indeksy dla tabeli `zgłoszenia`
--
ALTER TABLE `zgłoszenia`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idUzytkownika` (`idUzytkownika`);

--
-- Indeksy dla tabeli `znajomi`
--
ALTER TABLE `znajomi`
  ADD KEY `idUzytkownika1` (`idUzytkownika1`),
  ADD KEY `idUzytkownika2` (`idUzytkownika2`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `kategorie`
--
ALTER TABLE `kategorie`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `kolekcjazakladek`
--
ALTER TABLE `kolekcjazakladek`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `uzytkownicy`
--
ALTER TABLE `uzytkownicy`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `zakladki`
--
ALTER TABLE `zakladki`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `zgłoszenia`
--
ALTER TABLE `zgłoszenia`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `kolekcjaprawa`
--
ALTER TABLE `kolekcjaprawa`
  ADD CONSTRAINT `kolekcjaprawa_ibfk_1` FOREIGN KEY (`idKolekcjaZakladek`) REFERENCES `kolekcjazakladek` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `kolekcjaprawa_ibfk_2` FOREIGN KEY (`idUzytkownika`) REFERENCES `uzytkownicy` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `kolekcjazakladek`
--
ALTER TABLE `kolekcjazakladek`
  ADD CONSTRAINT `kolekcjazakladek_ibfk_1` FOREIGN KEY (`idUzytkownika`) REFERENCES `uzytkownicy` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `preferencje`
--
ALTER TABLE `preferencje`
  ADD CONSTRAINT `preferencje_ibfk_1` FOREIGN KEY (`idUzytkownika`) REFERENCES `uzytkownicy` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `zakladkakolekcji`
--
ALTER TABLE `zakladkakolekcji`
  ADD CONSTRAINT `zakladkakolekcji_ibfk_1` FOREIGN KEY (`idKolekcjaZakladek`) REFERENCES `kolekcjazakladek` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `zakladkakolekcji_ibfk_2` FOREIGN KEY (`idZakladki`) REFERENCES `zakladki` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `zakladki`
--
ALTER TABLE `zakladki`
  ADD CONSTRAINT `zakladki_ibfk_1` FOREIGN KEY (`idKategorii`) REFERENCES `kategorie` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `zakladki_ibfk_2` FOREIGN KEY (`idUzytkownika`) REFERENCES `uzytkownicy` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `zgłoszenia`
--
ALTER TABLE `zgłoszenia`
  ADD CONSTRAINT `zgłoszenia_ibfk_1` FOREIGN KEY (`idUzytkownika`) REFERENCES `uzytkownicy` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `znajomi`
--
ALTER TABLE `znajomi`
  ADD CONSTRAINT `znajomi_ibfk_1` FOREIGN KEY (`idUzytkownika1`) REFERENCES `uzytkownicy` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `znajomi_ibfk_2` FOREIGN KEY (`idUzytkownika2`) REFERENCES `uzytkownicy` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
