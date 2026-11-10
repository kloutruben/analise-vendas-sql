# Análise de Vendas e Retenção de Clientes em SQL

## 📌 Visão Geral do Projeto
Este projeto simula o ambiente de análise de dados de uma empresa de e-commerce e retalho. O objetivo principal é extrair insights operacionais e estratégicos a partir de um banco de dados relacional construído em **PostgreSQL**, apoiando a tomada de decisão em vendas, margem de lucro, desempenho por categoria e retenção de clientes.

## 🛠️ Tecnologias Utilizadas
- **SGBD:** PostgreSQL 16
- **Cliente SQL:** DBeaver Community
- **Linguagem:** SQL (DDL, DML, DQL, Window Functions, CTEs, Views)
- **Controlo de Versão:** Git & GitHub

## 📂 Estrutura do Repositório
```text
analise-vendas-sql/
├── database/
│   ├── 01_schema.sql          # Modelagem de tabelas e chaves estrangeiras
│   └── 02_insert_data.sql     # Povoamento de dados (Mock Data)
├── queries/
│   ├── 01_vendas_categoria.sql# Faturação e margem de lucro por categoria
│   ├── 02_top_clientes.sql    # Ranking de clientes por volume de compras
│   └── 03_window_functions_mom.sql # Window functions (DENSE_RANK e MoM)
├── views/
│   └── 01_vw_resumo_executivo.sql # View otimizada para integração em BI
└── README.md                  # Documentação do projeto
```

## 📊 Principais Consultas e Resultados
1. **Desempenho por Categoria (`01_vendas_categoria.sql`):** Agregação de custos, receita e margem de lucro real via `JOIN` triplo e `GROUP BY`.
2. **Identificação dos Top Clientes (`02_top_clientes.sql`):** Análise do valor acumulado por cliente em transações concluídas.
3. **Análise de Tendência Mensal - MoM (`03_window_functions_mom.sql`):** Aplicação de `LAG()` e `CTEs` para calcular o crescimento percentual mês a mês.
4. **Integração com BI (`01_vw_resumo_executivo.sql`):** Modelo denormalizado pronto para consumo direto em relatórios (Power BI / Excel).

## 🚀 Como Executar Localmente
1. Clone o repositório:
   ```bash
   git clone https://github.com/kloutruben/analise-vendas-sql.git
   ```
2. Execute o script `database/01_schema.sql` na sua instância local do PostgreSQL.
3. Execute o script `database/02_insert_data.sql` para carregar as transações.
4. Explore as consultas dentro da pasta `queries/`.

---
**Autor:** Ruben Kuyota  
**LinkedIn:** [linkedin.com/in/ruben-kuyota-783a36171](https://www.linkedin.com/in/ruben-kuyota-783a36171/)
