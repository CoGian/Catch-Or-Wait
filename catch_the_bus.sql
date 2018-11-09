-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 09, 2018 at 09:50 PM
-- Server version: 5.7.23
-- PHP Version: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `catch_the_bus`
--

-- --------------------------------------------------------

--
-- Table structure for table `buses`
--

DROP TABLE IF EXISTS `buses`;
CREATE TABLE IF NOT EXISTS `buses` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `href` varchar(535) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `buses`
--

INSERT INTO `buses` (`id`, `name`, `href`) VALUES
('83', 'ΛΑΓΚΑΔΑΣ - ΘΕΣ/ΝΙΚΗ (ΕΞΠΡΕΣ)', 'http://oasth.gr/#el/routeinfo/list/475/16/17/'),
('27', 'ΣΤΑΥΡΟΥΠΟΛΗ-ΠΑΝΕΠΙΣΤΗΜΙΟ', 'http://oasth.gr/#el/routeinfo/list/84/46/1/');

-- --------------------------------------------------------

--
-- Table structure for table `has`
--

DROP TABLE IF EXISTS `has`;
CREATE TABLE IF NOT EXISTS `has` (
  `bus_id` varchar(25) NOT NULL,
  `stop_id` varchar(25) NOT NULL,
  PRIMARY KEY (`bus_id`,`stop_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `has`
--

INSERT INTO `has` (`bus_id`, `stop_id`) VALUES
('27', '01007'),
('27', '01020'),
('27', '01021'),
('27', '01024'),
('27', '01042'),
('27', '01043'),
('27', '01045'),
('27', '01046'),
('27', '01047'),
('27', '01048'),
('27', '01049'),
('27', '01050'),
('27', '01051'),
('27', '01052'),
('27', '01115'),
('27', '01120'),
('27', '01134'),
('27', '01139'),
('27', '01140'),
('27', '01306'),
('27', '01307'),
('27', '01308'),
('27', '01309'),
('27', '01459'),
('27', '07001'),
('27', '07002'),
('27', '07003'),
('27', '07004'),
('27', '07005'),
('27', '07006'),
('27', '09009'),
('27', '09010'),
('27', '09011'),
('27', '09012'),
('27', '09049'),
('27', '09050'),
('27', '09051'),
('27', '09052'),
('27', '09057'),
('27', '09063'),
('27', '09064'),
('27', '09065'),
('27', '09066'),
('27', '09068'),
('27', '10002'),
('27', '10003'),
('27', '10005'),
('27', '10006'),
('27', '10008'),
('27', '10009'),
('27', '10010'),
('27', '10027'),
('27', '10092'),
('27', '11008'),
('27', '11024'),
('27', '11026'),
('27', '11029'),
('27', '11079'),
('27', '11080'),
('27', '23005'),
('83', '01024'),
('83', '01043'),
('83', '01045'),
('83', '01134'),
('83', '01308'),
('83', '01309'),
('83', '01459'),
('83', '07002'),
('83', '07003'),
('83', '09049'),
('83', '09050'),
('83', '09065'),
('83', '09066'),
('83', '26001'),
('83', '26002'),
('83', '26003'),
('83', '26004'),
('83', '26005'),
('83', '26006'),
('83', '26007'),
('83', '26029'),
('83', '26033'),
('83', '26034'),
('83', '26035'),
('83', '26036'),
('83', '26037'),
('83', '26038'),
('83', '26039'),
('83', '26040'),
('83', '26108'),
('83', '26110'),
('83', '26111'),
('83', '26194'),
('83', '26212'),
('83', '26213'),
('83', '26216'),
('83', '26237'),
('83', '26238');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bus_id` varchar(255) NOT NULL,
  `stop_id` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `time` time NOT NULL,
  PRIMARY KEY (`id`),
  KEY `time` (`time`) USING HASH
) ENGINE=MyISAM AUTO_INCREMENT=103 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `bus_id`, `stop_id`, `phone`, `time`) VALUES
(102, '14', '20123', '6982233611', '16:55:00'),
(101, '14', '20123', '6982233611', '16:37:00');

-- --------------------------------------------------------

--
-- Table structure for table `stops`
--

DROP TABLE IF EXISTS `stops`;
CREATE TABLE IF NOT EXISTS `stops` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stops`
--

INSERT INTO `stops` (`id`, `name`) VALUES
('01309', 'ΠΛΑΤΕΙΑ ΔΗΜΟΚΡΑΤΙΑΣ '),
('01020', 'ΕΡΓΑΤΙΚΕΣ ΚΑΤΟΙΚΙΕΣ '),
('01007', 'ΓΕΦΥΡΑ '),
('07002', 'ΑΓΙΑ ΠΑΡΑΣΚΕΥΗ '),
('07004', 'ΣΤΡΟΦΗ ΝΕΑΠΟΛΗΣ '),
('07006', 'ΣΥΜΜΑΧΙΚΑ '),
('09064', 'ΠΑΥΛΟΥ ΜΕΛΑ '),
('09066', 'ΤΑΧΥΔΡΟΜΕΙΟ '),
('09057', 'ΔΗΜΑΡΧΕΙΟ ΠΑΥΛΟΥ ΜΕΛΑ '),
('09052', 'ΚΕΝΤΡΟ ΠΟΛΙΤΙΣΜΟΥ '),
('09049', 'ΣΤΑΥΡΟΥΠΟΛ '),
('09012', 'ΒΕΛΙΣΣΑΡΙΟΥ '),
('09009', 'ΣΤΡΟΦΗ ΚΑΡΑΤΑΣΟΥ '),
('09010', 'ΠΑΛΙΟ ΤΕΡΜΑ '),
('09011', 'ΔΙΑΣΤΑΥΡΩΣΗ ΠΕΡΙΦΕΡΕΙΑΚΗΣ '),
('10005', 'ΚΑΠΝΟΜΑΓΑΖΑ '),
('10003', 'ΚΑΖΜΠΑ 1 '),
('10002', 'ΔΙΑΝΑ '),
('11026', 'ΑΜΑΞΟΣΤΑΣΙΟ ΣΤΑΥΡΟΥΠΟΛΗΣ '),
('11024', 'Τ.Σ. ΣΤΑΥΡΟΥΠΟΛΗΣ '),
('01307', 'ΚΟΛΟΜΒΟΥ '),
('01459', 'ΑΝΤΙΓΟΝΙΔΩΝ '),
('01043', 'ΠΛΑΤΕΙΑ ΑΡΙΣΤΟΤΕΛΟΥΣ '),
('01046', 'ΜΗΤΡΟΠΟΛΙΤΟΥ ΓΕΝΝΑΔΙΟΥ '),
('01048', 'ΑΓΙΑΣ ΣΟΦΙΑΣ '),
('01049', 'ΙΑΣΩΝΙΔΟΥ '),
('01052', 'ΚΑΜΑΡΑ '),
('01140', 'ΣΙΝΤΡΙΒΑΝΙ '),
('01139', 'Α.Χ.Ε.Π.Α. '),
('01134', 'Τ.Σ. ΠΑΝΕΠΙΣΤΗΜΙΑ '),
('01120', 'ΜΟΥΣΕΙΑ '),
('01115', 'ΑΓΓΕΛΑΚΗ '),
('01051', 'ΚΑΜΑΡΑ '),
('01050', 'ΙΑΣΩΝΙΔΟΥ '),
('01047', 'ΑΓΙΑΣ ΣΟΦΙΑΣ '),
('01045', 'ΠΛΑΤΕΙΑ ΑΡΙΣΤΟΤΕΛΟΥΣ '),
('01042', 'ΑΛΚΑΖΑΡ '),
('01024', 'ΑΝΤΙΓΟΝΙΔΩΝ '),
('01306', 'ΚΟΛΟΜΒΟΥ '),
('01308', 'ΠΛΑΤΕΙΑ ΔΗΜΟΚΡΑΤΙΑΣ '),
('01021', 'ΕΡΓΑΤΙΚΕΣ ΚΑΤΟΙΚΙΕΣ '),
('07001', 'ΓΕΦΥΡΑ '),
('07003', 'ΑΓΙΑ ΠΑΡΑΣΚΕΥΗ '),
('07005', 'ΣΥΜΜΑΧΙΚΑ '),
('09063', 'ΠΑΥΛΟΥ ΜΕΛΑ '),
('09065', 'ΤΑΧΥΔΡΟΜΕΙΟ '),
('09068', 'ΔΗΜΑΡΧΕΙΟ ΠΑΥΛΟΥ ΜΕΛΑ '),
('09051', 'ΚΕΝΤΡΟ ΠΟΛΙΤΙΣΜΟΥ '),
('09050', 'ΣΤΑΥΡΟΥΠΟΛ '),
('10008', 'ΣΤΡΟΦΗ ΚΑΡΑΤΑΣΟΥ '),
('10027', 'ΑΝΘΟΚΗΠΟΙ '),
('10009', 'ΠΑΛΙΟ ΤΕΡΜΑ '),
('10010', 'ΔΙΑΣΤΑΥΡΩΣΗ ΠΕΡΙΦΕΡΕΙΑΚΗΣ '),
('10006', 'ΚΑΠΝΟΜΑΓΑΖΑ '),
('10092', 'ΠΕΖΟΓΕΦΥΡΑ '),
('11029', 'ΣΤΡΟΦΗ ΩΡΑΙΟΚΑΣΤΡΟΥ '),
('11079', 'FIERRA S.A '),
('11080', 'ΜΙΝΕΡΒΑ '),
('11008', 'ΣΤΡΟΦΗ 14ΩΝ ΗΡΩΩΝ '),
('23005', 'ΚΟΜΒΟΣ ΕΞΩΤΕΡΙΚΗΣ ΠΕΡΙΦΕΡΕΙΑΚΗΣ ΟΔΟΥ '),
('26212', 'Τ.Σ. ΛΑΓΚΑΔΑ '),
('26232', 'ΔΗΜΟΤΙΚΟ ΣΤΑΔΙΟ '),
('26238', 'ΠΑΡΟΔΟΣ ΤΖΕΛΙΛΗ '),
('26235', 'ΑΧΙΛΛΕΑ ΤΖΕΛΙΛΗ '),
('26033', 'Ι.Κ.Α '),
('26034', 'ΠΛΑΤΕΙΑ '),
('26035', 'Κ.Τ.Ε.Λ '),
('26036', 'ΕΞΟΔΟΣ ΛΑΓΚΑΔΑ '),
('26037', 'ΣΟΥΠΕΡ ΜΑΡΚΕΤ '),
('26038', 'Δ.Ε.Η. '),
('26039', 'ΣΤΡΟΦΗ ΠΕΡΙΒΟΛΑΚΙΟΥ '),
('26040', 'ΣΤΡΟΦΗ ΚΑΒΑΛΑΡΙΟΥ '),
('26110', 'ΣΤΡΑΤΟΠΕΔΟ '),
('26111', 'ΑΓΝΟ '),
('26112', 'ΣΑΜΟΘΡΑΚΙΤΗΣ '),
('26113', 'ΣΤΡΟΦΗ ΛΗΤΗΣ 14ο ΧΛ.Μ. '),
('26120', 'ΣΤΡΟΦΗ ΛΑΓΥΝΩΝ '),
('26149', 'ΕΙΣΟΔΟΣ ΛΑΓΥΝΩΝ '),
('26118', 'ΕΚΚΛΗΣΑΚΙ '),
('26119', 'ΕΙΣΟΔΟΣ ΛΑΓΥΝΩΝ '),
('26122', 'ΠΡΑΤΗΡΙΟ ΚΑΥΣΙΜΩΝ '),
('26116', 'ΕΥΡΩΠΑΙΚΟ ΚΕΝΤΡΟ ΕΛΑΣΤΙΚΩΝ '),
('24098', 'ΚΡΕΜΜΥΔΙΑ '),
('24099', 'ΑΡΤΟΖΑ '),
('24100', 'ΚΑΤΩ ΔΕΡΒΕΝΙ '),
('24091', 'ΑΝΩ ΔΕΡΒΕΝΙ '),
('24092', 'ΑΡΧΑΙΑ ΛΗΤΗ '),
('24093', 'ΑΝΘΟΚΗΠΟΙ '),
('11066', 'ΔΙΑΣΤΑΥΡΩΣΗ '),
('24089', 'ΠΕΡΙΒΑΛΛΟΝΤΙΚΟ ΠΑΡΚΟ '),
('24090', 'ΕΓΝΑΤΙΑ ΟΔΟΣ '),
('26117', 'ΡΕΜΑ ΓΑΛΑΝΟΥΔΗ '),
('26230', 'ΕΚΚΛΗΣΑΚΙ '),
('26231', 'ΕΙΣΟΔΟΣ ΛΑΓΥΝΩΝ '),
('26194', 'ΑΓΝΟ '),
('26108', 'ΣΤΡΑΤΟΠΕΔΟ '),
('26001', 'ΣΤΡΟΦΗ ΚΑΒΑΛΑΡΙΟΥ '),
('26002', 'ΣΤΡΟΦΗ ΠΕΡΙΒΟΛΑΚΙΟΥ '),
('26003', 'Δ.Ε.Η. '),
('26004', 'ΣΟΥΠΕΡ ΜΑΡΚΕΤ '),
('26005', 'ΕΙΣΟΔΟΣ ΛΑΓΚΑΔΑ '),
('26006', 'Κ.Τ.Ε.Λ '),
('26007', 'ΠΛΑΤΕΙΑ '),
('26029', 'ΒΑΣΙΛΕΩΣ ΑΛΕΞΑΝΔΡΟΥ '),
('26216', 'ΓΥΜΝΑΣΙΟ '),
('26218', 'ΙΚΑ '),
('26236', 'ΑΧΙΛΛΕΑ ΤΖΕΛΙΛΗ '),
('26237', 'ΠΑΡΟΔΟΣ ΤΖΕΛΙΛΗ ');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
