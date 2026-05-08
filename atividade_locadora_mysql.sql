-- =====================================================
-- Banco de Dados: Locadora de Veículos
-- Script MySQL gerado a partir do DER
-- =====================================================

CREATE DATABASE IF NOT EXISTS locadora_veiculos;
USE locadora_veiculos;

-- =====================================================
-- TABELA CLIENTES
-- =====================================================

CREATE TABLE clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) NOT NULL UNIQUE,
    cnh VARCHAR(20) NOT NULL UNIQUE,
    tel VARCHAR(20),
    email VARCHAR(100),
    endereco VARCHAR(200)
);

-- =====================================================
-- TABELA CATEGORIA
-- =====================================================

CREATE TABLE categoria (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nome_categoria VARCHAR(100) NOT NULL,
    valor_diarias DECIMAL(10,2) NOT NULL
);

-- =====================================================
-- TABELA VEICULO
-- =====================================================

CREATE TABLE veiculo (
    id_veiculo INT AUTO_INCREMENT PRIMARY KEY,
    placa VARCHAR(10) NOT NULL UNIQUE,
    modelo VARCHAR(100) NOT NULL,
    ano INT NOT NULL,
    id_cliente INT,
    km_atual DECIMAL(10,2),
    status_veiculo VARCHAR(50),

    CONSTRAINT fk_veiculo_cliente
        FOREIGN KEY (id_cliente)
        REFERENCES clientes(id_cliente)
);

-- =====================================================
-- TABELA CONTRATOS
-- =====================================================

CREATE TABLE contratos (
    id_contrato INT AUTO_INCREMENT PRIMARY KEY,
    id_veiculo INT NOT NULL,
    id_cliente INT NOT NULL,
    data_de_retirada DATE NOT NULL,
    data_prevista DATE NOT NULL,
    tipo_de_seguro VARCHAR(100),
    km_inicial DECIMAL(10,2),

    CONSTRAINT fk_contrato_veiculo
        FOREIGN KEY (id_veiculo)
        REFERENCES veiculo(id_veiculo),

    CONSTRAINT fk_contrato_cliente
        FOREIGN KEY (id_cliente)
        REFERENCES clientes(id_cliente)
);

-- =====================================================
-- TABELA MANUTENCAO
-- =====================================================

CREATE TABLE manutencao (
    id_manutencao INT AUTO_INCREMENT PRIMARY KEY,
    id_veiculo INT NOT NULL,
    tipo VARCHAR(100),
    data_agendada DATE,
    data_conclusao DATE,
    descricao TEXT,

    CONSTRAINT fk_manutencao_veiculo
        FOREIGN KEY (id_veiculo)
        REFERENCES veiculo(id_veiculo)
);

-- =====================================================
-- TABELA MULTA
-- =====================================================

CREATE TABLE multa (
    id_multa INT AUTO_INCREMENT PRIMARY KEY,
    id_contrato INT NOT NULL,
    id_veiculo INT NOT NULL,
    valor DECIMAL(10,2) NOT NULL,
    data_infracao DATE,
    cod_transito VARCHAR(50),

    CONSTRAINT fk_multa_contrato
        FOREIGN KEY (id_contrato)
        REFERENCES contratos(id_contrato),

    CONSTRAINT fk_multa_veiculo
        FOREIGN KEY (id_veiculo)
        REFERENCES veiculo(id_veiculo)
);

-- =====================================================
-- EXEMPLO PARA VERIFICAR AS TABELAS
-- =====================================================

SHOW TABLES;
