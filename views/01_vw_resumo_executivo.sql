-- ==========================================
-- 01_vw_resumo_executivo.sql
-- View Relacional para Consumo em Power BI / Dashboards
-- ==========================================

CREATE OR REPLACE VIEW vw_resumo_vendas AS
SELECT 
    v.venda_id,
    v.data_venda,
    cl.nome AS cliente,
    cl.pais AS pais_cliente,
    p.nome_produto,
    c.nome_categoria,
    v.quantidade,
    p.preco_unitario,
    (v.quantidade * p.preco_unitario) AS faturacao_total,
    (v.quantidade * (p.preco_unitario - p.custo_unitario)) AS lucro_total,
    v.status_pagamento
FROM vendas v
JOIN clientes cl ON v.cliente_id = cl.cliente_id
JOIN produtos p ON v.produto_id = p.produto_id
JOIN categorias c ON p.categoria_id = c.categoria_id;
