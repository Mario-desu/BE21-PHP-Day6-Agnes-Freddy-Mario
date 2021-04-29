-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 29. Apr 2021 um 23:15
-- Server-Version: 10.4.18-MariaDB
-- PHP-Version: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `crud_booking`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `agency`
--

CREATE TABLE `agency` (
  `agencyId` int(11) NOT NULL,
  `agency_name` varchar(100) NOT NULL,
  `agency_email` varchar(50) DEFAULT NULL,
  `agency_website` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `agency`
--

INSERT INTO `agency` (`agencyId`, `agency_name`, `agency_email`, `agency_website`) VALUES
(1, 'TUI', 'office@tui.at', 'www.tui.at'),
(2, 'Ruefa', 'office@ruefa.at', 'www.ruefa.at'),
(3, 'Sunshine Travel', 'office@sunshine.at', 'www.sunshine.at');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `booking`
--

CREATE TABLE `booking` (
  `bookingID` int(11) NOT NULL,
  `fk_userID` int(11) NOT NULL,
  `fk_hotelID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `booking`
--

INSERT INTO `booking` (`bookingID`, `fk_userID`, `fk_hotelID`) VALUES
(4, 1, 2),
(5, 1, 2),
(8, 1, 2),
(16, 1, 2),
(17, 1, 2),
(18, 1, 2),
(19, 1, 2),
(20, 1, 2),
(21, 1, 2),
(6, 1, 4),
(7, 1, 4),
(9, 1, 4),
(10, 1, 4),
(11, 1, 4),
(12, 1, 4),
(13, 1, 4),
(14, 1, 4),
(15, 1, 4);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `hotels`
--

CREATE TABLE `hotels` (
  `hotel_id` int(11) NOT NULL,
  `hotelName` varchar(255) NOT NULL,
  `hotelLoc` varchar(255) NOT NULL,
  `hotelPrice` decimal(13,2) NOT NULL,
  `hotelImage` varchar(255) DEFAULT NULL,
  `fk_agencyId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `hotels`
--

INSERT INTO `hotels` (`hotel_id`, `hotelName`, `hotelLoc`, `hotelPrice`, `hotelImage`, `fk_agencyId`) VALUES
(2, 'Marriott Hotel', 'Poland', '500.00', '60883c5695d59.jpg', NULL),
(3, 'Hotel Bristol', 'Salzburg', '333.00', '6089ad106a596.jpg', NULL),
(4, 'Hotel Imperial', 'Vienna', '450.00', '608a765182790.jpg', NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `f_name` varchar(255) NOT NULL,
  `l_name` varchar(255) NOT NULL,
  `pass` varchar(255) NOT NULL,
  `date_of_birth` date NOT NULL,
  `email` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `status` varchar(4) NOT NULL DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `user`
--

INSERT INTO `user` (`id`, `f_name`, `l_name`, `pass`, `date_of_birth`, `email`, `image`, `status`) VALUES
(1, 'Mario', 'Hartleb', '1ad4ab0a74a2483318322183d0807282f01f2d8ba6779fd6bd28d871f06885b0', '2021-04-17', 'mario@gmail.com', 'avatar.png', 'adm'),
(6, 'Agnes', 'Nowak', '5515b3e1dfd3915480ba41e403cd2e9d1f7cc0bcce28ee3f05dbb5890ab1bb58', '2021-04-16', 'agnes@gmail.com', '608a76b6c8182.jpg', 'user');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `agency`
--
ALTER TABLE `agency`
  ADD PRIMARY KEY (`agencyId`);

--
-- Indizes für die Tabelle `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`bookingID`),
  ADD KEY `fk_userID` (`fk_userID`,`fk_hotelID`),
  ADD KEY `fk_hotelID` (`fk_hotelID`);

--
-- Indizes für die Tabelle `hotels`
--
ALTER TABLE `hotels`
  ADD PRIMARY KEY (`hotel_id`),
  ADD KEY `fk_agencyId` (`fk_agencyId`);

--
-- Indizes für die Tabelle `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `agency`
--
ALTER TABLE `agency`
  MODIFY `agencyId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `booking`
--
ALTER TABLE `booking`
  MODIFY `bookingID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT für Tabelle `hotels`
--
ALTER TABLE `hotels`
  MODIFY `hotel_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT für Tabelle `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`fk_hotelID`) REFERENCES `hotels` (`hotel_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`fk_userID`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints der Tabelle `hotels`
--
ALTER TABLE `hotels`
  ADD CONSTRAINT `hotels_ibfk_1` FOREIGN KEY (`fk_agencyId`) REFERENCES `agency` (`agencyId`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
