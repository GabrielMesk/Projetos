CREATE DATABASE biblioteca

CREATE TABLE autores (
    id_autor SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    nacionalidade VARCHAR(50)
);

CREATE TABLE livros (
    id_livro SERIAL PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    categoria VARCHAR(50),
    preco DECIMAL(8,2),
    id_autor INT,
    FOREIGN KEY (id_autor) REFERENCES autores(id_autor)
);


-- INSERINDO VALORES
INSERT INTO autores (nome, nacionalidade)
VALUES
('Machado de Assis', 'Brasileiro'),
('J. K. Rowling', 'Britânica'),
('George Orwell', 'Britânico');


-- INSERINDO VALORES
INSERT INTO livros (titulo, categoria, preco, id_autor)
VALUES
('Dom Casmurro', 'Romance', 45.90, 1),
('Memórias Póstumas', 'Romance', 39.90, 1),
('Harry Potter e a Pedra Filosofal', 'Fantasia', 79.90, 2),
('1984', 'Ficção', 59.90, 3),
('A Revolução dos Bichos', 'Ficção', 42.00, 3);


-- TODAS AS COLUNAS DA TABELA
SELECT *
FROM livros;

-- Categorias sem repetição
SELECT DISTINCT categoria
FROM livros;


-- Livros acima de R$ 50
SELECT titulo, preco
FROM livros
WHERE preco > 50;


-- Livro e seu respectivo autor
SELECT
    livros.titulo,
    autores.nome AS autor
FROM livros
INNER JOIN autores
ON livros.id_autor = autores.id_autor;


-- Autores com mais de um livro
SELECT
    autores.nome,
    COUNT(livros.id_livro) AS quantidade_livros
FROM autores
INNER JOIN livros
ON autores.id_autor = livros.id_autor
GROUP BY autores.nome
HAVING COUNT(livros.id_livro) > 1;


-- Livros do mais caro para o mais barato
SELECT titulo, preco
FROM livros
ORDER BY preco DESC;