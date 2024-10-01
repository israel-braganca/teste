SET SQL_SAFE_UPDATES = 0;
CREATE DATABASE RedeTV;
USE RedeTV;

CREATE TABLE canais (id INT PRIMARY KEY, nome VARCHAR(100), tipo TEXT);
CREATE TABLE programas (id INT PRIMARY KEY, titulo VARCHAR(150), categoria TEXT);
CREATE TABLE transmissoes (id INT PRIMARY KEY, canal_id INT, programa_id INT, horario TIME, data DATE, FOREIGN KEY (canal_id) REFERENCES canais(id), FOREIGN KEY (programa_id) REFERENCES programas(id));

INSERT INTO canais (id, nome, tipo) VALUES (1, 'Canal Notícias', 'Notícias'), (2, 'Canal Esportes', 'Esportes'), (3, 'Canal Filmes', 'Entretenimento');
INSERT INTO programas (id, titulo, categoria) VALUES (1, 'Jornal da Manhã', 'Jornal'), (2, 'Campeonato Nacional', 'Esporte'), (3, 'Sessão de Filmes', 'Filme');
INSERT INTO transmissoes (id, canal_id, programa_id, horario, data) VALUES (1, 1, 1, '08:00:00', '2024-09-28'), (2, 2, 2, '16:00:00', '2024-09-28'), (3, 3, 3, '20:00:00', '2024-09-28');

SELECT canais.nome, programas.titulo, transmissoes.horario, transmissoes.data FROM transmissoes INNER JOIN canais ON transmissoes.canal_id = canais.id INNER JOIN programas ON transmissoes.programa_id = programas.id;
SELECT canais.nome, programas.titulo, programas.categoria, transmissoes.horario, transmissoes.data FROM transmissoes INNER JOIN canais ON transmissoes.canal_id = canais.id INNER JOIN programas ON transmissoes.programa_id = programas.id WHERE categoria = "Jornal";
SELECT canais.nome, canais.tipo, programas.titulo, transmissoes.horario, transmissoes.data FROM transmissoes INNER JOIN canais ON transmissoes.canal_id = canais.id INNER JOIN programas ON transmissoes.programa_id = programas.id WHERE tipo = "Entretenimento";
SELECT canais.nome, programas.titulo, canais.tipo, transmissoes.horario, transmissoes.data FROM transmissoes INNER JOIN canais ON transmissoes.canal_id = canais.id INNER JOIN programas ON transmissoes.programa_id = programas.id WHERE tipo = "Esportes";

DROP DATABASE RedeTV;