-- Script MySQL gerado a partir do DER
CREATE DATABASE IF NOT EXISTS imobiliaria;
USE imobiliaria;

-- Tabela de clientes
CREATE TABLE clientes (
    codigo_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) NOT NULL UNIQUE,
    email VARCHAR(100),
    telefone VARCHAR(20)
);

-- Tabela de imóveis
CREATE TABLE imoveis (
    codigo_imovel INT AUTO_INCREMENT PRIMARY KEY,
    endereco VARCHAR(200) NOT NULL,
    valor DECIMAL(12,2) NOT NULL,
    tipo VARCHAR(50),
    bairro VARCHAR(100),
    tamanho DECIMAL(10,2)
);

-- Tabela de tipos de contrato
CREATE TABLE tipos_contratos (
    codigo_contrato INT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(100) NOT NULL
);

-- Relacionamento entre cliente e contrato
CREATE TABLE contrato_cliente (
    id INT AUTO_INCREMENT PRIMARY KEY,
    codigo_cliente INT NOT NULL,
    numero_contrato INT NOT NULL,
    codigo_imovel INT NOT NULL,
    codigo_contrato INT NOT NULL,

    CONSTRAINT fk_cc_cliente
        FOREIGN KEY (codigo_cliente)
        REFERENCES clientes(codigo_cliente),

    CONSTRAINT fk_cc_imovel
        FOREIGN KEY (codigo_imovel)
        REFERENCES imoveis(codigo_imovel),

    CONSTRAINT fk_cc_tipo_contrato
        FOREIGN KEY (codigo_contrato)
        REFERENCES tipos_contratos(codigo_contrato)
);

-- Relacionamento entre imóvel e contrato
CREATE TABLE imovel_contrato (
    id INT AUTO_INCREMENT PRIMARY KEY,
    status_contrato VARCHAR(50),
    codigo_contrato INT NOT NULL,
    codigo_cliente INT NOT NULL,
    codigo_imovel INT NOT NULL,

    CONSTRAINT fk_ic_contrato
        FOREIGN KEY (codigo_contrato)
        REFERENCES tipos_contratos(codigo_contrato),

    CONSTRAINT fk_ic_cliente
        FOREIGN KEY (codigo_cliente)
        REFERENCES clientes(codigo_cliente),

    CONSTRAINT fk_ic_imovel
        FOREIGN KEY (codigo_imovel)
        REFERENCES imoveis(codigo_imovel)
);
