-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 22, 2018 at 09:34 PM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `data_filrouge`
--

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

CREATE TABLE IF NOT EXISTS `client` (
  `idClient` int(20) NOT NULL AUTO_INCREMENT,
  `nomC` varchar(20) NOT NULL,
  `telephone` varchar(20) NOT NULL,
  `email` varchar(20) NOT NULL,
  `adresse` varchar(20) NOT NULL,
  `code_postal` int(20) NOT NULL,
  `ville` varchar(20) NOT NULL,
  `pays` varchar(20) NOT NULL,
  PRIMARY KEY (`idClient`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `commandes`
--

CREATE TABLE IF NOT EXISTS `commandes` (
  `idCommande` int(10) NOT NULL AUTO_INCREMENT,
  `date_commande` date NOT NULL,
  `quantite` float NOT NULL,
  `client` int(20) NOT NULL,
  `produit` int(20) NOT NULL,
  `marge` float NOT NULL,
  PRIMARY KEY (`idCommande`),
  KEY `produit` (`produit`),
  KEY `produit_2` (`produit`),
  KEY `client` (`client`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `devis_in_ex`
--

CREATE TABLE IF NOT EXISTS `devis_in_ex` (
  `idDevisinex` int(20) NOT NULL AUTO_INCREMENT,
  `nomP` varchar(20) NOT NULL,
  `prixUnitaireHT` float NOT NULL,
  `quantite` float NOT NULL,
  `marge` float NOT NULL,
  `description` varchar(30) NOT NULL,
  `date` date NOT NULL,
  `fournisseur` int(20) DEFAULT NULL,
  `client` int(20) NOT NULL,
  `commande` int(20) NOT NULL,
  `prixTotalHT` double NOT NULL,
  PRIMARY KEY (`idDevisinex`),
  KEY `fournisseur` (`fournisseur`),
  KEY `commande` (`commande`),
  KEY `client` (`client`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `fournisseur`
--

CREATE TABLE IF NOT EXISTS `fournisseur` (
  `idFournisseur` int(6) NOT NULL AUTO_INCREMENT,
  `nomF` varchar(100) NOT NULL,
  `adresse` varchar(50) NOT NULL,
  `télèphone` varchar(20) NOT NULL,
  `email` varchar(30) NOT NULL,
  `ville` varchar(100) NOT NULL,
  `code_postal` varchar(20) NOT NULL,
  `pays` varchar(20) NOT NULL,
  PRIMARY KEY (`idFournisseur`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `produit`
--

CREATE TABLE IF NOT EXISTS `produit` (
  `idProduit` int(20) NOT NULL AUTO_INCREMENT,
  `nomP` varchar(20) NOT NULL,
  `catégorie` varchar(20) NOT NULL,
  `prix_unitaire` float NOT NULL,
  `description` varchar(20) NOT NULL,
  `marge` float NOT NULL,
  `fournisseur` int(20) NOT NULL,
  PRIMARY KEY (`idProduit`),
  KEY `fournisseur` (`fournisseur`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `commandes`
--
ALTER TABLE `commandes`
  ADD CONSTRAINT `commandes_ibfk_2` FOREIGN KEY (`client`) REFERENCES `client` (`idClient`),
  ADD CONSTRAINT `commandes_ibfk_1` FOREIGN KEY (`produit`) REFERENCES `produit` (`idProduit`);

--
-- Constraints for table `devis_in_ex`
--
ALTER TABLE `devis_in_ex`
  ADD CONSTRAINT `devis_in_ex_ibfk_1` FOREIGN KEY (`fournisseur`) REFERENCES `fournisseur` (`idFournisseur`),
  ADD CONSTRAINT `devis_in_ex_ibfk_2` FOREIGN KEY (`client`) REFERENCES `client` (`idClient`),
  ADD CONSTRAINT `devis_in_ex_ibfk_3` FOREIGN KEY (`commande`) REFERENCES `commandes` (`idCommande`);

--
-- Constraints for table `produit`
--
ALTER TABLE `produit`
  ADD CONSTRAINT `produit_ibfk_1` FOREIGN KEY (`fournisseur`) REFERENCES `fournisseur` (`idFournisseur`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
