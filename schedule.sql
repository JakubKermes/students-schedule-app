-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 13 Mar 2023, 18:14
-- Wersja serwera: 10.4.24-MariaDB
-- Wersja PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `schedule`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `clasrooms`
--

CREATE TABLE `clasrooms` (
  `id_room` int(11) NOT NULL,
  `room_number` char(32) NOT NULL,
  `building` char(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `clasrooms`
--

INSERT INTO `clasrooms` (`id_room`, `room_number`, `building`) VALUES
(1, 'Aerobik', 'A'),
(2, 'Siłownia', 'A'),
(3, '2', 'A'),
(4, '6', 'A'),
(5, '12', 'A'),
(6, '13', 'A'),
(7, '14', 'A'),
(8, '15', 'A'),
(9, '16', 'A'),
(10, '31', 'A'),
(11, '32', 'A'),
(12, '33', 'A'),
(13, '36', 'A'),
(14, '104 (MCSM-UP)', 'A'),
(15, '108 (MCSM-ZRM)', 'A'),
(16, '114 (MCSM-OSCE)', 'A'),
(17, '115 (MCSM-Deb.)', 'A'),
(18, '116 (MCSM-WW)', 'A'),
(19, '117 (MCSM-ALS/BLS)', 'A'),
(20, '118 (MCSM-UT)', 'A'),
(21, '119 (MCSM-porodowa)', 'A'),
(22, '141', 'A'),
(23, '142', 'A'),
(24, '143', 'A'),
(25, '144', 'A'),
(26, '145', 'A'),
(27, '146', 'A'),
(28, '212', 'A'),
(29, '213', 'A'),
(30, '217', 'A'),
(31, '218', 'A'),
(32, '242', 'A'),
(33, '243', 'A'),
(34, '244', 'A'),
(35, '245', 'A'),
(36, '314', 'A'),
(37, '316', 'A'),
(38, '318', 'A'),
(39, '320', 'A'),
(40, '322', 'A'),
(41, '324', 'A'),
(42, '326', 'A'),
(43, '10', 'C'),
(44, '11', 'C'),
(45, '14', 'C'),
(46, '15', 'C'),
(47, '20', 'C'),
(48, '021 (Kuchnia)', 'C'),
(49, '21', 'C'),
(50, '23', 'C'),
(51, '24', 'C'),
(52, '25', 'C'),
(53, '110', 'C'),
(54, '111', 'C'),
(55, '113', 'C'),
(56, '122', 'C'),
(57, '123', 'C'),
(58, '125', 'C'),
(59, '126', 'C'),
(60, '128', 'C'),
(61, '129', 'C'),
(62, '201', 'C'),
(63, '202', 'C'),
(64, '203', 'C'),
(65, '205', 'C'),
(66, '209', 'C'),
(67, '210', 'C'),
(68, '212', 'C'),
(69, '221a', 'C'),
(70, '221', 'C'),
(71, '222', 'C'),
(72, '224', 'C'),
(73, '225', 'C'),
(74, '226', 'C'),
(75, '227', 'C'),
(76, '228', 'C'),
(77, '311', 'C'),
(78, '312', 'C'),
(79, '313', 'C'),
(80, '314', 'C'),
(81, '322', 'C'),
(82, '323a', 'C'),
(83, '323', 'C'),
(84, '324', 'C'),
(85, '325', 'C'),
(86, '326', 'C'),
(87, '327', 'C'),
(88, '328', 'C'),
(89, '329', 'C'),
(90, '1', 'D'),
(91, '5', 'D'),
(92, '6', 'D'),
(93, '7', 'D'),
(94, '8', 'D'),
(95, '15', 'D'),
(96, '16', 'D'),
(97, '17', 'D'),
(98, '18', 'D'),
(99, '25', 'D'),
(100, '1', 'E'),
(101, '2', 'E'),
(102, '3', 'E'),
(103, '4', 'E'),
(104, 'ul.Mickiewicza10', 'DS'),
(105, '01', 'Przychodnia'),
(106, '02', 'Przychodnia'),
(107, '03', 'Przychodnia'),
(108, '04', 'Przychodnia'),
(109, '05', 'Przychodnia'),
(110, '06', 'Przychodnia'),
(111, '07', 'Przychodnia'),
(112, '08', 'Przychodnia');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `field_of_study`
--

CREATE TABLE `field_of_study` (
  `id_group` int(11) NOT NULL,
  `id_faculty` int(11) NOT NULL,
  `fos` text NOT NULL,
  `year` int(11) NOT NULL,
  `stationary` tinyint(1) NOT NULL DEFAULT 1,
  `specialisation` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `lecturers`
--

CREATE TABLE `lecturers` (
  `id_lecturer` int(11) NOT NULL,
  `name` text NOT NULL,
  `lastname` text NOT NULL,
  `title` text NOT NULL,
  `faculty` text NOT NULL,
  `id_at_collegiumwitelona` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `lecturers`
--

INSERT INTO `lecturers` (`id_lecturer`, `name`, `lastname`, `title`, `faculty`, `id_at_collegiumwitelona`) VALUES
(1, 'Paweł', 'Andrzejczyk', 'mgr inż.', 'Wydział Nauk Technicznych i Ekonomicznych', 4),
(2, 'Nadine', 'Bednarz', 'mgr', 'Wydział Nauk Technicznych i Ekonomicznych', 7),
(3, 'Katarzyna', 'Ben Abdallah', 'mgr', 'Wydział Nauk Technicznych i Ekonomicznych', 10779),
(4, 'Izabela', 'Bernatek-Zaguła', 'dr', 'Wydział Nauk Technicznych i Ekonomicznych', 9),
(5, 'Agnieszka', 'Bezdziecka', 'mgr', 'Wydział Nauk Technicznych i Ekonomicznych', 10605),
(6, 'Edward', 'Biegun', 'mgr', 'Wydział Nauk Technicznych i Ekonomicznych', 10),
(7, 'Piotr', 'Bonarski', 'mgr inż.', 'Wydział Nauk Technicznych i Ekonomicznych', 10802),
(8, 'Jan', 'Budka', 'dr', 'Wydział Nauk Technicznych i Ekonomicznych', 19),
(9, 'Robert', 'Burduk', 'dr hab. inż.', 'Wydział Nauk Technicznych i Ekonomicznych', 22),
(10, 'Anna', 'Burduk', 'dr hab. inż.', 'Wydział Nauk Technicznych i Ekonomicznych', 10682),
(11, 'Patrick', 'Chapman', '', 'Wydział Nauk Technicznych i Ekonomicznych', 10333),
(12, 'Joanna', 'Czarnecka', 'mgr', 'Wydział Nauk Technicznych i Ekonomicznych', 29),
(13, 'Zygmunt', 'Domagała', 'dr inż.', 'Wydział Nauk Technicznych i Ekonomicznych', 10226),
(14, 'Dorota', 'Domińska-Werbel', 'dr', 'Wydział Nauk Technicznych i Ekonomicznych', 35),
(15, 'Mariola', 'Drozda', 'mgr inż.', 'Wydział Nauk Technicznych i Ekonomicznych', 10718),
(16, 'Julita', 'Drzazga', 'mgr inż.', 'Wydział Nauk Technicznych i Ekonomicznych', 10803),
(17, 'Wioletta', 'Drzystek', 'dr', 'Wydział Nauk Technicznych i Ekonomicznych', 39),
(18, 'Jan', 'Duda', 'mgr inż.', 'Wydział Nauk Technicznych i Ekonomicznych', 40),
(19, 'Włodzimierz', 'Dudziński', 'prof. dr hab. inż.', 'Wydział Nauk Technicznych i Ekonomicznych', 10698),
(20, 'Magdalena', 'Dąbrowska', 'dr', 'Wydział Nauk Technicznych i Ekonomicznych', 31),
(21, 'Daniel', 'Dębowski', 'dr inż.', 'Wydział Nauk Technicznych i Ekonomicznych', 10367),
(22, 'Zbigniew', 'Fryźlewicz', 'dr inż.', 'Wydział Nauk Technicznych i Ekonomicznych', 46),
(23, 'Renata', 'Gnitecka', 'dr inż.', 'Wydział Nauk Technicznych i Ekonomicznych', 49),
(24, 'Marek', 'Gorzelańczyk', 'dr', 'Wydział Nauk Technicznych i Ekonomicznych', 10543),
(25, 'Ewa', 'Groszewska', 'dr', 'Wydział Nauk Technicznych i Ekonomicznych', 10503),
(26, 'Arkadiusz', 'Grzybowski', 'dr inż.', 'Wydział Nauk Technicznych i Ekonomicznych', 55),
(27, 'Dorota', 'Góra-Pachoń', 'mgr', 'Wydział Nauk Technicznych i Ekonomicznych', 10497),
(28, 'Józefa', 'Górska-Zając', 'mgr inż.', 'Wydział Nauk Technicznych i Ekonomicznych', 50),
(29, 'Leopold', 'Habiniak', 'dr', 'Wydział Nauk Technicznych i Ekonomicznych', 10606),
(30, 'Roman', 'Hojniak', 'mgr inż.', 'Wydział Nauk Technicznych i Ekonomicznych', 61),
(31, 'Kornelia', 'Hübscher', 'dr', 'Wydział Nauk Technicznych i Ekonomicznych', 62),
(32, 'Irena', 'Izbiańska', 'mgr', 'Wydział Nauk Technicznych i Ekonomicznych', 65),
(33, 'Tomasz', 'Janiak', 'dr', 'Wydział Nauk Technicznych i Ekonomicznych', 10805),
(34, 'Andrzej', 'Janus', 'dr hab. inż.', 'Wydział Nauk Technicznych i Ekonomicznych', 10607),
(35, 'Bożena', 'Jasiak-Kaczmarek', 'mgr', 'Wydział Nauk Technicznych i Ekonomicznych', 70),
(36, 'Zdzisław', 'Jasiński', 'prof. dr hab. inż.', 'Wydział Nauk Technicznych i Ekonomicznych', 8),
(37, 'Krzysztof', 'Jesionek', 'prof. dr hab. inż.', 'Wydział Nauk Technicznych i Ekonomicznych', 10752),
(38, 'Paweł', 'Jóźwiakowski', 'dr', 'Wydział Nauk Technicznych i Ekonomicznych', 10047),
(39, 'Ewa', 'Karlińska', 'mgr', 'Wydział Nauk Technicznych i Ekonomicznych', 10417),
(40, 'Wojciech', 'Kasprzyk', 'dr', 'Wydział Nauk Technicznych i Ekonomicznych', 10405),
(41, 'Joanna', 'Kenc', 'dr', 'Wydział Nauk Technicznych i Ekonomicznych', 83),
(42, 'Aleksander', 'Klosow', 'dr', 'Wydział Nauk Technicznych i Ekonomicznych', 85),
(43, 'Krzysztof', 'Kolbusz', 'mgr inż.', 'Wydział Nauk Technicznych i Ekonomicznych', 10289),
(44, 'Adam', 'Kopiński', 'prof. dr hab.', 'Wydział Nauk Technicznych i Ekonomicznych', 10701),
(45, 'Wojciech', 'Kordecki', 'dr hab. inż.', 'Wydział Nauk Technicznych i Ekonomicznych', 10283),
(46, 'Agnieszka', 'Koryś', 'mgr', 'Wydział Nauk Technicznych i Ekonomicznych', 10391),
(47, 'Agnieszka', 'Kos', 'dr', 'Wydział Nauk Technicznych i Ekonomicznych', 10282),
(48, 'Filip', 'Kostek', 'mgr', 'Wydział Nauk Technicznych i Ekonomicznych', 10604),
(49, 'Anna', 'Kowal-Orczykowska', 'dr', 'Wydział Nauk Technicznych i Ekonomicznych', 97),
(50, 'Sebastian', 'Kowalski', 'mgr inż.', 'Wydział Nauk Technicznych i Ekonomicznych', 10815),
(51, 'Tadeusz', 'Kowalski', 'dr', 'Wydział Nauk Technicznych i Ekonomicznych', 10542),
(52, 'Stefan', 'Kozerski', 'dr inż.', 'Wydział Nauk Technicznych i Ekonomicznych', 10678),
(53, 'Sławomir', 'Kryszkowski', 'dr', 'Wydział Nauk Technicznych i Ekonomicznych', 10429),
(54, 'Rafał', 'Kubik', 'dr', 'Wydział Nauk Technicznych i Ekonomicznych', 10392),
(55, 'Barbara', 'Kurkowska', 'mgr', 'Wydział Nauk Technicznych i Ekonomicznych', 10046),
(56, 'Jerzy', 'Kuś', 'dr inż.', 'Wydział Nauk Technicznych i Ekonomicznych', 108),
(57, 'Jerzy', 'Kwaśnik', 'dr inż.', 'Wydział Nauk Technicznych i Ekonomicznych', 109),
(58, 'Stanisław', 'Kwaśniowski', 'dr inż.', 'Wydział Nauk Technicznych i Ekonomicznych', 10847),
(59, 'Tomasz', 'Kwoka', 'mgr', 'Wydział Nauk Technicznych i Ekonomicznych', 110),
(60, 'Sławomir', 'Kłosowski', 'dr', 'Wydział Nauk Technicznych i Ekonomicznych', 10511),
(61, 'Leszek', 'Kędzierski', 'dr', 'Wydział Nauk Technicznych i Ekonomicznych', 10388),
(62, 'Grzegorz', 'Lesiuk', 'dr hab. inż.', 'Wydział Nauk Technicznych i Ekonomicznych', 10814),
(63, 'Justyna', 'Lewandowska-Bratek', 'dr', 'Wydział Nauk Technicznych i Ekonomicznych', 10665),
(64, 'Gabriela', 'Lisowska', 'mgr', 'Wydział Nauk Technicznych i Ekonomicznych', 10435),
(65, 'Paweł', 'Macuga', 'mgr', 'Wydział Nauk Technicznych i Ekonomicznych', 122),
(66, 'Andrzej', 'Marek', 'mgr', 'Wydział Nauk Technicznych i Ekonomicznych', 126),
(67, 'Daniel', 'Medyński', 'dr inż.', 'Wydział Nauk Technicznych i Ekonomicznych', 130),
(68, 'Dariusz', 'Michalski', 'dr inż.', 'Wydział Nauk Technicznych i Ekonomicznych', 10306),
(69, 'Marek', 'Miedziński', 'dr', 'Wydział Nauk Technicznych i Ekonomicznych', 10535),
(70, 'Włodzimierz', 'Mischke', 'dr', 'Wydział Nauk Technicznych i Ekonomicznych', 10729),
(71, 'Piotr', 'Motyka', 'mgr inż.', 'Wydział Nauk Technicznych i Ekonomicznych', 10541),
(72, 'Wojciech', 'Mucha', 'dr', 'Wydział Nauk Technicznych i Ekonomicznych', 10524),
(73, 'Maria', 'Muraszka', 'mgr', 'Wydział Nauk Technicznych i Ekonomicznych', 163),
(74, 'Piotr', 'Nadybski', 'dr inż.', 'Wydział Nauk Technicznych i Ekonomicznych', 299),
(75, 'Lilia', 'Omelan', 'dr', 'Wydział Nauk Technicznych i Ekonomicznych', 143),
(76, 'Małgorzata', 'Pacer', 'mgr', 'Wydział Nauk Technicznych i Ekonomicznych', 10848),
(77, 'Andrzej', 'Panasiuk', 'prof. dr hab.', 'Wydział Nauk Technicznych i Ekonomicznych', 10661),
(78, 'Agnieszka', 'Paszyn', 'mgr inż.', 'Wydział Nauk Technicznych i Ekonomicznych', 10676),
(79, 'Tomasz', 'Pelc', 'mgr inż.', 'Wydział Nauk Technicznych i Ekonomicznych', 10699),
(80, 'Jerzy', 'Pietkiewicz', 'prof. dr hab. inż.', 'Wydział Nauk Technicznych i Ekonomicznych', 147),
(81, 'Natalia', 'Pobirchenko', 'prof. dr hab.', 'Wydział Nauk Technicznych i Ekonomicznych', 10337),
(82, 'Bartosz', 'Podsiadły', 'mgr inż.', 'Wydział Nauk Technicznych i Ekonomicznych', 10849),
(83, 'Błażej', 'Prus', 'dr', 'Wydział Nauk Technicznych i Ekonomicznych', 10354),
(84, 'Janina', 'Płaskonka-Fietkowska', 'mgr', 'Wydział Nauk Technicznych i Ekonomicznych', 151),
(85, 'Jolanta', 'Radkowska', 'dr', 'Wydział Nauk Technicznych i Ekonomicznych', 158),
(86, 'Krzysztof', 'Radkowski', 'dr', 'Wydział Nauk Technicznych i Ekonomicznych', 159),
(87, 'Ewa', 'Rajczakowska', 'mgr', 'Wydział Nauk Technicznych i Ekonomicznych', 10686),
(88, 'Krzysztof', 'Rewak', 'mgr inż.', 'Wydział Nauk Technicznych i Ekonomicznych', 10377),
(91, 'Bożena', 'Rudnicka', 'dr', 'Wydział Nauk Technicznych i Ekonomicznych', 167),
(92, 'Karol', 'Rusin', 'dr', 'Wydział Nauk Technicznych i Ekonomicznych', 10361),
(93, 'Przemysław', 'Ryba', 'dr inż.', 'Wydział Nauk Technicznych i Ekonomicznych', 169),
(94, 'Jakub', 'Rzucidło', 'dr', 'Wydział Nauk Technicznych i Ekonomicznych', 10382),
(95, 'Ryszard', 'Rębowski', 'dr inż.', 'Wydział Nauk Technicznych i Ekonomicznych', 161),
(96, 'Krystian', 'Sadowski', 'mgr inż.', 'Wydział Nauk Technicznych i Ekonomicznych', 10286),
(97, 'Izabela', 'Selera', 'mgr', 'Wydział Nauk Technicznych i Ekonomicznych', 172),
(98, 'Karol', 'Selwat', 'dr', 'Wydział Nauk Technicznych i Ekonomicznych', 173),
(100, 'Marcin', 'Sieja', 'dr', 'Wydział Nauk Technicznych i Ekonomicznych', 178),
(101, 'Przemysław', 'Siudak', 'dr', 'Wydział Nauk Technicznych i Ekonomicznych', 182),
(102, 'Paweł', 'Skowron', 'dr', 'Wydział Nauk Technicznych i Ekonomicznych', 10421),
(112, 'Marta', 'Stanisławska', 'dr', 'Wydział Nauk Technicznych i Ekonomicznych', 10394),
(113, 'Łukasz', 'Stawarz', 'mgr', 'Wydział Nauk Technicznych i Ekonomicznych', 188),
(114, 'Tomasz', 'Stechnij', 'dr inż.', 'Wydział Nauk Technicznych i Ekonomicznych', 10185),
(115, 'Elżbieta', 'Stępień', 'mgr', 'Wydział Nauk Technicznych i Ekonomicznych', 10852),
(116, 'Renata', 'Supranowicz', 'mgr inż.', 'Wydział Nauk Technicznych i Ekonomicznych', 193),
(117, 'Józefa', 'Szczepankowska', 'mgr', 'Wydział Nauk Technicznych i Ekonomicznych', 196),
(118, 'Ewa', 'Szkic-Czech', 'dr', 'Wydział Nauk Technicznych i Ekonomicznych', 10662),
(120, 'godz.', 'Szkolenie', '9.00-10.30', 'Wydział Nauk Technicznych i Ekonomicznych', 0),
(121, 'Małgorzata', 'Szudrowicz-Garstka', 'dr', 'Wydział Nauk Technicznych i Ekonomicznych', 317),
(122, 'Eugeniusz', 'Szydłowski', 'dr', 'Wydział Nauk Technicznych i Ekonomicznych', 259),
(123, 'Jan', 'Szyller', 'mgr', 'Wydział Nauk Technicznych i Ekonomicznych', 10684),
(124, 'Marcin', 'Tracz', 'mgr inż.', 'Wydział Nauk Technicznych i Ekonomicznych', 10663),
(125, '–', 'Tuora', 'Schwierskott Ewa dr hab.', 'Wydział Nauk Technicznych i Ekonomicznych', 0),
(126, 'Jerzy', 'Ulewski', 'mgr', 'Wydział Nauk Technicznych i Ekonomicznych', 10431),
(127, 'Witold', 'Urbanik', 'dr', 'Wydział Nauk Technicznych i Ekonomicznych', 204),
(143, 'Anita', 'Wawrzyniak', 'mgr', 'Wydział Nauk Technicznych i Ekonomicznych', 210),
(144, 'Mateusz', 'Wierzbicki', 'mgr', 'Wydział Nauk Technicznych i Ekonomicznych', 10677),
(145, 'Rafał', 'Więcławek', 'dr inż.', 'Wydział Nauk Technicznych i Ekonomicznych', 10804),
(146, 'Bogumiła', 'Wnukowska', 'dr hab. inż.', 'Wydział Nauk Technicznych i Ekonomicznych', 308),
(147, 'Artur', 'Wojewoda', 'mgr inż.', 'Wydział Nauk Technicznych i Ekonomicznych', 10853),
(148, 'Piotr', 'Wrzecioniarz', 'dr hab. inż.', 'Wydział Nauk Technicznych i Ekonomicznych', 10683),
(149, 'Adam', 'Wysoczański', 'mgr inż.', 'Wydział Nauk Technicznych i Ekonomicznych', 10850),
(150, 'Bogumiła', 'Wątorek', 'dr', 'Wydział Nauk Technicznych i Ekonomicznych', 211),
(151, 'Dariusz', 'Wędzina', 'dr', 'Wydział Nauk Technicznych i Ekonomicznych', 212),
(152, 'Sylwia', 'Zajchowska', 'mgr', 'Wydział Nauk Technicznych i Ekonomicznych', 223),
(153, 'Wojciech', 'Zamojski', 'prof. dr hab. inż.', 'Wydział Nauk Technicznych i Ekonomicznych', 10220),
(154, 'Anna', 'Zurek', 'mgr', 'Wydział Nauk Technicznych i Ekonomicznych', 10667),
(155, 'Arkadiusz', 'Zurek', 'mgr', 'Wydział Nauk Technicznych i Ekonomicznych', 10612),
(156, 'polski', 'j.', '- gr. ukraińska', 'Wydział Nauk Technicznych i Ekonomicznych', 0),
(157, 'Wiesław', 'Ładoński', 'dr inż.', 'Wydział Nauk Technicznych i Ekonomicznych', 116),
(158, 'Agnieszka', 'Łakomska', 'mgr', 'Wydział Nauk Technicznych i Ekonomicznych', 118),
(159, 'Witold', 'Łakomski', 'mgr', 'Wydział Nauk Technicznych i Ekonomicznych', 10712),
(160, 'Jan', 'Łużny', 'mgr', 'Wydział Nauk Technicznych i Ekonomicznych', 119),
(161, 'Zofia', 'Łękawa', 'dr', 'Wydział Nauk Technicznych i Ekonomicznych', 246),
(162, 'Marcin', 'Żmuda', 'mgr inż.', 'Wydział Nauk Technicznych i Ekonomicznych', 10434),
(163, 'Aleksandra', 'Adamska-Osada', 'dr', 'Wydział Nauk Społecznych i Humanistycznych', 362),
(164, 'Helena', 'Babiuch', 'dr', 'Wydział Nauk Społecznych i Humanistycznych', 5),
(165, 'Nadine', 'Bednarz', 'mgr', 'Wydział Nauk Społecznych i Humanistycznych', 7),
(166, 'Abdallah', 'Ben', 'Katarzyna mgr', 'Wydział Nauk Społecznych i Humanistycznych', 10779),
(167, 'Izabela', 'Bernatek-Zaguła', 'dr', 'Wydział Nauk Społecznych i Humanistycznych', 9),
(168, 'Agnieszka', 'Bezdziecka', 'mgr', 'Wydział Nauk Społecznych i Humanistycznych', 10605),
(169, 'Edward', 'Biegun', 'mgr', 'Wydział Nauk Społecznych i Humanistycznych', 10),
(170, 'Małgorzata', 'Buchla', 'dr', 'Wydział Nauk Społecznych i Humanistycznych', 18),
(171, 'Katarzyna', 'Buczek', 'mgr', 'Wydział Nauk Społecznych i Humanistycznych', 10731),
(172, 'Jerzy', 'Buczko', 'dr', 'Wydział Nauk Społecznych i Humanistycznych', 10186),
(173, 'Małgorzata', 'Bujnowska', 'dr n. med.', 'Wydział Nauk Społecznych i Humanistycznych', 330),
(174, 'Agnieszka', 'Błaszczyk-Szabat', 'dr', 'Wydział Nauk Społecznych i Humanistycznych', 312),
(175, 'Patrick', 'Chapman', '', 'Wydział Nauk Społecznych i Humanistycznych', 10333),
(176, 'Marek', 'Czarkowski', 'mgr', 'Wydział Nauk Społecznych i Humanistycznych', 10390),
(177, 'Joanna', 'Czarnecka', 'mgr', 'Wydział Nauk Społecznych i Humanistycznych', 29),
(178, 'Dorota', 'Domińska-Werbel', 'dr', 'Wydział Nauk Społecznych i Humanistycznych', 35),
(179, 'Wioletta', 'Drzystek', 'dr', 'Wydział Nauk Społecznych i Humanistycznych', 39),
(180, 'Paweł', 'Dąbrowa', 'dr inż.', 'Wydział Nauk Społecznych i Humanistycznych', 10360),
(181, 'Wanda', 'Grelowska', 'dr hab.', 'Wydział Nauk Społecznych i Humanistycznych', 10128),
(182, 'Ewa', 'Groszewska', 'dr', 'Wydział Nauk Społecznych i Humanistycznych', 10503),
(183, 'Dorota', 'Góra-Pachoń', 'mgr', 'Wydział Nauk Społecznych i Humanistycznych', 10497),
(184, 'Józefa', 'Górska-Zając', 'mgr inż.', 'Wydział Nauk Społecznych i Humanistycznych', 50),
(185, 'Roman', 'Hojniak', 'mgr inż.', 'Wydział Nauk Społecznych i Humanistycznych', 61),
(186, 'Kornelia', 'Hübscher', 'dr', 'Wydział Nauk Społecznych i Humanistycznych', 62),
(187, 'Zdzisław', 'Jagiełło', 'dr hab.', 'Wydział Nauk Społecznych i Humanistycznych', 10127),
(188, 'Łukasz', 'Jarocki', 'dr', 'Wydział Nauk Społecznych i Humanistycznych', 10713),
(189, 'Bożena', 'Jasiak-Kaczmarek', 'mgr', 'Wydział Nauk Społecznych i Humanistycznych', 70),
(190, 'Paweł', 'Jóźwiakowski', 'dr', 'Wydział Nauk Społecznych i Humanistycznych', 10047),
(191, 'Tomasz', 'Kaczmarczyk', 'dr', 'Wydział Nauk Społecznych i Humanistycznych', 10525),
(192, 'Ewa', 'Karlińska', 'mgr', 'Wydział Nauk Społecznych i Humanistycznych', 10417),
(193, 'Wojciech', 'Kasprzyk', 'dr', 'Wydział Nauk Społecznych i Humanistycznych', 10405),
(194, 'Marek', 'Kazimierowicz', 'dr', 'Wydział Nauk Społecznych i Humanistycznych', 10291),
(195, 'Marcin', 'Klimczak', 'mgr', 'Wydział Nauk Społecznych i Humanistycznych', 10526),
(196, 'Paweł', 'Kobes', 'dr', 'Wydział Nauk Społecznych i Humanistycznych', 86),
(197, 'Agnieszka', 'Koryś', 'mgr', 'Wydział Nauk Społecznych i Humanistycznych', 10391),
(198, 'Agnieszka', 'Kos', 'dr', 'Wydział Nauk Społecznych i Humanistycznych', 10282),
(199, 'Filip', 'Kostek', 'mgr', 'Wydział Nauk Społecznych i Humanistycznych', 10604),
(200, 'Anna', 'Kowal-Orczykowska', 'dr', 'Wydział Nauk Społecznych i Humanistycznych', 97),
(201, 'Sławomir', 'Kryszkowski', 'dr', 'Wydział Nauk Społecznych i Humanistycznych', 10429),
(202, 'Rafał', 'Kubik', 'dr', 'Wydział Nauk Społecznych i Humanistycznych', 10392),
(203, 'Barbara', 'Kurkowska', 'mgr', 'Wydział Nauk Społecznych i Humanistycznych', 10046),
(204, 'Tomasz', 'Kwoka', 'mgr', 'Wydział Nauk Społecznych i Humanistycznych', 110),
(205, 'Leszek', 'Kędzierski', 'dr', 'Wydział Nauk Społecznych i Humanistycznych', 10388),
(206, 'Justyna', 'Lewandowska-Bratek', 'dr', 'Wydział Nauk Społecznych i Humanistycznych', 10665),
(207, 'Gabriela', 'Lisowska', 'mgr', 'Wydział Nauk Społecznych i Humanistycznych', 10435),
(208, 'Grażyna', 'Maciak', 'dr', 'Wydział Nauk Społecznych i Humanistycznych', 10090),
(209, 'Paweł', 'Macuga', 'mgr', 'Wydział Nauk Społecznych i Humanistycznych', 122),
(210, 'Grzegorz', 'Majewicz', 'mgr', 'Wydział Nauk Społecznych i Humanistycznych', 305),
(211, 'Andrzej', 'Marek', 'mgr', 'Wydział Nauk Społecznych i Humanistycznych', 126),
(212, 'Wojciech', 'Mucha', 'dr', 'Wydział Nauk Społecznych i Humanistycznych', 10524),
(213, 'Maria', 'Muraszka', 'mgr', 'Wydział Nauk Społecznych i Humanistycznych', 163),
(214, 'Piotr', 'Niemiec', 'dr', 'Wydział Nauk Społecznych i Humanistycznych', 10735),
(215, 'Bożena', 'Niesłuchowska-Pinkos', 'mgr', 'Wydział Nauk Społecznych i Humanistycznych', 10383),
(216, 'Kamil', 'Nowak', 'mgr', 'Wydział Nauk Społecznych i Humanistycznych', 10780),
(217, 'Robert', 'Nowakowski', 'mgr inż.', 'Wydział Nauk Społecznych i Humanistycznych', 10515),
(218, 'Lilia', 'Omelan', 'dr', 'Wydział Nauk Społecznych i Humanistycznych', 143),
(219, 'Andrzej', 'Panasiuk', 'prof. dr hab.', 'Wydział Nauk Społecznych i Humanistycznych', 10661),
(220, 'Natalia', 'Pobirchenko', 'prof. dr hab.', 'Wydział Nauk Społecznych i Humanistycznych', 10337),
(221, 'Edward', 'Polakiewicz', 'mgr', 'Wydział Nauk Społecznych i Humanistycznych', 10381),
(222, 'Robert', 'Raczyński', 'mgr', 'Wydział Nauk Społecznych i Humanistycznych', 10844),
(226, 'Bożena', 'Rudnicka', 'dr', 'Wydział Nauk Społecznych i Humanistycznych', 167),
(227, 'Karol', 'Rusin', 'dr', 'Wydział Nauk Społecznych i Humanistycznych', 10361),
(228, 'Jakub', 'Rzucidło', 'dr', 'Wydział Nauk Społecznych i Humanistycznych', 10382),
(229, 'Izabela', 'Selera', 'mgr', 'Wydział Nauk Społecznych i Humanistycznych', 172),
(230, 'Marcin', 'Sieja', 'dr', 'Wydział Nauk Społecznych i Humanistycznych', 178),
(231, 'Przemysław', 'Siudak', 'dr', 'Wydział Nauk Społecznych i Humanistycznych', 182),
(232, 'Beata', 'Skwarek', 'dr', 'Wydział Nauk Społecznych i Humanistycznych', 10223),
(233, 'Aldona', 'Sondej', 'mgr', 'Wydział Nauk Społecznych i Humanistycznych', 10081),
(238, 'Marta', 'Stanisławska', 'dr', 'Wydział Nauk Społecznych i Humanistycznych', 10394),
(239, 'Łukasz', 'Stawarz', 'mgr', 'Wydział Nauk Społecznych i Humanistycznych', 188),
(240, 'Dariusz', 'Stefaniak', 'mgr', 'Wydział Nauk Społecznych i Humanistycznych', 190),
(241, 'Józefa', 'Szczepankowska', 'mgr', 'Wydział Nauk Społecznych i Humanistycznych', 196),
(242, 'Andrzej', 'Szczepański', 'dr', 'Wydział Nauk Społecznych i Humanistycznych', 10168),
(246, 'Małgorzata', 'Szudrowicz-Garstka', 'dr', 'Wydział Nauk Społecznych i Humanistycznych', 317),
(247, 'Małgorzata', 'Szulc-Kurpaska', 'dr', 'Wydział Nauk Społecznych i Humanistycznych', 10084),
(248, 'Eugeniusz', 'Szydłowski', 'dr', 'Wydział Nauk Społecznych i Humanistycznych', 259),
(249, 'Magdalena', 'Szylar', 'mgr', 'Wydział Nauk Społecznych i Humanistycznych', 199),
(250, 'Katarzyna', 'Sępowicz-Buczko', 'dr', 'Wydział Nauk Społecznych i Humanistycznych', 176),
(251, 'Marcin', 'Tracz', 'mgr inż.', 'Wydział Nauk Społecznych i Humanistycznych', 10663),
(252, 'Mariusz', 'Trela', 'mgr', 'Wydział Nauk Społecznych i Humanistycznych', 10309),
(253, '–', 'Tuora', 'Schwierskott Ewa dr hab.', 'Wydział Nauk Społecznych i Humanistycznych', 0),
(254, 'Jerzy', 'Ulewski', 'mgr', 'Wydział Nauk Społecznych i Humanistycznych', 10431),
(259, 'Przemysław', 'Walczak', 'mgr', 'Wydział Nauk Społecznych i Humanistycznych', 10433),
(260, 'Anita', 'Wawrzyniak', 'mgr', 'Wydział Nauk Społecznych i Humanistycznych', 210),
(261, 'Mateusz', 'Wierzbicki', 'mgr', 'Wydział Nauk Społecznych i Humanistycznych', 10677),
(262, 'Bogumiła', 'Wnukowska', 'dr hab. inż.', 'Wydział Nauk Społecznych i Humanistycznych', 308),
(263, 'Zbigniew', 'Wróblewski', 'mgr', 'Wydział Nauk Społecznych i Humanistycznych', 220),
(264, 'Aleksandra', 'Wysowska', 'mgr', 'Wydział Nauk Społecznych i Humanistycznych', 10510),
(265, 'Dariusz', 'Wędzina', 'dr', 'Wydział Nauk Społecznych i Humanistycznych', 212),
(266, 'Sylwia', 'Zajchowska', 'mgr', 'Wydział Nauk Społecznych i Humanistycznych', 223),
(267, 'polski', 'j.', '- gr. ukraińska', 'Wydział Nauk Społecznych i Humanistycznych', 0),
(268, 'Agnieszka', 'Łakomska', 'mgr', 'Wydział Nauk Społecznych i Humanistycznych', 118),
(269, 'Witold', 'Łakomski', 'mgr', 'Wydział Nauk Społecznych i Humanistycznych', 10712),
(270, 'Marcin', 'Żmuda', 'mgr inż.', 'Wydział Nauk Społecznych i Humanistycznych', 10434),
(271, 'Joanna', 'Żółtańska', 'dr n. med.', 'Wydział Nauk Społecznych i Humanistycznych', 325),
(272, 'Jakub', 'Adamiak', 'mgr', 'Wydział Nauk o Zdrowiu i Kulturze Fizycznej', 10076),
(273, 'Abdallah', 'Ben', 'Katarzyna mgr', 'Wydział Nauk o Zdrowiu i Kulturze Fizycznej', 10779),
(274, 'Izabela', 'Bernatek-Zaguła', 'dr', 'Wydział Nauk o Zdrowiu i Kulturze Fizycznej', 9),
(275, 'Agnieszka', 'Bezdziecka', 'mgr', 'Wydział Nauk o Zdrowiu i Kulturze Fizycznej', 10605),
(276, 'Jolanta', 'Bielawska', 'dr n. med.', 'Wydział Nauk o Zdrowiu i Kulturze Fizycznej', 322),
(277, 'Czesława', 'Bigus-Hołubowicz', 'dr n.med.', 'Wydział Nauk o Zdrowiu i Kulturze Fizycznej', 10653),
(278, 'Małgorzata', 'Buchla', 'dr', 'Wydział Nauk o Zdrowiu i Kulturze Fizycznej', 18),
(279, 'Małgorzata', 'Bujnowska', 'dr n. med.', 'Wydział Nauk o Zdrowiu i Kulturze Fizycznej', 330),
(280, 'Jerzy', 'Błaszczuk', 'dr hab. n. med.', 'Wydział Nauk o Zdrowiu i Kulturze Fizycznej', 10504),
(281, 'Dorota', 'Cieciak', 'mgr', 'Wydział Nauk o Zdrowiu i Kulturze Fizycznej', 10207),
(282, 'Barbara', 'Cieślik', 'dr', 'Wydział Nauk o Zdrowiu i Kulturze Fizycznej', 10652),
(283, 'Anna', 'Czapulak-Jabłońska', 'mgr', 'Wydział Nauk o Zdrowiu i Kulturze Fizycznej', 10415),
(284, 'Franciszka', 'Czepiel-Kloc', 'mgr', 'Wydział Nauk o Zdrowiu i Kulturze Fizycznej', 10194),
(285, 'Dorota', 'Domińska-Werbel', 'dr', 'Wydział Nauk o Zdrowiu i Kulturze Fizycznej', 35),
(286, 'Szymon', 'Dorowski', 'mgr', 'Wydział Nauk o Zdrowiu i Kulturze Fizycznej', 10790),
(287, 'Ewa', 'Draczyńska', 'mgr', 'Wydział Nauk o Zdrowiu i Kulturze Fizycznej', 10505),
(288, 'Adam', 'Druszcz', 'dr n. med.', 'Wydział Nauk o Zdrowiu i Kulturze Fizycznej', 10797),
(289, 'Wioletta', 'Drzystek', 'dr', 'Wydział Nauk o Zdrowiu i Kulturze Fizycznej', 39),
(290, 'Grażyna', 'Durek', 'prof. dr hab. n. med.', 'Wydział Nauk o Zdrowiu i Kulturze Fizycznej', 10121),
(291, 'Anna', 'Filipienko', 'mgr', 'Wydział Nauk o Zdrowiu i Kulturze Fizycznej', 10071),
(292, 'Iwona', 'Florek', 'mgr', 'Wydział Nauk o Zdrowiu i Kulturze Fizycznej', 10007),
(293, 'Małgorzata', 'Fortuna', 'dr', 'Wydział Nauk o Zdrowiu i Kulturze Fizycznej', 10834),
(294, 'Arkadiusz', 'Gdula', 'mgr', 'Wydział Nauk o Zdrowiu i Kulturze Fizycznej', 10545),
(295, 'Renata', 'Gnitecka', 'dr inż.', 'Wydział Nauk o Zdrowiu i Kulturze Fizycznej', 49),
(296, 'Barbara', 'Golicz', 'mgr', 'Wydział Nauk o Zdrowiu i Kulturze Fizycznej', 10144),
(297, 'Zuzanna', 'Goluch', 'dr hab. inż.', 'Wydział Nauk o Zdrowiu i Kulturze Fizycznej', 10791),
(298, 'Ewa', 'Groszewska', 'dr', 'Wydział Nauk o Zdrowiu i Kulturze Fizycznej', 10503),
(299, 'Łukasz', 'Gruba', 'mgr', 'Wydział Nauk o Zdrowiu i Kulturze Fizycznej', 10781),
(300, 'Dorota', 'Góra-Pachoń', 'mgr', 'Wydział Nauk o Zdrowiu i Kulturze Fizycznej', 10497),
(301, 'Józefa', 'Górska-Zając', 'mgr inż.', 'Wydział Nauk o Zdrowiu i Kulturze Fizycznej', 50),
(302, 'Jerzy', 'Heimrath', 'dr hab.', 'Wydział Nauk o Zdrowiu i Kulturze Fizycznej', 10800),
(303, 'Roman', 'Hojniak', 'mgr inż.', 'Wydział Nauk o Zdrowiu i Kulturze Fizycznej', 61),
(304, 'Renata', 'Hołowiak', 'mgr', 'Wydział Nauk o Zdrowiu i Kulturze Fizycznej', 324),
(305, 'Wanda', 'Hurej', 'mgr', 'Wydział Nauk o Zdrowiu i Kulturze Fizycznej', 10181),
(306, 'Magdalena', 'Hurkacz', 'dr', 'Wydział Nauk o Zdrowiu i Kulturze Fizycznej', 10792),
(307, 'Kornelia', 'Hübscher', 'dr', 'Wydział Nauk o Zdrowiu i Kulturze Fizycznej', 62),
(308, 'Anna', 'Idczak', 'mgr', 'Wydział Nauk o Zdrowiu i Kulturze Fizycznej', 10795),
(309, 'Emilia', 'Jaros', 'mgr', 'Wydział Nauk o Zdrowiu i Kulturze Fizycznej', 10786),
(310, 'Jacek', 'Jazy', 'lek.', 'Wydział Nauk o Zdrowiu i Kulturze Fizycznej', 10835),
(312, 'Agnieszka', 'Kaczan', 'mgr', 'Wydział Nauk o Zdrowiu i Kulturze Fizycznej', 10531),
(313, 'Monika', 'Kamieniecka', 'mgr', 'Wydział Nauk o Zdrowiu i Kulturze Fizycznej', 10340),
(314, 'Katarzyna', 'Kardasz', 'mgr', 'Wydział Nauk o Zdrowiu i Kulturze Fizycznej', 10833),
(315, 'Ewa', 'Karlińska', 'mgr', 'Wydział Nauk o Zdrowiu i Kulturze Fizycznej', 10417),
(316, 'Wojciech', 'Kasprzyk', 'dr', 'Wydział Nauk o Zdrowiu i Kulturze Fizycznej', 10405),
(317, 'Marcin', 'Klimczak', 'mgr', 'Wydział Nauk o Zdrowiu i Kulturze Fizycznej', 10526),
(318, 'Halina', 'Komorowicz', 'mgr', 'Wydział Nauk o Zdrowiu i Kulturze Fizycznej', 10028),
(319, 'Grzegorz', 'Konieczny', 'dr', 'Wydział Nauk o Zdrowiu i Kulturze Fizycznej', 10318),
(320, 'Filip', 'Kostek', 'mgr', 'Wydział Nauk o Zdrowiu i Kulturze Fizycznej', 10604),
(321, 'Anna', 'Kowal-Orczykowska', 'dr', 'Wydział Nauk o Zdrowiu i Kulturze Fizycznej', 97),
(322, 'Iwona', 'Kowalik', 'mgr', 'Wydział Nauk o Zdrowiu i Kulturze Fizycznej', 10262),
(323, 'Jerzy', 'Kołodziej', 'prof. dr hab. n. med.', 'Wydział Nauk o Zdrowiu i Kulturze Fizycznej', 10342),
(324, 'Beata', 'Krzyżanowska', 'mgr', 'Wydział Nauk o Zdrowiu i Kulturze Fizycznej', 10846),
(325, 'Adam', 'Kuźmiński', 'dr n. med.', 'Wydział Nauk o Zdrowiu i Kulturze Fizycznej', 10073),
(326, 'Artur', 'Kwiatkowski', 'dr n. med.', 'Wydział Nauk o Zdrowiu i Kulturze Fizycznej', 0),
(327, 'Ryszard', 'Kępa', 'lek.', 'Wydział Nauk o Zdrowiu i Kulturze Fizycznej', 10845),
(328, 'Nikolaj', 'Lambrinow', 'lek.', 'Wydział Nauk o Zdrowiu i Kulturze Fizycznej', 10813),
(329, 'Katarzyna', 'Lisowska', 'dr', 'Wydział Nauk o Zdrowiu i Kulturze Fizycznej', 115),
(330, 'Gabriela', 'Lisowska', 'mgr', 'Wydział Nauk o Zdrowiu i Kulturze Fizycznej', 10435),
(331, 'Paulina', 'Listwan', 'mgr', 'Wydział Nauk o Zdrowiu i Kulturze Fizycznej', 10362),
(332, 'Daria', 'Marchwat', 'mgr', 'Wydział Nauk o Zdrowiu i Kulturze Fizycznej', 10787),
(333, 'Krzysztof', 'Małyszczak', 'dr hab. n. med.', 'Wydział Nauk o Zdrowiu i Kulturze Fizycznej', 0),
(334, 'Edyta', 'Mikołajek', 'mgr', 'Wydział Nauk o Zdrowiu i Kulturze Fizycznej', 10145),
(335, 'Marzena', 'Miłosz', 'mgr', 'Wydział Nauk o Zdrowiu i Kulturze Fizycznej', 10266),
(336, 'Maria', 'Muraszka', 'mgr', 'Wydział Nauk o Zdrowiu i Kulturze Fizycznej', 163),
(337, 'Renata', 'Myrna-Bekas', 'dr', 'Wydział Nauk o Zdrowiu i Kulturze Fizycznej', 139),
(338, 'Kamil', 'Nowak', 'mgr', 'Wydział Nauk o Zdrowiu i Kulturze Fizycznej', 10780),
(339, 'pielęgniarska', 'Olimpiada', '', 'Wydział Nauk o Zdrowiu i Kulturze Fizycznej', 0),
(340, 'Lilia', 'Omelan', 'dr', 'Wydział Nauk o Zdrowiu i Kulturze Fizycznej', 143),
(341, 'Bernard', 'Panaszek', 'prof. dr hab. n. med.', 'Wydział Nauk o Zdrowiu i Kulturze Fizycznej', 10656),
(342, 'Jerzy', 'Pietkiewicz', 'prof. dr hab. inż.', 'Wydział Nauk o Zdrowiu i Kulturze Fizycznej', 147),
(343, 'Ryszard', 'Pisarski', 'prof.dr hab.inż.', 'Wydział Nauk o Zdrowiu i Kulturze Fizycznej', 149),
(344, 'Natalia', 'Pobirchenko', 'prof. dr hab.', 'Wydział Nauk o Zdrowiu i Kulturze Fizycznej', 10337),
(345, 'Anna', 'Pączkowska', 'mgr', 'Wydział Nauk o Zdrowiu i Kulturze Fizycznej', 10020),
(346, 'Karolina', 'Radka', 'lek.', 'Wydział Nauk o Zdrowiu i Kulturze Fizycznej', 10801),
(347, 'Małgorzata', 'Reszko', 'mgr', 'Wydział Nauk o Zdrowiu i Kulturze Fizycznej', 10269),
(348, 'Olga', 'Rewak', 'mgr', 'Wydział Nauk o Zdrowiu i Kulturze Fizycznej', 10789),
(350, 'Łukasz', 'Rogowski', 'dr', 'Wydział Nauk o Zdrowiu i Kulturze Fizycznej', 10657),
(351, 'Piotr', 'Rola', 'dr n. med.', 'Wydział Nauk o Zdrowiu i Kulturze Fizycznej', 10783),
(352, 'Jakub', 'Rzucidło', 'dr', 'Wydział Nauk o Zdrowiu i Kulturze Fizycznej', 10382),
(353, 'Magdalena', 'Sajnach', 'mgr', 'Wydział Nauk o Zdrowiu i Kulturze Fizycznej', 10708),
(354, 'Anna', 'Santorowska', 'mgr', 'Wydział Nauk o Zdrowiu i Kulturze Fizycznej', 10709),
(355, 'Zygmunt', 'Sawicki', 'dr', 'Wydział Nauk o Zdrowiu i Kulturze Fizycznej', 10599),
(356, 'Izabela', 'Selera', 'mgr', 'Wydział Nauk o Zdrowiu i Kulturze Fizycznej', 172),
(357, 'Karol', 'Selwat', 'dr', 'Wydział Nauk o Zdrowiu i Kulturze Fizycznej', 173),
(358, 'Marcin', 'Sieja', 'dr', 'Wydział Nauk o Zdrowiu i Kulturze Fizycznej', 178),
(359, 'Katarzyna', 'Skała', 'lek.', 'Wydział Nauk o Zdrowiu i Kulturze Fizycznej', 0),
(360, 'Monika', 'Sobolak', 'dr', 'Wydział Nauk o Zdrowiu i Kulturze Fizycznej', 10799),
(361, 'Marta', 'Soboń', 'mgr', 'Wydział Nauk o Zdrowiu i Kulturze Fizycznej', 10210),
(362, 'Aldona', 'Sondej', 'mgr', 'Wydział Nauk o Zdrowiu i Kulturze Fizycznej', 10081),
(363, 'Grażyna', 'Sondel', 'dr', 'Wydział Nauk o Zdrowiu i Kulturze Fizycznej', 186),
(368, 'Monika', 'Stanaszek', 'dr', 'Wydział Nauk o Zdrowiu i Kulturze Fizycznej', 10798),
(369, 'Łukasz', 'Stawarz', 'mgr', 'Wydział Nauk o Zdrowiu i Kulturze Fizycznej', 188),
(370, 'Aneta', 'Stężycka', 'mgr', 'Wydział Nauk o Zdrowiu i Kulturze Fizycznej', 10211),
(371, 'Józefa', 'Szczepankowska', 'mgr', 'Wydział Nauk o Zdrowiu i Kulturze Fizycznej', 196),
(373, 'Agata', 'Szocińska', 'mgr', 'Wydział Nauk o Zdrowiu i Kulturze Fizycznej', 10703),
(374, 'Magdalena', 'Szylar', 'mgr', 'Wydział Nauk o Zdrowiu i Kulturze Fizycznej', 199),
(375, 'Małgorzata', 'Słupska-Kartaczowska', 'mgr', 'Wydział Nauk o Zdrowiu i Kulturze Fizycznej', 10146),
(376, 'Katarzyna', 'Sępowicz-Buczko', 'dr', 'Wydział Nauk o Zdrowiu i Kulturze Fizycznej', 176),
(377, 'Marcin', 'Tracz', 'mgr inż.', 'Wydział Nauk o Zdrowiu i Kulturze Fizycznej', 10663),
(378, 'Katarzyna', 'Traczuk-Bernat', 'mgr', 'Wydział Nauk o Zdrowiu i Kulturze Fizycznej', 10329),
(379, 'Mariusz', 'Trela', 'mgr', 'Wydział Nauk o Zdrowiu i Kulturze Fizycznej', 10309),
(380, 'Renata', 'Trochowska', 'mgr', 'Wydział Nauk o Zdrowiu i Kulturze Fizycznej', 10794),
(381, 'Beata', 'Turkiewicz', 'mgr', 'Wydział Nauk o Zdrowiu i Kulturze Fizycznej', 10715),
(382, 'Iwona', 'Twarogowska-Wielesik', 'dr inż.', 'Wydział Nauk o Zdrowiu i Kulturze Fizycznej', 10346),
(383, 'Witold', 'Urbanik', 'dr', 'Wydział Nauk o Zdrowiu i Kulturze Fizycznej', 204),
(386, 'Ewa', 'Walczak-Chajec', 'dr inż.', 'Wydział Nauk o Zdrowiu i Kulturze Fizycznej', 10001),
(387, 'Wioletta', 'Wesołowska', 'mgr', 'Wydział Nauk o Zdrowiu i Kulturze Fizycznej', 10788),
(388, 'Monika', 'Wierzbicka', 'dr', 'Wydział Nauk o Zdrowiu i Kulturze Fizycznej', 10321),
(389, 'Mateusz', 'Wierzbicki', 'mgr', 'Wydział Nauk o Zdrowiu i Kulturze Fizycznej', 10677),
(390, 'Marzena', 'Witek', 'mgr', 'Wydział Nauk o Zdrowiu i Kulturze Fizycznej', 10659),
(391, 'Krzysztof', 'Wronecki', 'dr hab. n. med.', 'Wydział Nauk o Zdrowiu i Kulturze Fizycznej', 10254),
(392, 'Izabela', 'Wróblewska', 'dr hab.', 'Wydział Nauk o Zdrowiu i Kulturze Fizycznej', 10704),
(393, 'Aleksandra', 'Wysowska', 'mgr', 'Wydział Nauk o Zdrowiu i Kulturze Fizycznej', 10510),
(394, 'Adrian', 'Włodarczak', 'dr hab. n. med.', 'Wydział Nauk o Zdrowiu i Kulturze Fizycznej', 10784),
(395, 'Dariusz', 'Wędzina', 'dr', 'Wydział Nauk o Zdrowiu i Kulturze Fizycznej', 212),
(396, 'Katarzyna', 'Zabłotna', 'mgr', 'Wydział Nauk o Zdrowiu i Kulturze Fizycznej', 10428),
(397, 'Dorota', 'Zajdel', 'mgr', 'Wydział Nauk o Zdrowiu i Kulturze Fizycznej', 10277),
(398, 'Magdalena', 'Zakrawacz', 'mgr', 'Wydział Nauk o Zdrowiu i Kulturze Fizycznej', 10352),
(399, 'Przemysław', 'Zarzeczny', 'lek.', 'Wydział Nauk o Zdrowiu i Kulturze Fizycznej', 10843),
(400, 'Grażyna', 'Zawadzka', 'mgr', 'Wydział Nauk o Zdrowiu i Kulturze Fizycznej', 10812),
(402, 'Beata', 'Łabowicz', 'mgr', 'Wydział Nauk o Zdrowiu i Kulturze Fizycznej', 10043),
(403, 'Agnieszka', 'Łakomska', 'mgr', 'Wydział Nauk o Zdrowiu i Kulturze Fizycznej', 118),
(404, 'Katarzyna', 'Śliwińska', 'mgr', 'Wydział Nauk o Zdrowiu i Kulturze Fizycznej', 10228),
(405, 'Kamila', 'Ślusarczyk', 'mgr inż.', 'Wydział Nauk o Zdrowiu i Kulturze Fizycznej', 10320),
(406, 'Marcin', 'Żmuda', 'mgr inż.', 'Wydział Nauk o Zdrowiu i Kulturze Fizycznej', 10434),
(407, 'Joanna', 'Żółtańska', 'dr n. med.', 'Wydział Nauk o Zdrowiu i Kulturze Fizycznej', 325),
(408, 'Agnieszka', 'Błaszczyk-Szabat', 'dr', 'Erasmus', 312),
(409, 'Joanna', 'Czarnecka', 'mgr', 'Erasmus', 29),
(410, 'Dorota', 'Domińska-Werbel', 'dr', 'Erasmus', 35),
(411, 'Paweł', 'Dąbrowa', 'dr inż.', 'Erasmus', 10360),
(412, 'Zbigniew', 'Fryźlewicz', 'dr inż.', 'Erasmus', 46),
(413, 'Kornelia', 'Hübscher', 'dr', 'Erasmus', 62),
(414, 'Joanna', 'Kenc', 'dr', 'Erasmus', 83),
(415, 'Aleksander', 'Klosow', 'dr', 'Erasmus', 85),
(416, 'Paweł', 'Kobes', 'dr', 'Erasmus', 86),
(417, 'Agnieszka', 'Kos', 'dr', 'Erasmus', 10282),
(418, 'Anna', 'Kowal-Orczykowska', 'dr', 'Erasmus', 97),
(419, 'Rafał', 'Kubik', 'dr', 'Erasmus', 10392),
(420, 'Justyna', 'Lewandowska-Bratek', 'dr', 'Erasmus', 10665),
(421, 'Paweł', 'Macuga', 'mgr', 'Erasmus', 122),
(422, 'Piotr', 'Nadybski', 'dr inż.', 'Erasmus', 299),
(423, 'Lilia', 'Omelan', 'dr', 'Erasmus', 143),
(424, 'Jolanta', 'Radkowska', 'dr', 'Erasmus', 158),
(425, 'Krzysztof', 'Rewak', 'mgr inż.', 'Erasmus', 10377),
(427, 'Ryszard', 'Rębowski', 'dr inż.', 'Erasmus', 161),
(428, 'Karol', 'Selwat', 'dr', 'Erasmus', 173),
(429, 'Przemysław', 'Siudak', 'dr', 'Erasmus', 182),
(430, 'Tomasz', 'Stechnij', 'dr inż.', 'Erasmus', 10185),
(431, 'Ewa', 'Szkic-Czech', 'dr', 'Erasmus', 10662),
(432, 'Małgorzata', 'Szulc-Kurpaska', 'dr', 'Erasmus', 10084),
(433, 'Witold', 'Urbanik', 'dr', 'Erasmus', 204),
(434, 'Anna', 'Zurek', 'mgr', 'Erasmus', 10667),
(435, 'Arkadiusz', 'Zurek', 'mgr', 'Erasmus', 10612),
(436, 'Agnieszka', 'Łakomska', 'mgr', 'Erasmus', 118),
(437, 'Kamila', 'Ślusarczyk', 'mgr inż.', 'Erasmus', 10320),
(438, 'Kamila', 'Fiszer', 'mgr', 'Wychowanie fizyczne', 10727),
(439, 'Renata', 'Myrna-Bekas', 'dr', 'Wychowanie fizyczne', 139),
(440, 'Grażyna', 'Sondel', 'dr', 'Wychowanie fizyczne', 186),
(441, 'Łukasz', 'Stawarz', 'mgr', 'Wychowanie fizyczne', 188),
(442, 'Dariusz', 'Stefaniak', 'mgr', 'Wychowanie fizyczne', 190),
(443, 'Mateusz', 'Wierzbicki', 'mgr', 'Wychowanie fizyczne', 10677);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `password_reset_tokens`
--

INSERT INTO `password_reset_tokens` (`email`, `token`, `created_at`) VALUES
('kermes19@gmail.com', '$2y$10$uWOel/am1EVeLOYEq7mG2eavwf9iPFD28M1TXcGtoFtSvU2M0o0wy', '2023-03-09 10:38:12');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `schedule`
--

CREATE TABLE `schedule` (
  `id_lecture` int(11) NOT NULL,
  `id_lecturer` int(11) NOT NULL,
  `id_group` int(11) NOT NULL,
  `id_room` int(11) NOT NULL,
  `time_start` datetime NOT NULL,
  `time_end` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `user_events`
--

CREATE TABLE `user_events` (
  `id_event` int(11) NOT NULL,
  `id_laravel_user` int(11) NOT NULL,
  `event_name` int(11) NOT NULL,
  `time_start` datetime NOT NULL,
  `time_end` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `clasrooms`
--
ALTER TABLE `clasrooms`
  ADD PRIMARY KEY (`id_room`);

--
-- Indeksy dla tabeli `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indeksy dla tabeli `field_of_study`
--
ALTER TABLE `field_of_study`
  ADD PRIMARY KEY (`id_group`),
  ADD KEY `id_faculty` (`id_faculty`);

--
-- Indeksy dla tabeli `lecturers`
--
ALTER TABLE `lecturers`
  ADD PRIMARY KEY (`id_lecturer`);

--
-- Indeksy dla tabeli `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indeksy dla tabeli `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indeksy dla tabeli `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indeksy dla tabeli `schedule`
--
ALTER TABLE `schedule`
  ADD PRIMARY KEY (`id_lecture`),
  ADD KEY `id_lecturer` (`id_lecturer`),
  ADD KEY `id_group` (`id_group`),
  ADD KEY `id_room` (`id_room`);

--
-- Indeksy dla tabeli `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indeksy dla tabeli `user_events`
--
ALTER TABLE `user_events`
  ADD PRIMARY KEY (`id_event`),
  ADD KEY `id_laravel_user` (`id_laravel_user`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `clasrooms`
--
ALTER TABLE `clasrooms`
  MODIFY `id_room` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=113;

--
-- AUTO_INCREMENT dla tabeli `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `field_of_study`
--
ALTER TABLE `field_of_study`
  MODIFY `id_group` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;

--
-- AUTO_INCREMENT dla tabeli `lecturers`
--
ALTER TABLE `lecturers`
  MODIFY `id_lecturer` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=444;

--
-- AUTO_INCREMENT dla tabeli `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT dla tabeli `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `schedule`
--
ALTER TABLE `schedule`
  MODIFY `id_lecture` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT dla tabeli `user_events`
--
ALTER TABLE `user_events`
  MODIFY `id_event` int(11) NOT NULL AUTO_INCREMENT;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `schedule`
--
ALTER TABLE `schedule`
  ADD CONSTRAINT `schedule_ibfk_1` FOREIGN KEY (`id_lecturer`) REFERENCES `lecturers` (`id_lecturer`),
  ADD CONSTRAINT `schedule_ibfk_2` FOREIGN KEY (`id_group`) REFERENCES `field_of_study` (`id_group`),
  ADD CONSTRAINT `schedule_ibfk_3` FOREIGN KEY (`id_room`) REFERENCES `clasrooms` (`id_room`);

--
-- Ograniczenia dla tabeli `user_events`
--
ALTER TABLE `user_events`
  ADD CONSTRAINT `user_events_ibfk_1` FOREIGN KEY (`id_laravel_user`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
