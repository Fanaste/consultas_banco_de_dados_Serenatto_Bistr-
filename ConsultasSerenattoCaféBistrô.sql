-- Consultas para a empresa Serenatto - café e bistrô

-- A empresa deseja centralizar as informações em um banco de dados e fornecer consultas para tomarem melhores decisões para a empresa
-- Criação das tabelas:

CREATE TABLE produtos (
  id_produto TEXT PRIMARY KEY,
  nome_produto VARCHAR (255),
  descricao_produto VARCHAR (255),
  preco_produto DECIMAL (10,2),
  categoria_produto VARCHAR (50)
  );
  
CREATE TABLE clientes (
  id_clientes TEXT PRIMARY KEY NOT NULL,
  nome_cliente VARCHAR(255),
  telefone_cliente VARCHAR(20),
  email_cliente VARCHAR(100) DEFAULT 'Sem email', -- Item novo de aprendizado
  endereco_cliente VARCHAR(255)
);
  
CREATE TABLE colaboradores (
  id_colaborador TEXT PRIMARY KEY,
  nome_colaborador VARCHAR(255) NOT NULL,
  cargo VARCHAR (100),
  datacontratacao DATE, 
  telefone_colaborador VARCHAR (20),
  email_colaborador VARCHAR (100),
  Rua VARCHAR(100) NOT NULL,
  Bairro VARCHAR(100) NOT NULL,
  Cidade VARCHAR(100) NOT NULL,
  Estado VARCHAR(2) NOT NULL,
  cep VARCHAR(8) NOT NULL
);
  
CREATE TABLE fornecedores (
  id_fornecedor TEXT PRIMARY KEY,
  nome_fornecedor VARCHAR(255) NOT NULL,
  contato_fornecedor VARCHAR(100) NOT NULL,
  telefone_fornecedor VARCHAR(20),
  email_fornecedor VARCHAR(100),
  rua_fornecedor VARCHAR(100) NOT NULL,
  bairro_fornecedor VARCHAR(100) NOT NULL,
  cidade_fornecedor VARCHAR(100) NOT NULL,
  estado_fornecedor VARCHAR(2) NOT NULL,
  cep_fornecedor VARCHAR(8) NOT NULL
);
  
CREATE TABLE pedidos (
  id_pedido TEXT PRIMARY KEY,
  id_cliente TEXT,
  datahora_pedido DATETIME,
  status VARCHAR (50),
  FOREIGN KEY (id_cliente) REFERENCES clientes(id_clientes) ON DELETE CASCADE -- Item novo de aprendizado
 );
 
CREATE TABLE itenspedidos (
  id_pedido TEXT,
  id_produto TEXT,
  quantidade INTEGER,
  preco_unitario DECIMAL (10,2),
  PRIMARY KEY (id_pedido, id_produto),
  FOREIGN KEY (id_pedido) REFERENCES pedidos(id_pedido),
  FOREIGN KEY (id_produto) REFERENCES produtos(id_produto)
  );
  
--Inserção de dados nas tabelas
INSERT INTO colaboradores (id_colaborador, nome_colaborador, cargo, datacontratacao, telefone_colaborador, email_colaborador, rua, bairro, cidade, estado, cep) VALUES
('1', 'Carlos Silva', 'Gerente', '2022-03-15', '115551234', 'carlos.silva@email.com', 'Rua do Comércio - 258', 'Centro', 'São Paulo', 'SP', '01000001'),
('2', 'Marta Sousa', 'Chef de Cozinha', '2022-05-10', '215555678', 'marta.sousa@email.com', 'Rua dos Sabores - 456', 'Saboroso', 'São Paulo', 'SP', '20000001'),
('3', 'Pedro Almeida', 'Barista', '2022-07-20', '315557890', 'pedro.almeida@email.com', 'Avenida do Café - 789', 'Centro', 'São Paulo', 'SP', '01000001'),
('4', 'Sofia Rodrigues', 'Garçom', '2022-01-12', '415552345', 'sofia.rodrigues@email.com', 'Rua da Hospitalidade - 101', 'Boas Maneiras', 'São Paulo', 'SP', '40000001'),
('5', 'João Pereira', 'Atendente', '2022-09-05', '515558765', 'joao.pereira@email.com', 'Rua das flores - 210', 'Centro', 'São Paulo', 'SP', '20000001'),
('6', 'Inês Lima', 'Barista', '2022-04-02', '615553421', 'ines.lima@email.com', 'Rua das Entregas - 280', 'Entregas Rápidas', 'São Paulo', 'SP', '90000001'),
('7', 'Antonio Artur', 'Entregador', '2023-01-10', '568442577', 'antonio.artur@email.com', 'Rua das flores - 210', 'Centro', 'São Paulo', 'SP', '20000001');
  
INSERT INTO fornecedores (id_fornecedor, nome_fornecedor, contato_fornecedor, telefone_fornecedor, email_fornecedor, rua_fornecedor, bairro_fornecedor, cidade_fornecedor, estado_fornecedor, cep_fornecedor) VALUES
(1, 'Café do Brasil Ltda.', 'Maria Oliveira', '115551234', 'cafebrasil@email.com', 'Rua do Café - 123', 'Centro', 'São Paulo', 'SP', '01000000'),
(2, 'Laticínios Sabor Puro', 'João Santos', '215555678', 'laticinios@email.com', 'Avenida das Vacas - 456', 'Leite Feliz', 'Rio de Janeiro', 'RJ', '20000000'),
(3, 'Frutas Frescas S.A.', 'Carlos Ferreira', '315557890', 'frutasfrescas@email.com', 'Rua das Maçãs - 789', 'Pomar Verde', 'Belo Horizonte', 'MG', '30000000'),
(4, 'Padaria da Cidade', 'Sofia Alves', '415552345', 'padariacidade@email.com', 'Rua dos Pães - 101', 'Pão Quentinho', 'Salvador', 'BA', '40000000'),
(5, 'Fornecedor de Chocolate', 'Rui Lima', '515558765', 'chocolatelovers@email.com', 'Rua do Cacau - 210', 'Chocolateira', 'Florianópolis', 'SC', '88000000'),
(6, 'Distribuidora de Bebidas', 'Ana Pereira', '615553421', 'bebidaspremium@email.com', 'Avenida das Garrafas - 35', 'Copo Cheio', 'Porto Alegre', 'RS', '90000000');
  
INSERT INTO produtos (id_produto, nome_produto, descricao_produto, preco_produto, categoria_produto) VALUES
(1, 'Espresso', 'Um shot de espresso forte e encorpado.', 2.50, 'Café'),
(2, 'Cappuccino', 'Espresso, leite vaporizado e espuma de leite.', 3.50, 'Café'),
(3, 'Latte Macchiato', 'Leite vaporizado, espresso e espuma de leite.', 4.00, 'Café'),
(4, 'Mocha', 'Espresso, leite vaporizado, chocolate e chantilly.', 4.50, 'Café'),
(5, 'Café da Casa', 'Café da casa especial com sabor suave.', 2.00, 'Café'),
(6, 'Chá de Camomila', 'Chá de camomila com mel e limão.', 2.00, 'Chá'),
(7, 'Omelete de Queijo', 'Omelete recheada com queijo e ervas.', 7.50, 'Almoço'),
(8, 'Quiche de Espinafre', 'Quiche de espinafre e queijo de cabra.', 8.00, 'Almoço'),
(9, 'Frango ao Curry', 'Frango ao curry com arroz basmati.', 9.00, 'Jantar'),
(10, 'Tiramisu', 'Sobremesa italiana com café e mascarpone.', 5.00, 'Sobremesa'),
(11, 'Croissant de Chocolate', 'Croissant recheado com chocolate belga.', 3.50, 'Sobremesa'),
(12, 'Cappuccino Gelado', 'Cappuccino gelado com chantilly e canela.', 4.50, 'Café'),
(13, 'Salada de Quinoa', 'Salada de quinoa com vegetais frescos.', 7.00, 'Almoço'),
(14, 'Sanduíche de Peru', 'Sanduíche de peru com queijo e mostarda.', 6.00, 'Almoço'),
(15, 'Salmão Grelhado', 'Salmão grelhado com legumes da estação.', 11.00, 'Jantar'),
(16, 'Cheesecake de Framboesa', 'Cheesecake de framboesa com calda.', 5.50, 'Sobremesa'),
(17, 'Smoothie de Frutas', 'Smoothie refrescante de frutas da estação.', 4.00, 'Bebidas'),
(18, 'Chá Verde', 'Chá verde com gengibre e limão.', 2.50, 'Chá'),
(19, 'Baguete de Presunto', 'Baguete fresca recheada com presunto e queijo.', 10.00, 'Almoço'),
(20, 'Salada de Frutas', 'Salada de frutas frescas com iogurte.', 4.00, 'Sobremesa'),
(21, 'Caprese Wrap', 'Wrap recheado com tomate, mozzarella e manjericão.', 6.50, 'Almoço'),
(22, 'Muffin de Mirtilo', 'Muffin de mirtilo recém-assado.', 3.00, 'Café'),
(23, 'Smoothie de Manga', 'Smoothie refrescante de manga e banana.', 4.50, 'Bebidas'),
(24, 'Misto Quente', 'Sanduíche misto quente de presunto e queijo.', 5.50, 'Almoço'),
(25, 'Tarte Tatin de Maçã', 'Tarte de maçã caramelizada.', 5.00, 'Sobremesa'),
(26, 'Sanduíche de Frango', 'Sanduíche de frango grelhado e abacate.', 7.00, 'Almoço'),
(27, 'Batido de Morango', 'Batido cremoso de morango com chantilly.', 4.50, 'Bebidas'),
(28, 'Croissant de Amêndoa', 'Croissant recheado com chocolate belga.', 3.50, 'Sobremesa'),
(29, 'Tofu Scramble', 'Scramble de tofu com vegetais e espinafre.', 6.50, 'Sobremesa'),
(30, 'Salada de Atum', 'Salada de atum com feijão e pimentão.', 8.00, 'Almoço');
  
INSERT INTO clientes (id_clientes, nome_cliente, telefone_cliente, email_cliente, endereco_cliente) VALUES
(1, 'Maria Silva', '115551234', 'maria.silva@email.com', 'Rua das Flores, 123, Cidade A'),
(2, 'João Pereira', '215555678', 'joao.pereira@email.com', 'Av. Principal, 456, Cidade B'),
(3, 'Ana Rodrigues', '315557890', 'ana.rodrigues@email.com', 'Rua Central, 789, Cidade C'),
(4, 'Pedro Alves', '415552345', 'pedro.alves@email.com', 'Travessa dos Sonhos, 56, Cidade D'),
(5, 'Sofia Santos', '515558765', 'sofia.santos@email.com', 'Alameda das Artes, 321, Cidade E'),
(6, 'Jorge Lima', '615553421', 'jorge.lima@email.com', 'Praça das Estrelas, 987, Cidade F'),
(7, 'Luisa Ferreira', '715559876', 'luisa.ferreira@email.com', 'Rua das Palmeiras, 789, Cidade G'),
(8, 'Carlos Gomes', '815552345', 'carlos.gomes@email.com', 'Avenida dos Ventos, 123, Cidade H'),
(9, 'Marta Ribeiro', '915555432', 'marta.ribeiro@email.com', 'Travessa das Maravilhas, 56, Cidade I');

-- inserção default dos clientes:

INSERT INTO clientes (id_clientes, nome_cliente, telefone_cliente, email_cliente, endereco_cliente) VALUES
(10, 'Ana Maria Silva', '1515557890', 'ana.silva@email.com', 'Rua Central, 567, Cidade O');
INSERT INTO clientes (id_clientes, nome_cliente, telefone_cliente, endereco_cliente) VALUES
('11', 'André Almeida', '1015556789', 'Praça da Felicidade, 456, Cidade J');
INSERT INTO clientes (id_clientes, nome_cliente, telefone_cliente, email_cliente, endereco_cliente) VALUES
('12', 'João Carlos Rodrigues', '1615552345', 'joao.rodrigues@email.com', 'Praça dos Poetas, 321, Cidade P');
INSERT INTO clientes (id_clientes, nome_cliente, telefone_cliente, endereco_cliente) VALUES
('13', 'Isabela Pereira', '1115558765', 'Rua das Araras, 789, Cidade K');

INSERT INTO clientes (id_clientes, nome_cliente, telefone_cliente, email_cliente, endereco_cliente) VALUES
(14, 'Isabel Gonçalves', '1715558765', 'isabel.goncalves@email.com', 'Alameda das Gaivotas, 654, Cidade Q'),
(15, 'Ricardo Ferreira', '1815554321', 'ricardo.ferreira@email.com', 'Avenida da Paz, 987, Cidade R'),
(16, 'Mariana Costa', '1915551234', 'mariana.costa@email.com', 'Travessa das Mariposas, 234, Cidade S'),
(17, 'Luís Carlos Sousa', '2015555678', 'luis.sousa@email.com', 'Rua dos Sonhos, 456, Cidade T'),
(18, 'Silvia Ribeiro', '2115557890', 'silvia.ribeiro@email.com', 'Alameda dos Sorrisos, 765, Cidade U'),
(19, 'Artur Santos', '2215552345', 'artur.santos@email.com', 'Praça das Alegrias, 987, Cidade V'),
(21, 'Carolina Lima', '2315558765', 'carolina.lima@email.com', 'Avenida da Felicidade, 654, Cidade W'),
(22, 'Pedro Almeida', '2415554321', 'pedro.almeida@email.com', 'Rua das Estrelas, 123, Cidade X'),
(23, 'Inês Gonçalves', '2515551234', 'ines.goncalves@email.com', 'Travessa das Maravilhas, 234, Cidade Y');

INSERT INTO clientes (id_clientes,nome_cliente, telefone_cliente, endereco_cliente) VALUES
(24, 'Rui Santos', '1215554321', 'Alameda das Estrelas, 654, Cidade L');
INSERT INTO clientes (id_clientes,nome_cliente, telefone_cliente, email_cliente, endereco_cliente) VALUES
(25, 'Diogo Fernandes', '2615555678', 'diogo.fernandes@email.com', 'Praça dos Desejos, 987, Cidade Z');
INSERT INTO clientes (id_clientes,nome_cliente, telefone_cliente, endereco_cliente) VALUES
(26, 'Helena Lima', '1315551234', 'Avenida dos Sonhos, 234, Cidade M');
INSERT INTO clientes (id_clientes,nome_cliente, telefone_cliente, endereco_cliente) VALUES
(27, 'Paulo Sousa', '1415555678', 'Travessa das Marés, 876, Cidade N');

INSERT INTO pedidos (id_pedido, id_cliente, datahora_pedido, status) VALUES
 ('1','10','2023-01-02 08:15:00','Em Andamento'), 
 ('2','3','2023-01-02 08:45:00','Concluído'), 
 ... -- Várias inserções feitas na pedidos
 
 INSERT INTO itenspedidos (id_pedido, id_produto, quantidade, preco_unitario) VALUES 
 ('1','5','1','2.00'), 
 ('1','2','2','7.00'), 
  ... -- Várias inserções feitas na tabela itenpedidos
  
--Conferir se os dados foram adicionados:
SELECT * FROM colaboradores;

SELECT * FROM fornecedores;
  
SELECT * FROM produtos;
  
SELECT * FROM clientes;

SELECT * FROM itenspedidos;

SELECT * FROM pedidos;
  
-- Consultas realizadas:
	-- Consulta 1) Gestores pediram endereços de fornecedores e colaboradores para enviar itens de presentes:
SELECT rua, bairro, cidade, estado, cep FROM colaboradores
UNION 
SELECT rua_fornecedor, bairro_fornecedor, cidade_fornecedor, estado_fornecedor, cep_fornecedor FROM fornecedores;
-- Problema dessa consulta é que se tiver colaboradores ou fornecedores no mesmo endereço, o envio de presentes será para apenas 1 deles e alguém ficará sem, pois a consulta com UNION não gera resultados duplicados.

-- Consulta 2) Então essa será a consulta para retornar resultados duplicados também:
SELECT nome_colaborador, rua, bairro, cidade, estado, cep FROM colaboradores
UNION ALL 
SELECT nome_fornecedor, rua_fornecedor, bairro_fornecedor, cidade_fornecedor, estado_fornecedor, cep_fornecedor FROM fornecedores;

--Aprendizado novo: Subconsultas
-- Consulta 3) Buscar qual foi o primeiro cliente que fez uma compra no café Serenatto:
SELECT nome_cliente, telefone_cliente 
FROM clientes 
WHERE id_clientes = (
  	SELECT id_cliente 
     FROM pedidos 
     WHERE datahora_pedido = '2023-01-02 08:15:00');
     
-- Consulta 4) Retornar todos os pedidos realizados em um determinado mês:
SELECT id_cliente FROM pedidos WHERE STRFTIME ('%m', datahora_pedido) = '01';

SELECT nome_cliente 
FROM clientes 
	WHERE id_clientes IN ( -- Aprendizado novo
      SELECT id_cliente 
      FROM pedidos 
      WHERE STRFTIME ('%m', datahora_pedido) = '01' 
      );

-- Consulta 5) Saber a média de preços dos produtos:
SELECT AVG(preco_produto) FROM produtos;

-- Consulta 6) Identificar quais são os produtos que possuem o preço maior que a média dos produtos:
SELECT nome_produto, preco_produto FROM produtos
GROUP BY nome_produto, preco_produto
HAVING preco_produto > (
  SELECT AVG(preco_produto)
  FROM produtos);
  
-- Consulta 7) Identificar pelo nome qual foi o cliente que realizou o pedido pelo id e hora realizada do pedido:
SELECT * FROM clientes

SELECT * FROM pedidos

SELECT c.nome_cliente, p.id_pedido, p.datahora_pedido
FROM clientes c
Inner Join pedidos p 
ON c.id_clientes = p.id_cliente
--sempre referenciar as tabelas que estão sendo usadas

-- Inserção de um novo produto no café:
INSERT INTO Produtos (id_produto, nome_produto, descricao_produto, preco_produto, categoria_produto)VALUES 
(31, 'Lasanha à Bolonhesa', 'Deliciosa lasanha caseira com molho bolonhesa', 12.50, 'Almoço');

-- Consulta 8) Identificar quais produtos foram vendidos ou não:

SELECT * FROM produtos


SELECT pr.nome_produto, ip.id_produto, ip.id_pedido
FROM itenspedidos ip
RIGHT JOIN produtos pr
ON pr.id_produto = ip.id_pedido;

-- Consulta 9) Saber se há produtos que não foram vendidos em um determinado mês:

SELECT pr.nome_produto,  x.id_produto,  x.id_pedido
FROM(
    SELECT ip.id_pedido, ip.id_produto
    FROM pedidos p
    JOIN itenspedidos ip 
    ON p.id_pedido = ip.id_pedido
    WHERE strftime('%m', p.datahora_pedido) = '10' ) x
RIGHT JOIN produtos pr
ON pr.id_produto =  x.id_produto;

-- Inserção de novos clientes novamente:
INSERT INTO Clientes (id_clientes, nome_cliente, telefone_cliente, email_cliente, endereco_cliente)
VALUES (28, 'João Santos', '215555678', 'joao.santos@email.com', 'Avenida Principal, 456, Cidade B'),
       (29, 'Carla Ferreira', '315557890', 'carla.ferreira@email.com', 'Travessa das Ruas, 789, Cidade C');

-- Consulta 10) Identificar quais clientes compraram em determinado mês:
SELECT c.nome_cliente, p.id_pedido
From clientes c
LEFT Join pedidos p
On c.id_clientes = p.id_cliente
WHERE strftime('%m', p.datahora_pedido) = '10'

-- Consulta 11) Identificar quais clientes não compraram em determinado mês:
SELECT c.nome, x.id
FROM clientes c 
LEFT JOIN
(
    SELECT p.id, p.idcliente 
    FROM pedidos p 
    WHERE strftime('%m', p.datahorapedido) = '10')x
ON c.id = x.idcliente
WHERE x.idcliente IS NULL

-- Consulta 12) Calcular o valor total dos pedidos:

SELECT * FROM pedidos
SELECT * FROM itenspedidos

SELECT p.id_pedido, ip.quantidade, ip.preco_unitario, pr.preco_produto
FROM pedidos p 
JOIN itenspedidos ip ON p.id_pedido = ip.id_pedido
JOIN produtos pr ON pr.id_produto = ip.id_produto

-- Consulta 13) Saber os dados do cliente que fez determinado pedido:

SELECT p.id_pedido, c.nome_cliente, SUM(ip.preco_unitario) AS ValortotalPedido
From clientes c 
Join pedidos p ON c.id_clientes = p.id_cliente
JOIN itenspedidos ip ON p.id_pedido = ip.id_pedido
Group BY p.id_pedido, c.nome_cliente

-- Consulta 14) Retornar o nome de cada cliente e o valor total dos pedidos que cada um deles comprou:

SELECT c.nome_cliente AS NomeCliente, SUM(ip.preco_unitario) AS SomaTotalPedidos
FROM clientes c
INNER JOIN Pedidos p 
ON c.id_clientes = p.id_cliente
INNER JOIN itenspedidos ip
On P.id_pedido = ip.id_produto
GROUP BY c.nome_cliente;

-- Encontrar formas de otimizar as consultas (Views):
-- Criando Views:
CREATE VIEW ViewCliente AS 
SELECT nome_cliente,endereco_cliente FROM clientes;

--Visualizando a view criada:
SELECT * FROM ViewCliente;

CREATE VIEW ViewValorTotalPedido AS 
SELECT p.id_pedido, c.nome_cliente, p.datahora_pedido, SUM(ip.preco_unitario) AS ValortotalPedido
From clientes c 
Join pedidos p ON c.id_clientes = p.id_cliente
JOIN itenspedidos ip ON p.id_pedido = ip.id_pedido
Group BY p.id_pedido, c.nome_cliente

-- Visualizando a view criada:
SELECT * FROM ViewValorTotalPedido;

--Para excluir a View, é somente utilizar o drop:
DROP VIEW ViewCliente;

-- Consulta 15) Calcular o valor do faturamento diário (valor dos pedidos que foram feitos por dia):
	--Preciso do dia que foram realizados os pedidos
SELECT * FROM pedidos
	-- Agora preciso do preço unitário que está nessa consulta abaixo
Select * FROM itenspedidos

	-- Fazer a junção entre as tabelas
    
SELECT DATE(datahora_pedido) as Dia, SUM(ip.preco_unitario) AS FaturamentoDiario
FROM pedidos p
JOIN itenspedidos ip
ON p.id_pedido = ip.id_pedido
GROUP BY Dia
ORDER BY Dia;

-- Inserção de Trigger (procedimento armazenado que é acionado quando acontece uma ação):
CREATE TABLE Faturamentodiario (
  Dia Date,
  faturamentoTotal DECIMAL(10,2)
  );

  --Criando o trigger:
  
 CREATE TRIGGER CalculaFaturamentoDiario
AFTER INSERT ON itenspedidos
FOR EACH ROW
BEGIN
    DELETE FROM Faturamentodiario;
    INSERT INTO Faturamentodiario (Dia, faturamentototal)
    SELECT DATE(p.datahora_pedido) AS Dia, 
           SUM(ip.preco_unitario) AS FaturamentoDiario
    FROM pedidos p
    JOIN itenspedidos ip ON p.id_pedido = ip.id_pedido
    GROUP BY Dia
    ORDER BY Dia;
END;

-- Inserindo novos dados para verificar a Trigger criada:
INSERT INTO pedidos (id_pedido, id_cliente, datahora_pedido, status)
VALUES (452, 27, '2023-10-07 14:30:00', 'Em Andamento');

-- Inserindo dados novos para verificar a Trigger criada:
INSERT INTO itenspedidos (id_pedido, id_produto, quantidade, preco_unitario)
VALUES (452, 14, 1, 6.0),
         (452, 13, 1, 7.0);
   
-- Avaliando se a Trigger funcionou:   
select * from Faturamentodiario

-- Inserindo novos dados:
INSERT INTO pedidos (id_pedido, id_cliente, datahora_pedido, status) 
VALUES (453, 28, '2023-10-07 14:35:00', 'Em Andamento');
INSERT INTO itenspedidos (id_pedido, id_produto, quantidade, preco_unitario) VALUES 
(453, 10, 1, 5.0),
(453, 31, 1, 12.50);

-- Fazendo as chaves estrangeiras funcionar:
PRAGMA foreign_keys = ON


-- Consulta 16) Atualizar o preço de produtos existentes:
UPDATE produtos SET preco_produto = 13 
WHERE id_produto = 31;

UPDATE produtos SET descricao_produto = 'Crossaint recheado com amêndoas.' WHERE id_produto = 28

SELECT * FROM produtos WHERE nome_produto LIKE 'croissant%'

-- Consulta 17) Exclusão de dados não necessários:
select * from colaboradores;

-- Um dos colaboradores foi desligados e por isso é preciso remover os dados do funcionário
select * from colaboradores
where id_colaborador = 3

DELETE from colaboradores
where id_colaborador = 3;

-- Consulta 18) Remover informações da tabela de clientes
select * from clientes where id_clientes = 27
select * from pedidos where id_cliente = 27

--Cuidado com o On Delete Cascade

DELETE FROM clientes where id_clientes = 27

-- Transações: são como novos blocos que irão executar várias consultas dentro de um transaction
-- Estrutura:
BEGIN TRANSACTION

SELECT * FROM clientes

SELECT * FROM pedidos

UPDATE pedidos set status = 'Concluído' where status = 'Em Andamento'

DELETE FROM clientes

ROLLBACK; --Retorna as consultas
Commit; -- Salva as alterações

-- Consulta 19) Trazer todos os dados de Maria Silva:

	select * from clientes
    where nome_cliente like 'Maria Silva'
    
 -- Consulta 20) Busque o Id do pedido e o id do cliente dos pedidos onde o status esteja como entregue 
 
select id_pedido, id_cliente
From pedidos
Where status = 'Entregue'

-- Consulta 21) Retorne todos os produtos onde o preço seja maior que 10 e menor que 15:

select nome_produto, preco_produto
From produtos
Where preco_produto > 10 and preco_produto < 15

-- Consulta 22) Busque o nome e cargo dos colaboradores que foram contratados entre 2022-01-01 e 2022-06-31:
select nome_colaborador, cargo, datacontratacao
From colaboradores
where datacontratacao BETWEEN '2022-01-01' and '2022-06-31'

-- Consulta 23) Recuperar o nome do cliente que fez o primero pedido
-- Descobrir quando foi feito o primeiro pedido:
select * from pedidos -- está em ordem crescente da data, portanto o primeiro registro já retorna o primeiro pedido
-- Fazer uma junção para buscar o nome da cliente que fez o primeiro pedido:
Select c.nome_cliente 
from clientes c
LEFT Join pedidos p 
ON c.id_clientes = p.id_cliente
Where id_pedido = '1'

