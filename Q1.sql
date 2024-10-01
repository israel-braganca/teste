SET SQL_SAFE_UPDATES = 0;
CREATE DATABASE Plataforma_Streaming;
USE Plataforma_Streaming;

CREATE TABLE usuarios (id INT PRIMARY KEY AUTO_INCREMENT, nome VARCHAR(100), email VARCHAR(100));
CREATE TABLE filmes (id INT AUTO_INCREMENT PRIMARY KEY, titulo VARCHAR(100), genero VARCHAR(50), ano_lancamento INT);
CREATE TABLE avaliacoes (id INT PRIMARY KEY AUTO_INCREMENT, usuario_id INT, filme_id INT, nota INT, comentario TEXT, FOREIGN KEY(usuario_id) REFERENCES Usuarios(id), FOREIGN KEY(filme_id) REFERENCES filmes(id));

INSERT INTO usuarios (nome, email) VALUES ('João Silva', 'joao@gmail.com'), ('Maria Santos', 'maria@gmail.com'), ('Pedro Oliveira', 'pedro@gmail.com');
INSERT INTO filmes (titulo, genero, ano_lancamento) VALUES ('Matrix', 'Ficção Científica', 1999), ('Titanic', 'Romance', 1997), ('Inception', 'Ficção Científica', 2010);
INSERT INTO avaliacoes (usuario_id, filme_id, nota, comentario) VALUES (1, 1, 5, 'Filme excelente, efeitos incríveis!'), (2, 2, 4, 'História emocionante, adorei!'), (3, 3, 5, 'Roteiro complexo e inteligente.');

SELECT usuarios.nome, filmes.titulo, avaliacoes.nota FROM avaliacoes INNER JOIN usuarios ON avaliacoes.usuario_id = usuarios.id INNER JOIN filmes ON avaliacoes.filme_id = filmes.id;
SELECT AVG(nota) FROM avaliacoes;
SELECT usuarios.nome, filmes.titulo, avaliacoes.nota FROM avaliacoes INNER JOIN usuarios ON avaliacoes.usuario_id = usuarios.id INNER JOIN filmes ON avaliacoes.filme_id = filmes.id WHERE nota = 5;

DROP DATABASE Plataforma_Streaming;