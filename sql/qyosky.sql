-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 24-Fev-2022 às 23:00
-- Versão do servidor: 10.4.14-MariaDB
-- versão do PHP: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `qyosky`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `clientes`
--

CREATE TABLE `clientes` (
  `id` int(11) NOT NULL,
  `nome` varchar(60) NOT NULL,
  `email` varchar(60) NOT NULL,
  `numero` varchar(60) NOT NULL,
  `data_nascimento` date NOT NULL,
  `genero` int(10) NOT NULL,
  `pedido` varchar(200) NOT NULL,
  `endereco` varchar(200) NOT NULL,
  `date_time` date DEFAULT current_timestamp(),
  `hora` time NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `clientes`
--

INSERT INTO `clientes` (`id`, `nome`, `email`, `numero`, `data_nascimento`, `genero`, `pedido`, `endereco`, `date_time`, `hora`) VALUES
(28, 'teste do teste', 'arthur@gmail', '112213321', '1950-02-26', 3, 'Teste alteração', 'enderecoo', '2022-02-20', '18:25:54'),
(29, 'arthur', 'arthur@gmail', '115648879', '2022-02-18', 1, 'nn', 'nn', '2022-02-21', '18:52:03'),
(30, 'arthur', 'arthur@gmail', '115648879', '2022-02-07', 3, 'nn', 'nn', '2022-02-22', '18:52:12'),
(31, 'arthur', 'arthur@gmail', '115648879', '2022-01-30', 3, 'nn', 'nn', '2022-02-23', '18:52:19'),
(32, 'arthur', 'arthur@gmail', '115648879', '2022-02-22', 3, 'nn', 'nn', '2022-02-24', '19:02:46'),
(33, 'arthur', 'arthur@gmail', '115648879', '2022-01-30', 3, 'nn', 'nn', '2022-02-25', '19:02:53'),
(34, 'arthur', 'arthur@gmail', '115648879', '2022-02-10', 1, 'nn', 'nn', '2022-02-26', '19:02:59'),
(35, 'arthur', 'arthur@gmail', '115648879', '1991-06-26', 2, 'nn', 'nn', '2022-02-23', '19:04:08'),
(36, 'arthur', 'arthur@gmail', '115648879', '1900-02-08', 2, 'Teste', 'nn', '2022-02-23', '19:04:21'),
(37, 'Teste Inserção', 'teste@teste.com.br', '1155557777', '1987-10-17', 2, 'teste', 'teste', '2022-02-23', '19:43:00');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
