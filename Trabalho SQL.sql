/*
Na sintaxe o campo id (chave primária) como é serial, normalmente ele não precisa ser informado
já que o postgres gera o valor automaticamente para cada produto, reduzindo a possibilidade 
de conflitos de chave e simplificando a carga de dados
No campo nome_produto foi definido VARCHAR(150) pra armazenar textos de tamanho variável
permitindo flexibilidade para os nomes e impondo um limite para garantir a consistência dos dados
No campo valor_produto foi utilizado NUMERIC(10,2) para armazenar valores com monetários com mais precisão,
evitando erros de arredondamentos 
*/
CREATE TABLE data_warehouse.dim_produto(
id serial  PRIMARY KEY,
nome_produto VARCHAR(150) NOT NULL,
valor_produto NUMERIC(10,2) NOT NULL
);

SELECT * FROM data_warehouse.dim_produto

INSERT INTO data_warehouse.dim_produto(nome_produto, valor_produto)
VALUES ('Cimento Portland 50kg', 38.90),
('Argamassa AC-I 20kg', 15.50),
('Argamassa AC-III 20kg', 32.00),
('Tijolo Cerâmico 9x19x19 (milheiro)', 850.00),
('Areia Lavada Fina (m³)', 110.00),
('Areia Lavada Grossa (m³)', 115.00),
('Pedra Brita nº 1 (m³)', 125.00),
('Cal Hidratada 20kg', 12.90),
('Barra de Ferro 3/8 (10mm) 12m', 54.00),
('Barra de Ferro 5/16 (8mm) 12m', 38.50),
('Tinta Acrílica Branco Neve 18L', 289.00),
('Massa Corrida 20kg', 55.00),
('Rolo de Pintura Carneiro 23cm', 22.00),
('Pincel Atlas 2 polegadas', 8.50),
('Verniz Marítimo Brilhante 3.6L', 95.00),
('Selador Acrílico 18L', 120.00),
('Tubo PVC Esgoto 100mm (6m)', 75.00),
('Tubo PVC Esgoto 40mm (6m)', 28.00),
('Joelho PVC 90 graus 100mm', 12.50),
('Caixa D’água Polietileno 500L', 240.00),
('Vaso Sanitário com Caixa Acoplada', 350.00),
('Torneira para Cozinha Gourmet', 189.90),
('Chuveiro Elétrico 5500W 127V', 65.00),
('Fio Flexível 2,5mm² 100m Azul', 210.00),
('Fio Flexível 4,0mm² 100m Vermelho', 340.00),
('Disjuntor Monofásico 20A', 14.00),
('Interruptor Simples com Placa', 9.50),
('Tomada 10A com Placa', 11.00),
('Lâmpada LED 9W Branca', 7.90),
('Piso Cerâmico PEI 4 (m²)', 29.90),
('Porcelanato Polido 60x60 (m²)', 68.00),
('Rejunte Flexível 1kg', 6.50),
('Espaçador de Piso 2mm (100 unid)', 5.00),
('Telha de Fibrocimento 2,44x1,10m', 52.00),
('Cumeeira Fibrocimento', 24.00),
('Manta Asfáltica Impermeabilizante 10m', 195.00),
('Porta de Madeira Lisa 80cm', 180.00),
('Batente de Madeira para Porta', 85.00),
('Fechadura para Porta Externa', 75.00),
('Dobradiça de Aço 3x2.1/2 (kit c/3)', 28.00),
('Janela de Alumínio 1,00x1,20m', 320.00),
('Parafuso Sextavado (cento)', 35.00),
('Bucha de Nylon nº 8 (cento)', 12.00),
('Prego com Cabeça 17x21 (kg)', 22.50),
('Silicone Transparente 280g', 19.90),
('Escada de Alumínio 5 Degraus', 165.00),
('Carrinho de Mão 45L Reforçado', 145.00),
('Pá Quadrada com Cabo', 42.00),
('Picareta Estreita com Cabo', 58.00),
('Desempenadeira de Aço Dentada', 18.00);

CREATE TABLE data_warehouse.dim_produto(
id serial  PRIMARY KEY,
nome_cliente VARCHAR(150) NOT NULL
);

SELECT * FROM data_warehouse.dim_cliente

INSERT INTO data_warehouse.dim_cliente (nome_cliente)
VALUES
('Ana Beatriz Silva'),
('Bruno Oliveira Santos'),
('Carlos Eduardo Lima'),
('Daniela Ferreira Costa'),
('Eduardo Gomes Rocha'),
('Fernanda Souza Melo'),
('Gabriel Almeida Pires'),
('Helena Castro Neves'),
('Igor Martins Coelho'),
('Juliana Barbosa Dias'),
('Kevin Rodrigues Alves'),
('Larissa Mendes Vieira'),
('Marcelo Augusto Freitas'),
('Natália Cardoso Ramos'),
('Otávio Henrique Lopes'),
('Patrícia Nunes Machado'),
('Ricardo Jorge Peixoto'),
('Sabrina Antunes Farias'),
('Thiago Moreira Cavalcante'),
('Úrsula Magalhães Bastos'),
('Vitor Hugo Nascimento'),
('Wanessa Camargo Toledo'),
('Xavier de Souza Neto'),
('Yasmim Vitória Guerra'),
('Zeca Afonso Moreira'),
('Arthur Pereira Fontes'),
('Beatriz Helena Valente'),
('Caio Vinícius Teixeira'),
('Davi Lucca Bernardes'),
('Emanuelle Cristina Sales');

CREATE TABLE data_warehouse.dim_produto(
id serial  PRIMARY KEY,
nome_vendedor VARCHAR(150) NOT NULL
);

SELECT * FROM data_warehouse.dim_vendedor;

INSERT INTO data_warehouse.dim_vendedor (nome_vendedor)
VALUES
('Adriano Ribeiro'),
('Beatriz Albuquerque'),
('Caio Meirelles'),
('Debora Peixoto'),
('Elton Figueiredo'),
('Fabiana Schimidt'),
('Guilherme Junqueira'),
('Humberto Delgado'),
('Isabela Dornelles'),
('João Paulo Silveira'),
('Karine Abravanel'),
('Leonardo Bittencourt'),
('Marcos Vinícius Terra'),
('Nicole Stefanini'),
('Orlando Fontes'),
('Priscila Cavalcanti'),
('Renato Guimarães'),
('Sonia Abrantes'),
('Tales de Mileto Sobrinho'),
('Valéria Fagundes');

CREATE TABLE data_warehouse.fato_vendas (
    id SERIAL PRIMARY KEY,
    id_cliente INTEGER NOT NULL,
    id_produto INTEGER NOT NULL,
    id_vendedor INTEGER NOT NULL,
    valor_venda NUMERIC(10,2) NOT NULL,
    data_da_venda DATE NOT NULL,
    numero_cupom VARCHAR(50) NOT NULL,
    quantidade INTEGER NOT NULL
);

SELECT * FROM data_warehouse.fato_vendas

/* Essa consulta seleciona apenas as colunas necessárias em vez de utilizar SELECT * que em um ambiente de 
Data Warehouse isso pode significar dezenas de colunas e milhões de linhas com isso 
consumindo mais recursos que o necessário reduzindo a quantidade de dados processados e transferidos. 
*/
SELECT data_da_venda FROM data_warehouse.fato_vendas

/* Na consulta abaixo foi utilizado filtros condicionais pra identificar vendas menores que
100 reais realizadas o dia 10 de janeiro de 2026 e 20 de janeiro de 2026
*/
SELECT * FROM data_warehouse.fato_vendas
WHERE valor_venda < 100 
  AND data_da_venda BETWEEN '2026-01-10' AND '2026-01-20';

/*
Aconsulta com a função COUNT(*) retorna o número total de clientes cadastrados na tabela
*/
SELECT COUNT(*)
FROM data_warehouse.dim_cliente 

/*
Essa consulta calcula o valor total vendido por cada vendendor. A função SUM() soma os valores das
vendas registradas na tabela fato, enquanto GROUP BY agrupa os registros por vendedor, permitindo
obter um total individual para cada profissional ajudando na construção de indicadores comerciais e rankings
*/
SELECT
     id_vendedor,
	 SUM(valor_venda) as total_vendido
FROM data_warehouse.fato_vendas
GROUP BY id_vendedor;

/*
Essa consulta foi feita para reunir informações de vendas, em que utilizando o INNER JOIN foram relacionadas
a tabela fato e as dimensões de clientes e vendedores gerando informações na criação de possíveis relatórios
de vendas
*/
SELECT 
     dc.nome_cliente,
	 dv.nome_vendedor,
	 fv.valor_venda
FROM data_warehouse.fato_vendas fv
INNER JOIN data_warehouse.dim_cliente dc
        ON fv.id.cliente = dc.id
INNER JOIN data_warehouse.dim_vendedor dv
        ON fv.id_vendedor = dv.id

/*
Essa consulta realizada para identificar vendedores que não realizaram nenhuma venda. Para isso, foi usado
um LEFT JOIN entre a tabela dim_vendedor e a tabela fato_vendas com isso ajudanddo no acompanhamento de
desempenho
*/
SELECT 
     dv.nome_vendedor
FROM data_warehouse.dim_vendedor dv
LEFT JOIN data_warehouse.fato_vendas fv
   ON dv.id = fv.id_vendedor
WHERE fv.id IS NULL


SELECT * FROM data_warehouse.dim_vendedor dv
LEFT JOIN data_warehouse.fato_vendas fv
       ON dv.id = fv.id_vendedor;

SELECT * FROM data_warehouse.fato_vendas fv
RIGHT JOIN data_warehouse.dim_vendedor dv
        ON fv.id_vendedor = dv.id


