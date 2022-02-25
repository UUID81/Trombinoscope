-- --------------------------------------------------------
-- Hôte:                         127.0.0.1
-- Version du serveur:           5.7.24 - MySQL Community Server (GPL)
-- SE du serveur:                Win64
-- HeidiSQL Version:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Listage de la structure de la base pour trombinoscope
CREATE DATABASE IF NOT EXISTS `trombinoscope` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `trombinoscope`;

-- Listage de la structure de la table trombinoscope. genres
CREATE TABLE IF NOT EXISTS `genres` (
  `id_genre` int(11) NOT NULL AUTO_INCREMENT,
  `genre` varchar(20) NOT NULL,
  PRIMARY KEY (`id_genre`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Listage des données de la table trombinoscope.genres : ~3 rows (environ)
/*!40000 ALTER TABLE `genres` DISABLE KEYS */;
REPLACE INTO `genres` (`id_genre`, `genre`) VALUES
	(1, 'Mr'),
	(2, 'Mme'),
	(3, 'NG');
/*!40000 ALTER TABLE `genres` ENABLE KEYS */;

-- Listage de la structure de la table trombinoscope. personnes
CREATE TABLE IF NOT EXISTS `personnes` (
  `id_personne` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(30) NOT NULL,
  `prenom` varchar(20) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `photo` varchar(30) NOT NULL,
  `id_genre` int(11) NOT NULL,
  `id_statut` int(11) NOT NULL,
  PRIMARY KEY (`id_personne`),
  KEY `id_genre` (`id_genre`),
  KEY `id_statut` (`id_statut`),
  CONSTRAINT `personnes_ibfk_1` FOREIGN KEY (`id_genre`) REFERENCES `genres` (`id_genre`),
  CONSTRAINT `personnes_ibfk_2` FOREIGN KEY (`id_statut`) REFERENCES `statuts` (`id_statut`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;

-- Listage des données de la table trombinoscope.personnes : ~29 rows (environ)
/*!40000 ALTER TABLE `personnes` DISABLE KEYS */;
REPLACE INTO `personnes` (`id_personne`, `nom`, `prenom`, `email`, `photo`, `id_genre`, `id_statut`) VALUES
	(7, 'Adam', 'Thierry', 'thierry.adam@isen-ouest.yncrea.fr', 'Adam_Thierry.png', 1, 3),
	(8, 'Borel', 'Bertrand', 'bertrand.borel@isen-ouest.yncrea.fr', 'Borel_Bertrand.png', 1, 3),
	(15, 'Boucly', 'Kévin', 'kevin.boucly@isen-ouest.yncrea.fr', 'Boucly_Kevin.png', 1, 3),
	(16, 'Corlay', 'Morgan', 'morgan.corlay@isen-ouest.yncrea.fr', 'Corlay_Morgan.png', 1, 3),
	(17, 'Coroller', 'Loïc', 'loic.coroller@isen-ouest.yncrea.fr', 'Coroller_Loic.png', 1, 3),
	(18, 'De Sousa Lustosa Silva', 'Lucas', 'lucas.de-sousa-lustosa-silva@isen-ouest.yncrea.fr', 'De_sousa_Lucas.png', 1, 3),
	(19, 'Faudeil', 'Nathan', 'nathan.faudeil@isen-ouest.yncrea.fr', 'Faudeil_Nathan.png', 1, 3),
	(20, 'Gavancha Cassiano', 'Fabio', 'fabio.gavancha-cassiano@isen-ouest.yncrea.fr', 'Gavancha_Fabio.png', 1, 3),
	(21, 'Guichoux', 'Quentin', 'quentin.guichoux@isen-ouest.yncrea.fr', 'Guichoux_Quentin.png', 1, 3),
	(22, 'Heller', 'Romain', 'romain.heller@isen-ouest.yncrea.fr', 'Heller_Romain.png', 1, 3),
	(23, 'Ikheneche', 'Nacira', 'nacira.ikheneche@isen-ouest.yncrea.fr', 'Ikheneche_Nacira.png', 2, 3),
	(24, 'Landure', 'Pierre-Yves', NULL, 'Landure_P-Y.png', 1, 3),
	(25, 'Lannurien', 'Victor', 'victor.lannurien@isen-ouest.yncrea.fr', 'Lannurien_Victor.png', 1, 3),
	(26, 'Laxalde', 'Ewen', 'ewen.laxalde@isen-ouest.yncrea.fr', 'Laxalde_Ewen.png', 1, 3),
	(27, 'Le Dem', 'Maïna', 'maina.le-dem@isen-ouest.yncrea.fr', 'Le_Dem_Maina.png', 2, 3),
	(28, 'Lepelley', 'Perrine', 'perrine.lepelley@isen-ouest.yncrea.fr', 'Lepelley_Perrine.png', 2, 3),
	(34, 'Le Roch', 'Gwenn', 'gwenn.le-roch@isen-ouest.yncrea.fr', 'Le_Roch_Gwenn.png', 1, 3),
	(35, 'Nafoussi', 'Hichem', 'hichem.nafoussi@isen-ouest.yncrea.fr', 'Nafoussi_Hichem.png', 1, 3),
	(36, 'Penfeunteun', 'Sylvia', 'sylvia.penfeunteun@isen-ouest.yncrea.fr', 'Penfeunteun_Sylvia.png', 2, 3),
	(37, 'Plessis', 'Loïc', 'loic.plessis@isen-ouest.yncrea.fr', 'Plessis_Loic.png', 1, 3),
	(38, 'Poirier', 'Hervé', 'herve.poirier@isen-ouest.yncrea.fr', 'Poirier_Herve.png', 1, 3),
	(39, 'Sanchez', 'Pauline', 'pauline.sanchez@isen-ouest.yncrea.fr', 'Sanchez_Pauline.png', 2, 3),
	(40, 'Sepheri', 'Shima', NULL, 'Sepheri_Shima.png', 2, 3),
	(41, 'Tanguy', 'Erwan', 'erwan.tanguy@isen-ouest.yncrea.fr', 'Tanguy_Erwan.png', 1, 3),
	(42, 'Tanguy', 'Franky', 'franky.tanguy@isen-ouest.yncrea.fr', 'Tanguy_Franky.png', 1, 3),
	(43, 'Kusberg', 'Tatiana', NULL, 'Kusberg_Tatiana.png', 2, 4),
	(44, 'Jamin Normand', 'Stéphane', NULL, 'Jamin_Normand_Stephane.png', 1, 1),
	(45, 'Mourchid', 'Youssef', NULL, 'Mourchid_Youssef.png', 1, 1),
	(46, 'Cabon', 'Mickaël', NULL, 'Cabon_Mickael.png', 1, 4);
/*!40000 ALTER TABLE `personnes` ENABLE KEYS */;

-- Listage de la structure de la table trombinoscope. statuts
CREATE TABLE IF NOT EXISTS `statuts` (
  `id_statut` int(11) NOT NULL AUTO_INCREMENT,
  `statut` varchar(20) NOT NULL,
  PRIMARY KEY (`id_statut`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Listage des données de la table trombinoscope.statuts : ~4 rows (environ)
/*!40000 ALTER TABLE `statuts` DISABLE KEYS */;
REPLACE INTO `statuts` (`id_statut`, `statut`) VALUES
	(1, 'Formateur'),
	(2, 'Promo 1'),
	(3, 'Promo 2'),
	(4, 'Administration');
/*!40000 ALTER TABLE `statuts` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
