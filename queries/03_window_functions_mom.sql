-- ==========================================
-- 03_window_functions_mom.sql
-- Ranking de Produtos e Variação Mensal (MoM)
-- ==========================================

-- 1. Ranking de Produtos por Categoria (por Preco)
SELECT 
    c.nome_categoria,
    p.nome_produto,
    p.preco_unitario,
    DENSE_RANK() OVER (PARTITION BY c.categoria_id ORDER BY p.preco_unitario DESC) AS ranking_preco
FROM produtos p
JOIN categorias c ON p.categoria_id = c.categoria_id;

-- 2. Variacao de Faturacao Mensal (MoM) com LAG
WITH vendas_mensais AS (
    SELECT 
        DATE_TRUNC('month', v.data_venda) AS mes,
        SUM(v.quantidade * p.preco_unitario) AS faturacao_mensal
    FROM vendas v
    JOIN produtos p ON v.produto_id = p.produto_id
    WHERE v.status_pagamento = 'Concluído'
    GROUP BY DATE_TRUNC('month', v.data_venda)
)
SELECT 
    TO_CHAR(mes, 'YYYY-MM') AS periodo,
    faturacao_mensal,
    LAG(faturacao_mensal, 1) OVER (ORDER BY mes) AS faturacao_mes_anterior,
    ROUND(
        ((faturacao_mensal - LAG(faturacao_mensal, 1) OVER (ORDER BY mes)) / 
        NULLIF(LAG(faturacao_mensal, 1) OVER (ORDER BY mes), 0)) * 100, 2
    ) AS percentual_crescimento_mom
FROM vendas_mensais
ORDER BY mes;
