CREATE DATABASE  IF NOT EXISTS `modelo_pi` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `modelo_pi`;
-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: modelo_pi
-- ------------------------------------------------------
-- Server version	8.0.34

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `acompanhamento`
--

DROP TABLE IF EXISTS `acompanhamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `acompanhamento` (
  `id_acompanhamento` int NOT NULL AUTO_INCREMENT,
  `denominacao` varchar(100) NOT NULL,
  `descricao` varchar(100) NOT NULL,
  `valor_item` decimal(10,2) NOT NULL,
  `situacao` char(1) NOT NULL DEFAULT 'A',
  PRIMARY KEY (`id_acompanhamento`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acompanhamento`
--

LOCK TABLES `acompanhamento` WRITE;
/*!40000 ALTER TABLE `acompanhamento` DISABLE KEYS */;
INSERT INTO `acompanhamento` VALUES (1,'Espetinho de Carne Bovina','alcatra assada na brasa',15.99,'A'),(2,'Espetinho de Frango','Espetinho de frango grelhado na brasa, feito com pedaços suculentos e temperados com ervas',12.76,'A'),(3,'Espetinho de Linguiça Porco','Espetinho de linguiça suína assada na brasa',14.99,'A'),(4,'Espetinho de Linguiça de Frango','Espetinho de linguiça de frango assada na brasa, com sabor suave e tempero especial',11.50,'A');
/*!40000 ALTER TABLE `acompanhamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `id_categoria` int NOT NULL AUTO_INCREMENT,
  `denominacao` varchar(45) NOT NULL,
  `situacao` char(1) DEFAULT 'A',
  PRIMARY KEY (`id_categoria`),
  UNIQUE KEY `id_categoria` (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'Entradas','A'),(2,'Acompanhamentos','A'),(3,'Bebidas','A');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `id_cliente` int NOT NULL AUTO_INCREMENT,
  `fidelidade` int DEFAULT NULL,
  `desconto` decimal(10,2) DEFAULT NULL,
  `observacao` varchar(200) DEFAULT NULL,
  `situacao` char(1) DEFAULT 'A',
  `id_pessoa` int NOT NULL,
  PRIMARY KEY (`id_cliente`),
  KEY `id_pessoa` (`id_pessoa`),
  CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`id_pessoa`) REFERENCES `pessoa` (`id_pessoa`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,NULL,NULL,NULL,'A',1);
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comanda`
--

DROP TABLE IF EXISTS `comanda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comanda` (
  `id_comanda` int NOT NULL AUTO_INCREMENT,
  `data_comanda` datetime DEFAULT CURRENT_TIMESTAMP,
  `desconto` decimal(10,2) DEFAULT NULL,
  `acrescimo` decimal(10,2) DEFAULT NULL,
  `valor_total` decimal(10,2) NOT NULL,
  `status_comanda` varchar(45) DEFAULT 'Em Adamento' COMMENT 'P = Pendente,  C = Cancelado, F = Finalizado',
  `id_cliente` int NOT NULL DEFAULT '1',
  `id_funcionario` int NOT NULL,
  `id_mesa` int NOT NULL,
  `id_forma_pagamento` int NOT NULL,
  PRIMARY KEY (`id_comanda`),
  KEY `id_cliente` (`id_cliente`),
  KEY `id_funcionario` (`id_funcionario`),
  KEY `id_mesa` (`id_mesa`),
  KEY `id_forma_pagamento` (`id_forma_pagamento`),
  CONSTRAINT `comanda_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`),
  CONSTRAINT `comanda_ibfk_2` FOREIGN KEY (`id_funcionario`) REFERENCES `funcionario` (`id_funcionario`),
  CONSTRAINT `comanda_ibfk_3` FOREIGN KEY (`id_mesa`) REFERENCES `mesa` (`id_mesa`),
  CONSTRAINT `comanda_ibfk_4` FOREIGN KEY (`id_forma_pagamento`) REFERENCES `forma_pagamento` (`id_forma_pagamento`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comanda`
--

LOCK TABLES `comanda` WRITE;
/*!40000 ALTER TABLE `comanda` DISABLE KEYS */;
INSERT INTO `comanda` VALUES (1,'2025-10-21 09:37:47',0.00,0.00,15.99,'Em Adamento',1,1,1,1);
/*!40000 ALTER TABLE `comanda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `endereco`
--

DROP TABLE IF EXISTS `endereco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `endereco` (
  `id_endereco` int NOT NULL AUTO_INCREMENT,
  `logradouro` varchar(45) NOT NULL,
  `numero_imovel` int NOT NULL,
  `complemento` varchar(45) NOT NULL,
  `bairro` varchar(20) NOT NULL,
  `cidade` varchar(15) NOT NULL,
  `uf` char(2) NOT NULL,
  `cep` int NOT NULL,
  `situacao` char(1) DEFAULT 'A',
  `id_pessoa` int NOT NULL,
  PRIMARY KEY (`id_endereco`),
  KEY `id_pessoa` (`id_pessoa`),
  CONSTRAINT `endereco_ibfk_1` FOREIGN KEY (`id_pessoa`) REFERENCES `pessoa` (`id_pessoa`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `endereco`
--

LOCK TABLES `endereco` WRITE;
/*!40000 ALTER TABLE `endereco` DISABLE KEYS */;
INSERT INTO `endereco` VALUES (1,'segundaa avenida',32,'sagunda avenida bloco 1620','nucleo bandeirante','brasilia','DF',717815052,'A',1),(2,'conjunto 3',16,'QR 405','samambaia','Brasilia','DF',576298465,'A',2);
/*!40000 ALTER TABLE `endereco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forma_pagamento`
--

DROP TABLE IF EXISTS `forma_pagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `forma_pagamento` (
  `id_forma_pagamento` int NOT NULL AUTO_INCREMENT,
  `denominacao` varchar(45) NOT NULL,
  `prazo` int DEFAULT NULL,
  `parcela` int DEFAULT NULL,
  PRIMARY KEY (`id_forma_pagamento`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forma_pagamento`
--

LOCK TABLES `forma_pagamento` WRITE;
/*!40000 ALTER TABLE `forma_pagamento` DISABLE KEYS */;
INSERT INTO `forma_pagamento` VALUES (1,'Debito',NULL,NULL),(2,'Pix',NULL,NULL),(3,'Dinheiro',NULL,NULL),(4,'Cartão de Credito',NULL,NULL);
/*!40000 ALTER TABLE `forma_pagamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funcionario`
--

DROP TABLE IF EXISTS `funcionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `funcionario` (
  `id_funcionario` int NOT NULL AUTO_INCREMENT,
  `matricula` int NOT NULL,
  `situacao` char(1) DEFAULT 'A',
  `id_pessoa` int NOT NULL,
  PRIMARY KEY (`id_funcionario`),
  KEY `id_pessoa` (`id_pessoa`),
  CONSTRAINT `funcionario_ibfk_1` FOREIGN KEY (`id_pessoa`) REFERENCES `pessoa` (`id_pessoa`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcionario`
--

LOCK TABLES `funcionario` WRITE;
/*!40000 ALTER TABLE `funcionario` DISABLE KEYS */;
INSERT INTO `funcionario` VALUES (1,12314544,'A',1),(2,57457439,'A',2);
/*!40000 ALTER TABLE `funcionario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `login` (
  `id_login` int NOT NULL AUTO_INCREMENT,
  `usuario` varchar(25) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `tipo_usuario` enum('ADMIM','USER') DEFAULT NULL,
  `imagem_usuario` longblob,
  `situacao` char(1) NOT NULL DEFAULT 'A',
  PRIMARY KEY (`id_login`),
  UNIQUE KEY `usuario` (`usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` VALUES (1,'PAULO','60195799ad5ffdcb1f144ec605774c0047f0cd04d98cd6b2f4317e9bd0211bdfe1ec0cc02978b1cdd12eadcfaf4ea3a2acabf1f3faf7d511ded92daef6855707',NULL,NULL,'A'),(2,'layanne','61e227f8b49081da14612b185e910784b5b511c110c524610ae3542af908f9d63a32bda649f8dc628c76eb34651284fba826b8867414c7c313d4b8418080e18b',NULL,NULL,'A'),(3,' ','f90ddd77e400dfe6a3fcf479b00b1ee29e7015c5bb8cd70f5f15b4886cc339275ff553fc8a053f8ddc7324f45168cffaf81f8c3ac93996f6536eef38e5e40768',NULL,NULL,'A'),(4,'  ','16b7aa7f7e549ba129c776bb91ce1e692da103271242d44a9bc145cf338450c90132496ead2530f527b1bd7f50544f37e7d27a2d2bbb58099890aa320f40aca9',NULL,NULL,'A'),(5,'   ','856a307f2c7f3b6b52198a7d2bb3843ad397e09b0bbba9dd140af2da8e6bbd3f528952110a09ac77167ba77bf2c3e3a393d7b47432aba9827843e51adb22780f',NULL,NULL,'A');
/*!40000 ALTER TABLE `login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mesa`
--

DROP TABLE IF EXISTS `mesa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mesa` (
  `id_mesa` int NOT NULL AUTO_INCREMENT,
  `numero` int NOT NULL,
  `capacidade` int NOT NULL,
  `qrcode` longblob,
  `status_mesa` char(1) NOT NULL DEFAULT 'D',
  PRIMARY KEY (`id_mesa`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mesa`
--

LOCK TABLES `mesa` WRITE;
/*!40000 ALTER TABLE `mesa` DISABLE KEYS */;
INSERT INTO `mesa` VALUES (1,1,2,NULL,'D'),(2,2,10,NULL,'D'),(3,3,8,NULL,'D'),(4,4,16,NULL,'D'),(5,5,4,NULL,'D');
/*!40000 ALTER TABLE `mesa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido` (
  `id_pedido` int NOT NULL AUTO_INCREMENT,
  `quantidade` int NOT NULL,
  `preco` decimal(10,2) DEFAULT NULL,
  `valor_total` decimal(10,2) DEFAULT NULL,
  `status_pedido` char(1) NOT NULL DEFAULT 'A' COMMENT 'A = Andamento, E = Entregue, F = Finalizado',
  `cancelado` char(1) NOT NULL DEFAULT 'N',
  `id_produto` int NOT NULL,
  `id_comanda` int NOT NULL,
  PRIMARY KEY (`id_pedido`),
  KEY `id_produto` (`id_produto`),
  KEY `id_comanda` (`id_comanda`),
  CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`id_produto`) REFERENCES `produto` (`id_produto`),
  CONSTRAINT `pedido_ibfk_2` FOREIGN KEY (`id_comanda`) REFERENCES `comanda` (`id_comanda`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
INSERT INTO `pedido` VALUES (1,10,11.50,115.00,'A','N',1,1),(2,10,NULL,NULL,'A','N',5,1);
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pessoa`
--

DROP TABLE IF EXISTS `pessoa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pessoa` (
  `id_pessoa` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `cpf` varchar(15) NOT NULL,
  `telefone` varchar(20) NOT NULL,
  `email` varchar(45) DEFAULT NULL,
  `situacao` char(1) NOT NULL DEFAULT 'A',
  `id_login` int DEFAULT NULL,
  PRIMARY KEY (`id_pessoa`),
  KEY `id_login` (`id_login`),
  CONSTRAINT `pessoa_ibfk_1` FOREIGN KEY (`id_login`) REFERENCES `login` (`id_login`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pessoa`
--

LOCK TABLES `pessoa` WRITE;
/*!40000 ALTER TABLE `pessoa` DISABLE KEYS */;
INSERT INTO `pessoa` VALUES (1,'consumidor padrao','000000000','0000000000','00000000','A',NULL),(2,'PAULO','564378623','61982150249','batistaoliveira798@gmail.com','A',1),(3,'layanne','55247558947','61298216345','lay@gmail.com','A',2),(4,' ',' ',' ',' ','A',3),(5,'  ','  ','  ','  ','A',4),(6,'   ','   ','  ','   ','A',5);
/*!40000 ALTER TABLE `pessoa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto`
--

DROP TABLE IF EXISTS `produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produto` (
  `id_produto` int NOT NULL AUTO_INCREMENT,
  `denominacao` varchar(100) NOT NULL,
  `preco` decimal(10,2) NOT NULL,
  `imagem_produto` longblob,
  `situacao` char(1) NOT NULL DEFAULT 'A',
  `id_categoria` int NOT NULL,
  PRIMARY KEY (`id_produto`),
  KEY `id_categoria` (`id_categoria`),
  CONSTRAINT `produto_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto`
--

LOCK TABLES `produto` WRITE;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` VALUES (1,'Arroz Feijão Macarrão e Salada',24.99,NULL,'A',1),(2,'Espetinho de Carne Bovina',15.99,NULL,'A',2),(3,'Espetinho de Frango',12.76,NULL,'A',2),(4,'Espetinho de Linguiça Porco',14.99,NULL,'A',2),(5,'Espetinho de Linguiça de Frango',11.50,NULL,'A',2),(6,'Coca-Cola Lata 300ml',7.50,NULL,'A',3),(7,'Pepsi lata 300ml',5.88,NULL,'A',3),(8,'Choop 500 ml',9.99,NULL,'A',3);
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto_acompanhamento`
--

DROP TABLE IF EXISTS `produto_acompanhamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produto_acompanhamento` (
  `id_produto_acompanhamento` int NOT NULL AUTO_INCREMENT,
  `id_produto` int NOT NULL,
  `id_acompanhamento` int NOT NULL,
  PRIMARY KEY (`id_produto_acompanhamento`),
  KEY `id_produto` (`id_produto`),
  KEY `id_acompanhamento` (`id_acompanhamento`),
  CONSTRAINT `produto_acompanhamento_ibfk_1` FOREIGN KEY (`id_produto`) REFERENCES `produto` (`id_produto`),
  CONSTRAINT `produto_acompanhamento_ibfk_2` FOREIGN KEY (`id_acompanhamento`) REFERENCES `acompanhamento` (`id_acompanhamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto_acompanhamento`
--

LOCK TABLES `produto_acompanhamento` WRITE;
/*!40000 ALTER TABLE `produto_acompanhamento` DISABLE KEYS */;
/*!40000 ALTER TABLE `produto_acompanhamento` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-10-22  8:21:36
