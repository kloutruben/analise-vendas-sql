-- ==========================================
-- 01_vendas_categoria.sql
-- Faturacao e Lucro por Categoria de Produto
-- ==========================================

SELECT 
    c.nome_categoria,
    COUNT(v.venda_id) AS total_vendas,
    SUM(v.quantidade * p.preco_unitario) AS faturacao_total,
    SUM(v.quantidade * p.custo_unitario) AS custo_total,
    SUM(v.quantidade * (p.preco_unitario - p.custo_unitario)) AS lucro_total
FROM vendas v
JOIN produtos p ON v.produto_id = p.produto_id
JOIN categorias c ON p.categoria_id = c.categoria_id
WHERE v.status_pagamento = 'Concluído'
GROUP BY c.nome_categoria
ORDER BY lucro_total DESC;
