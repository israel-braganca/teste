SET SQL_SAFE_UPDATES = 0;
CREATE DATABASE LojaMochilas;
USE LojaMochilas;

CREATE TABLE clientes (id INT PRIMARY KEY AUTO_INCREMENT, nome VARCHAR(100), email VARCHAR(100));
CREATE TABLE mochilas (id INT AUTO_INCREMENT PRIMARY KEY, descrição VARCHAR(100), cor VARCHAR(50), preco DECIMAL(10, 2));
CREATE TABLE pedidos (id INT PRIMARY KEY AUTO_INCREMENT, cliente_id INT, mochila_id INT, quantidade INT, data_pedido DATE, FOREIGN KEY(cliente_id) REFERENCES clientes(id), FOREIGN KEY(mochila_id) REFERENCES mochilas(id));

INSERT INTO clientes (nome, email) VALUES ('João Silva', 'joao@gmail.com'), ('Maria Santos', 'maria@gmail.com'), ('Pedro Oliveira', 'pedro@gmail.com');
INSERT INTO mochilas (descrição, cor, preco) VALUES ('Mochila Escolar', 'Azul', 120.00), ('Mochila para Laptop', 'Preta', 200.00), ('Mochila de Viagem', 'Vermelha', 250.00);
INSERT INTO pedidos (cliente_id, mochila_id, quantidade, data_pedido) VALUES (1, 1, 2, '2024-09-25'), (2, 3, 1, '2024-09-26'), (3, 2, 3, '2024-09-27');

SELECT clientes.nome, mochilas.descrição, pedidos.quantidade FROM pedidos INNER JOIN clientes ON pedidos.cliente_id = clientes.id INNER JOIN mochilas ON pedidos.mochila_id = mochilas.id;
SELECT SUM(pedidos.quantidade * mochilas.preco) FROM pedidos INNER JOIN mochilas ON pedidos.mochila_id = mochilas.id;

DROP DATABASE LojaMochilas;