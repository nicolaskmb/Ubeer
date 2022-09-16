-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           10.6.8-MariaDB - mariadb.org binary distribution
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Copiando estrutura do banco de dados para ubeer
CREATE DATABASE IF NOT EXISTS `ubeer` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `ubeer`;

-- Copiando estrutura para tabela ubeer.cliente
CREATE TABLE IF NOT EXISTS `cliente` (
  `codCliente` int(8) NOT NULL AUTO_INCREMENT,
  `nome` varchar(40) NOT NULL DEFAULT '0',
  `endereço` varchar(50) NOT NULL DEFAULT '0',
  `numero` int(6) NOT NULL DEFAULT 0,
  `bairro` varchar(25) NOT NULL DEFAULT '0',
  `telefone` varchar(12) NOT NULL DEFAULT '0',
  `email` varchar(50) NOT NULL DEFAULT '0',
  `cep` int(8) NOT NULL DEFAULT 0,
  `senha` varchar(20) NOT NULL DEFAULT '0',
  KEY `codCli` (`codCliente`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COMMENT='Estrutura da tabela Cliente';

-- Copiando dados para a tabela ubeer.cliente: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` (`codCliente`, `nome`, `endereço`, `numero`, `bairro`, `telefone`, `email`, `cep`, `senha`) VALUES
	(1, 'Maria José', 'Rua Lilas', 59, 'Aventureiro', '48 99635285', 'maria@teste.com', 89226354, '2561561'),
	(2, 'Joao Ricardo', 'Tuiuti', 4700, 'Distrito Industrial', '41 96852369', 'ricardao@live.br', 89635428, 'as2365d'),
	(3, 'Mirian Cristina', 'Mauro Bley', 150, 'Aventureiro', '48 965234789', 'mirian@univille.br', 96854563, 'Ab3698NN');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;

-- Copiando estrutura para tabela ubeer.clientepagamento
CREATE TABLE IF NOT EXISTS `clientepagamento` (
  `codClientePag` int(8) NOT NULL AUTO_INCREMENT,
  `codCliente` int(8) NOT NULL DEFAULT 0,
  `codPagamento` int(1) NOT NULL DEFAULT 0,
  `nCartao` varchar(16) NOT NULL DEFAULT '0',
  `codSeguranca` int(3) NOT NULL DEFAULT 0,
  KEY `codCliPag` (`codClientePag`),
  KEY `CodCliente` (`codCliente`),
  KEY `CodPagamento` (`codPagamento`),
  CONSTRAINT `CodCliente` FOREIGN KEY (`codCliente`) REFERENCES `cliente` (`codCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `CodPagamento` FOREIGN KEY (`codPagamento`) REFERENCES `pagamento` (`codPagamento`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COMMENT='Estrutra de tabela ClientePagamento';

-- Copiando dados para a tabela ubeer.clientepagamento: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `clientepagamento` DISABLE KEYS */;
INSERT INTO `clientepagamento` (`codClientePag`, `codCliente`, `codPagamento`, `nCartao`, `codSeguranca`) VALUES
	(1, 1, 2, '1234567890', 123),
	(2, 2, 1, '131213', 122),
	(4, 3, 3, '0', 0);
/*!40000 ALTER TABLE `clientepagamento` ENABLE KEYS */;

-- Copiando estrutura para tabela ubeer.pagamento
CREATE TABLE IF NOT EXISTS `pagamento` (
  `codPagamento` int(1) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(20) NOT NULL,
  `PrecisaCredenciais` bit(1) NOT NULL,
  KEY `codpag` (`codPagamento`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COMMENT='estrutura de tabela pagamento';

-- Copiando dados para a tabela ubeer.pagamento: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `pagamento` DISABLE KEYS */;
INSERT INTO `pagamento` (`codPagamento`, `Nome`, `PrecisaCredenciais`) VALUES
	(1, 'Débito ', b'1'),
	(2, 'Credito', b'1'),
	(3, 'Dinheiro', b'0');
/*!40000 ALTER TABLE `pagamento` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
