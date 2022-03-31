-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : jeu. 31 mars 2022 à 10:52
-- Version du serveur :  5.7.31
-- Version de PHP : 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `amphitryon`
--

-- --------------------------------------------------------

--
-- Structure de la table `categorie_plat`
--

DROP TABLE IF EXISTS `categorie_plat`;
CREATE TABLE IF NOT EXISTS `categorie_plat` (
  `idCategorie` int(11) NOT NULL AUTO_INCREMENT,
  `libelleCateg` char(255) DEFAULT NULL,
  PRIMARY KEY (`idCategorie`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `categorie_plat`
--

INSERT INTO `categorie_plat` (`idCategorie`, `libelleCateg`) VALUES
(1, 'pizza'),
(2, 'viande'),
(3, 'tacos');

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

DROP TABLE IF EXISTS `commande`;
CREATE TABLE IF NOT EXISTS `commande` (
  `idCommande` int(5) NOT NULL AUTO_INCREMENT,
  `Date_C` date NOT NULL,
  `heureCommande` int(11) DEFAULT NULL,
  `etatCommande` tinyint(1) DEFAULT NULL,
  `numTable` int(5) NOT NULL,
  PRIMARY KEY (`idCommande`),
  KEY `numTable` (`numTable`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `commande`
--

INSERT INTO `commande` (`idCommande`, `Date_C`, `heureCommande`, `etatCommande`, `numTable`) VALUES
(2, '2022-01-03', 13, 1, 14);

-- --------------------------------------------------------

--
-- Structure de la table `plat`
--

DROP TABLE IF EXISTS `plat`;
CREATE TABLE IF NOT EXISTS `plat` (
  `idPlat` int(5) NOT NULL AUTO_INCREMENT,
  `idCategorie` int(5) NOT NULL,
  `nomPlat` char(20) DEFAULT NULL,
  `descriptifPlat` varchar(255) DEFAULT NULL,
  `prixPlat` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`idPlat`),
  KEY `idCategorie` (`idCategorie`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `plat`
--

INSERT INTO `plat` (`idPlat`, `idCategorie`, `nomPlat`, `descriptifPlat`, `prixPlat`) VALUES
(1, 1, 'calzone', 'Le calzone est une recette culinaire typique des Pouilles, en Italie.', '14.00'),
(2, 1, 'Margherita', 'La pizza Margherita est le nom d\'une spécialité culinaire traditionnelle de la ville de Naples en Italie.', '9.00'),
(3, 2, 'steak haché frite', 'Un steak haché est une viande hachée, souvent conditionnée en forme de galette prête à la cuisson.', '18.00'),
(4, 3, 'tacos', 'viande, sauce', '7.00');

-- --------------------------------------------------------

--
-- Structure de la table `platcommander`
--

DROP TABLE IF EXISTS `platcommander`;
CREATE TABLE IF NOT EXISTS `platcommander` (
  `idCommande` int(5) NOT NULL,
  `idPlat` int(5) NOT NULL,
  `quantiteedemandee` int(11) DEFAULT NULL,
  `infosComplementaires` varchar(128) DEFAULT NULL,
  `etatPlat` char(5) DEFAULT NULL,
  PRIMARY KEY (`idCommande`,`idPlat`),
  KEY `idPlat` (`idPlat`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `platproposer`
--

DROP TABLE IF EXISTS `platproposer`;
CREATE TABLE IF NOT EXISTS `platproposer` (
  `idPlat` int(5) NOT NULL,
  `idService` int(5) NOT NULL,
  `Date_P` date NOT NULL,
  `quantiteeProposee` int(11) DEFAULT NULL,
  `prixVente` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`idPlat`,`idService`,`Date_P`),
  KEY `idService` (`idService`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `serveur`
--

DROP TABLE IF EXISTS `serveur`;
CREATE TABLE IF NOT EXISTS `serveur` (
  `idUser` int(5) NOT NULL AUTO_INCREMENT,
  `nom` char(50) DEFAULT NULL,
  `prenom` char(50) DEFAULT NULL,
  `tel` int(10) DEFAULT NULL,
  `mail` varchar(50) DEFAULT NULL,
  `statut` char(50) DEFAULT NULL,
  PRIMARY KEY (`idUser`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `serveur`
--

INSERT INTO `serveur` (`idUser`, `nom`, `prenom`, `tel`, `mail`, `statut`) VALUES
(3, 'serveur', 'serveur', 558894725, 'serveur', 'serveur');

-- --------------------------------------------------------

--
-- Structure de la table `service`
--

DROP TABLE IF EXISTS `service`;
CREATE TABLE IF NOT EXISTS `service` (
  `idService` int(5) NOT NULL AUTO_INCREMENT,
  `creneau` char(10) DEFAULT NULL,
  PRIMARY KEY (`idService`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `service`
--

INSERT INTO `service` (`idService`, `creneau`) VALUES
(1, 'matin'),
(2, 'soir');

-- --------------------------------------------------------

--
-- Structure de la table `table_r`
--

DROP TABLE IF EXISTS `table_r`;
CREATE TABLE IF NOT EXISTS `table_r` (
  `idService` int(5) NOT NULL,
  `Date_T` date NOT NULL,
  `numTable` int(5) NOT NULL,
  `idUser` int(5) NOT NULL,
  `nbPlaces` int(11) DEFAULT NULL,
  PRIMARY KEY (`idService`,`Date_T`,`numTable`),
  KEY `idUser` (`idUser`),
  KEY `numTable` (`numTable`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `table_r`
--

INSERT INTO `table_r` (`idService`, `Date_T`, `numTable`, `idUser`, `nbPlaces`) VALUES
(1, '2022-03-06', 14, 3, 4);

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

DROP TABLE IF EXISTS `utilisateur`;
CREATE TABLE IF NOT EXISTS `utilisateur` (
  `iduser` int(5) NOT NULL AUTO_INCREMENT,
  `nom` char(50) DEFAULT NULL,
  `prenom` char(50) DEFAULT NULL,
  `tel` int(10) DEFAULT NULL,
  `mail` varchar(50) DEFAULT NULL,
  `statut` char(50) DEFAULT NULL,
  `mdp` varchar(512) NOT NULL,
  PRIMARY KEY (`iduser`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`iduser`, `nom`, `prenom`, `tel`, `mail`, `statut`, `mdp`) VALUES
(1, 'legrand', 'etienne', 5, 'salle', 'salle', '098f6bcd4621d373cade4e832627b4f6'),
(2, 'nezout', 'marc', 6, 'cuisinier', 'cuisinier', '098f6bcd4621d373cade4e832627b4f6'),
(3, 'gubbiotti', 'paul', 8, 'serveur', 'serveur', '098f6bcd4621d373cade4e832627b4f6');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `commande_ibfk_1` FOREIGN KEY (`numTable`) REFERENCES `table_r` (`numTable`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `plat`
--
ALTER TABLE `plat`
  ADD CONSTRAINT `plat_ibfk_1` FOREIGN KEY (`idCategorie`) REFERENCES `categorie_plat` (`idCategorie`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `platcommander`
--
ALTER TABLE `platcommander`
  ADD CONSTRAINT `platcommander_ibfk_1` FOREIGN KEY (`idCommande`) REFERENCES `commande` (`idCommande`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `platcommander_ibfk_2` FOREIGN KEY (`idPlat`) REFERENCES `plat` (`idPlat`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `platproposer`
--
ALTER TABLE `platproposer`
  ADD CONSTRAINT `platproposer_ibfk_1` FOREIGN KEY (`idPlat`) REFERENCES `plat` (`idPlat`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `platproposer_ibfk_2` FOREIGN KEY (`idService`) REFERENCES `service` (`idService`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `serveur`
--
ALTER TABLE `serveur`
  ADD CONSTRAINT `serveur_ibfk_1` FOREIGN KEY (`idUser`) REFERENCES `utilisateur` (`iduser`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `table_r`
--
ALTER TABLE `table_r`
  ADD CONSTRAINT `table_r_ibfk_1` FOREIGN KEY (`idService`) REFERENCES `service` (`idService`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `table_r_ibfk_2` FOREIGN KEY (`idUser`) REFERENCES `serveur` (`idUser`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
