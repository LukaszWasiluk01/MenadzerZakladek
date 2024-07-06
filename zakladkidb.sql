-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Lip 06, 2024 at 11:27 PM
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
(3, 'test', '098f6bcd4621d373cade4e832627b4f6', 'test@example.com', 'user', '2024-07-03 12:16:45', 'testawatar.png'),
(4, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'admin@example.com', 'admin', '2024-07-03 12:19:17', 'adminawatar.webp'),
(5, 'test123', 'cc03e747a6afbbcbf8be7668acfebee5', 'test123@example.com', 'user', '2024-07-03 22:44:48', 'test123awatar.webp'),
(6, 'test321', 'ee53d4213c897ad632bb8d824762f918', 'test321@example.com', 'user', '2024-07-04 14:21:32', 'test321awatar.png');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zakladki`
--

CREATE TABLE `zakladki` (
  `id` int(10) UNSIGNED NOT NULL,
  `idUzytkownika` int(10) UNSIGNED NOT NULL,
  `idKategorii` int(10) UNSIGNED NOT NULL,
  `url` text NOT NULL,
  `opis` text NOT NULL,
  `dataUtworzenia` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Dumping data for table `zakladki`
--

INSERT INTO `zakladki` (`id`, `idUzytkownika`, `idKategorii`, `url`, `opis`, `dataUtworzenia`) VALUES
(2, 4, 2, 'https://www.netflix.com/pl/', 'Strona główna netflixa', '2024-07-06 19:55:23'),
(10, 4, 1, 'https://www.youtube.com/results?search_query=muzyka+playlista', 'Playlista muzyki', '2024-07-06 19:52:01'),
(11, 4, 1, 'https://www.youtube.com/results?search_query=recenzje+nowych+film%C3%B3w', 'Recenzje nowych filmów', '2024-07-06 19:57:01'),
(12, 4, 1, 'https://www.youtube.com/results?search_query=recenzje+gier', 'Recenzje gier', '2024-07-06 19:57:01'),
(13, 4, 1, 'https://www.youtube.com/results?search_query=recenzje+film%C3%B3w', 'Recenzje filmów', '2024-07-06 19:58:33'),
(14, 3, 1, 'https://www.youtube.com/results?search_query=Premiery+filmowe+2024', 'Premiery filmowe 2024', '2024-07-06 20:39:29'),
(15, 3, 1, 'https://www.youtube.com/results?search_query=elden+ring', 'Elden ring', '2024-07-06 20:57:18'),
(16, 4, 1, 'https://www.youtube.com/results?search_query=wied%C5%BAmin+3', 'Wiedźmin 3', '2024-07-06 20:58:07'),
(17, 3, 1, 'https://www.youtube.com/results?search_query=recenzja+Last+Epoch', 'Recenzja Last Epoch', '2024-07-06 21:00:50'),
(18, 3, 1, 'https://www.youtube.com/results?search_query=recenzja+Path+of+exile', 'Recenzja Path of Exile', '2024-07-06 21:01:47'),
(19, 4, 1, 'https://www.youtube.com/results?search_query=recenzja+elden+ring+shadow+of+the+erdtree', 'Recenzja Elden Ring: Shadow of the Erdtree', '2024-07-06 21:03:33'),
(20, 3, 1, 'https://www.youtube.com/results?search_query=euro+2024+highlights+today', 'euro 2024 highlights today', '2024-07-06 21:12:22');

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
(1, 3, 'Brakuje kategorii!', '2024-07-02 17:44:54'),
(17, 4, 'test', '2024-07-04 11:33:54');

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
(5, 3),
(3, 5),
(5, 4),
(4, 5),
(3, 4),
(4, 3);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `kategorie`
--
ALTER TABLE `kategorie`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `uzytkownicy`
--
ALTER TABLE `uzytkownicy`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT for table `uzytkownicy`
--
ALTER TABLE `uzytkownicy`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `zakladki`
--
ALTER TABLE `zakladki`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `zgłoszenia`
--
ALTER TABLE `zgłoszenia`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- Constraints for dumped tables
--

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
