SET SQL_SAFE_UPDATES = 0;
CREATE DATABASE LojaMarketing;
USE LojaMarketing;

CREATE TABLE clientes(id INT PRIMARY KEY, nome VARCHAR(150), email VARCHAR(100));
CREATE TABLE servicos (id INT PRIMARY KEY, nome_servico VARCHAR(100), preco DECIMAL(10, 2));
CREATE TABLE campanhas (id INT PRIMARY KEY, cliente_id INT, servico_id INT, data_inicio DATE, data_fim DATE, FOREIGN KEY(cliente_id) REFERENCES clientes(id), FOREIGN KEY(servico_id) REFERENCES servicos(id));

INSERT INTO clientes (id, nome, email) VALUES (1, 'Empresa A', 'contato@empresaA.com'), (2, 'Empresa B', 'contato@empresaB.com'), (3, 'Empresa C', 'contato@empresaC.com');
INSERT INTO servicos (id, nome_servico, preco) VALUES (1, 'SEO', 500.00), (2, 'Design Gráfico', 750.00), (3, 'Publicidade Paga', 1000.00);
INSERT INTO campanhas (id, cliente_id, servico_id, data_inicio, data_fim) VALUES (1, 1, 1, '2024-09-01', '2024-10-01'), (2, 2, 2, '2024-09-05', '2024-10-05'), (3, 3, 3, '2024-09-10', '2024-10-10');

SELECT clientes.nome, servicos.nome_servico, campanhas.data_inicio, campanhas.data_fim FROM campanhas INNER JOIN clientes ON campanhas.cliente_id = clientes.id INNER JOIN servicos ON campanhas.servico_id = servicos.id;
SELECT clientes.nome, servicos.nome_servico, campanhas.data_inicio, campanhas.data_fim FROM campanhas INNER JOIN clientes ON campanhas.cliente_id = clientes.id INNER JOIN servicos ON campanhas.servico_id = servicos.id WHERE nome_servico = 'SEO';
SELECT clientes.nome, servicos.nome_servico, campanhas.data_inicio, campanhas.data_fim FROM campanhas INNER JOIN clientes ON campanhas.cliente_id = clientes.id INNER JOIN servicos ON campanhas.servico_id = servicos.id WHERE data_inicio >= 20240901;

DROP DATABASE LojaMarketing;