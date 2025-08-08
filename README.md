### **Projeto Serenatto Café & Bistrô - Consultas SQL**

Este projeto SQL demonstra a criação e manipulação de um banco de dados para o "Serenatto - Café & Bistrô". O objetivo é centralizar as informações da empresa e desenvolver consultas que auxiliem na tomada de decisões estratégicas. O script abrange desde a criação do esquema do banco de dados (tabelas e relacionamentos) e inserção de dados, até a elaboração de consultas complexas para análise de vendas, clientes, produtos e faturamento.

O projeto explora não apenas consultas essenciais, mas também recursos avançados de banco de dados para otimização e automação de tarefas.

### 🛠️ **Técnicas e Recursos Utilizados:**

* **Estrutura do Banco de Dados (DDL):**
    * `CREATE TABLE`: Definição das tabelas `produtos`, `clientes`, `colaboradores`, `fornecedores`, `pedidos` e `itenspedidos`.
    * `PRIMARY KEY` e `FOREIGN KEY`: Estabelecimento de chaves primárias e estrangeiras para garantir a integridade relacional dos dados, utilizando `ON DELETE CASCADE` para gerenciar a exclusão de registros dependentes.
    * `DEFAULT`: Definição de valores padrão para colunas, como o email de clientes.

* **Manipulação e Modificação de Dados (DML):**
    * `INSERT INTO`: Populando o banco de dados com registros iniciais.
    * `UPDATE`: Atualização de informações existentes, como preços e descrições de produtos.
    * `DELETE`: Remoção de registros de tabelas.

* **Junção e Combinação de Consultas:**
    * `JOIN` (`INNER`, `LEFT`, `RIGHT`): Conexão de múltiplas tabelas para criar relatórios completos, como identificar produtos não vendidos ou clientes que não compraram em um certo período.
    * `UNION` e `UNION ALL`: Combinação de resultados de diferentes consultas para consolidar informações, como a lista de endereços de colaboradores e fornecedores.

* **Subconsultas (Subqueries):**
    * Uso de subconsultas nos blocos `WHERE`, `IN` e `HAVING` para realizar filtragens dinâmicas, como buscar produtos com preço acima da média ou clientes que fizeram pedidos em um mês específico.

* **Funções de Agregação e Agrupamento:**
    * `COUNT`, `SUM`, `AVG`: Realização de cálculos sobre conjuntos de dados para obter métricas como o valor total de um pedido, a média de preços e o faturamento diário.
    * `GROUP BY`: Agrupamento de dados para análise segmentada.

* **Funções de Data e Hora:**
    * `STRFTIME`, `DATE`, `BETWEEN`: Manipulação e filtragem de dados com base em datas, permitindo análises temporais, como performance de vendas mensal ou por período.

* **Recursos Avançados de Banco de Dados:**
    * **Views (`CREATE VIEW`):** Criação de visões para encapsular e simplificar consultas complexas e recorrentes, como a `ViewValorTotalPedido`.
    * **Triggers (`CREATE TRIGGER`):** Implementação de gatilhos para automatizar ações em resposta a eventos no banco de dados. Exemplo: um trigger que recalcula o faturamento diário automaticamente após cada nova inserção na tabela `itenspedidos`.
    * **Transações (`BEGIN TRANSACTION`, `COMMIT`, `ROLLBACK`):** Utilização de transações para garantir a consistência e a integridade dos dados durante a execução de múltiplos comandos DML.

### 🕒 **Como Reproduzir as Consultas:**

Para executar este projeto, você precisará de um ambiente que suporte **SQLite**. O arquivo `.sql` fornecido é um script completo.

1.  **Baixe o arquivo** `ConsultasSerenattoCaféBistrô.sql`.
2.  **Carregue o arquivo** em um cliente SQLite de sua preferência (como DB Browser for SQLite, DBeaver, ou a linha de comando do SQLite).
3.  **Execute o script completo.** Ele criará todas as tabelas, inserirá os dados de exemplo e, em seguida, executará as mais de 20 consultas de análise demonstradas.
