-- ==========================================
-- 02_top_clientes.sql
-- Top Clientes por Volume de Compras
-- ==========================================

SELECT 
    cl.nome AS cliente,
    cl.cidade,
    cl.pais,
    COUNT(v.venda_id) AS total_pedidos,
    SUM(v.quantidade * p.preco_unitario) AS total_gasto
FROM vendas v
JOIN clientes cl ON v.cliente_id = cl.cliente_id
JOIN produtos p ON v.produto_id = p.produto_id
WHERE v.status_pagamento = 'Concluído'
GROUP BY cl.cliente_id, cl.nome, cl.cidade, cl.pais
ORDER BY total_gasto DESC
LIMIT 5;
