-- ==========================================
-- 01_schema.sql
-- Criacao da Estrutura Relacional (PostgreSQL)
-- ==========================================

DROP TABLE IF EXISTS vendas CASCADE;
DROP TABLE IF EXISTS produtos CASCADE;
DROP TABLE IF EXISTS categorias CASCADE;
DROP TABLE IF EXISTS clientes CASCADE;

-- 1. Tabela de Clientes
CREATE TABLE clientes (
    cliente_id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cidade VARCHAR(50),
    pais VARCHAR(50),
    data_cadastro DATE DEFAULT CURRENT_DATE
);

-- 2. Tabela de Categorias
CREATE TABLE categorias (
    categoria_id SERIAL PRIMARY KEY,
    nome_categoria VARCHAR(50) NOT NULL
);

-- 3. Tabela de Produtos
CREATE TABLE produtos (
    produto_id SERIAL PRIMARY KEY,
    nome_produto VARCHAR(100) NOT NULL,
    categoria_id INT REFERENCES categorias(categoria_id),
    preco_unitario NUMERIC(10, 2) NOT NULL,
    custo_unitario NUMERIC(10, 2) NOT NULL
);

-- 4. Tabela de Vendas
CREATE TABLE vendas (
    venda_id SERIAL PRIMARY KEY,
    cliente_id INT REFERENCES clientes(cliente_id),
    produto_id INT REFERENCES produtos(produto_id),
    quantidade INT NOT NULL,
    data_venda DATE NOT NULL,
    status_pagamento VARCHAR(20) CHECK (status_pagamento IN ('Concluído', 'Pendente', 'Cancelado'))
);
