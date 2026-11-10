-- ==========================================
-- 02_insert_data.sql
-- Povoamento de Dados Ficticios (Mock Data)
-- ==========================================

-- Categorias
INSERT INTO categorias (nome_categoria) VALUES
('Eletrónicos'),
('Informática'),
('Acessórios'),
('Eletrodomésticos');

-- Produtos
INSERT INTO produtos (nome_produto, categoria_id, preco_unitario, custo_unitario) VALUES
('Monitor 27 4K', 2, 350.00, 210.00),
('Teclado Mecânico RGB', 3, 85.00, 40.00),
('Rato Sem Fios Ergonómico', 3, 50.00, 22.00),
('Portátil Pro 15', 2, 1200.00, 850.00),
('Auscultadores Bluetooth', 1, 150.00, 75.00),
('Cafeteira Express', 4, 110.00, 60.00);

-- Clientes
INSERT INTO clientes (nome, cidade, pais, data_cadastro) VALUES
('Ana Saraiva', 'Luanda', 'Angola', '2025-01-10'),
('Carlos Mendes', 'Windhoek', 'Namíbia', '2025-01-15'),
('Adelaide Vilombo', 'Luanda', 'Angola', '2025-02-01'),
('Mateus Silva', 'Lisboa', 'Portugal', '2025-02-12'),
('Beatriz Costa', 'Porto', 'Portugal', '2025-03-05');

-- Vendas (Histórico de transações)
INSERT INTO vendas (cliente_id, produto_id, quantidade, data_venda, status_pagamento) VALUES
(1, 4, 1, '2026-01-05', 'Concluído'),
(2, 1, 2, '2026-01-12', 'Concluído'),
(3, 2, 1, '2026-01-15', 'Concluído'),
(1, 3, 2, '2026-01-20', 'Concluído'),
(4, 5, 1, '2026-02-02', 'Concluído'),
(5, 6, 2, '2026-02-10', 'Concluído'),
(2, 4, 1, '2026-02-14', 'Concluído'),
(3, 1, 1, '2026-02-18', 'Pendente'),
(1, 2, 3, '2026-03-01', 'Concluído'),
(4, 3, 1, '2026-03-04', 'Concluído'),
(5, 5, 2, '2026-03-10', 'Cancelado');
