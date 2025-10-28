CREATE DATABASE modelo_PI;

USE modelo_PI;


DROP DATABASE modelo_PI; 

CREATE TABLE login(    #//essa tebela vai esta conectada com a tela login
id_login INT PRIMARY KEY AUTO_INCREMENT,
usuario VARCHAR (25) UNIQUE NOT NULL,
senha VARCHAR(255) NOT NULL,
tipo_usuario ENUM ('ADMIM', 'USER'),
imagem_usuario LONGBLOB,           #// O LONGBLOB SERVE PARA GUARDAR IMAGEM
situacao CHAR(1) NOT NULL DEFAULT 'A');

CREATE TABLE pessoa(                 #// essa tela vai esta conectada com a tela de cadastro de usuario
id_pessoa INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(100)NOT NULL,
cpf VARCHAR(15) NOT NULL,
telefone VARCHAR(20) NOT NULL,
email VARCHAR (45),
situacao CHAR(1)NOT NULL DEFAULT 'A',
id_login INT ,
FOREIGN KEY (id_login) REFERENCES login (id_login));




CREATE TABLE endereco(
id_endereco INT PRIMARY KEY AUTO_INCREMENT,
logradouro VARCHAR (45)NOT NULL,
numero_imovel INT NOT NULL,
complemento VARCHAR(45) NOT NULL,
bairro VARCHAR (20) NOT NULL,
cidade VARCHAR(15) NOT NULL,
uf CHAR(2)NOT NULL,
cep INT NOT NULL,
situacao CHAR(1)  DEFAULT 'A',
id_pessoa INT NOT NULL,
FOREIGN KEY (id_pessoa) REFERENCES pessoa(id_pessoa));






CREATE TABLE funcionario (
id_funcionario INT PRIMARY KEY AUTO_INCREMENT,
matricula INT  NOT NULL,
situacao CHAR(1)  DEFAULT 'A',
id_pessoa INT NOT NULL,
FOREIGN KEY (id_pessoa) REFERENCES pessoa(id_pessoa));



CREATE TABLE cliente(
id_cliente INT PRIMARY KEY AUTO_INCREMENT,
fidelidade INT ,
desconto DECIMAL(10,2) ,
observacao VARCHAR(200),
situacao CHAR(1)  DEFAULT 'A',
id_pessoa INT NOT NULL,
FOREIGN KEY (id_pessoa) REFERENCES pessoa(id_pessoa));

CREATE TABLE mesa(
id_mesa INT PRIMARY KEY AUTO_INCREMENT,
numero INT NOT NULL,
capacidade INT NOT NULL,
qrcode LONGBLOB, 
status_mesa CHAR (1) NOT NULL DEFAULT 'D');

CREATE TABLE forma_pagamento(
id_forma_pagamento INT PRIMARY KEY AUTO_INCREMENT,
denominacao VARCHAR (45)NOT NULL,
prazo INT ,
parcela INT );


CREATE TABLE categoria(
id_categoria INT PRIMARY KEY AUTO_INCREMENT UNIQUE,
denominacao VARCHAR (45) NOT NULL,
situacao CHAR DEFAULT 'A');



CREATE TABLE comanda(
id_comanda INT PRIMARY KEY AUTO_INCREMENT,
data_comanda DATETIME DEFAULT CURRENT_TIMESTAMP,
desconto DECIMAL (10,2),
acrescimo DECIMAL (10,2),
valor_total DECIMAL(10,2) NOT NULL,
status_comanda VARCHAR (45) DEFAUlT 'Em Adamento' COMMENT 'P = Pendente,  C = Cancelado, F = Finalizado',
id_cliente INT NOT NULL DEFAULT '1',
id_funcionario INT NOT NULL,
id_mesa INT NOT NULL,
id_forma_pagamento INT NOT NULL,
FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
FOREIGN KEY (id_funcionario) REFERENCES funcionario(id_funcionario),
FOREIGN KEY (id_mesa) REFERENCES mesa(id_mesa),
FOREIGN KEY (id_forma_pagamento) REFERENCES forma_pagamento(id_forma_pagamento));

CREATE TABLE produto(   #// essa tela vai esta conectada com a tela cadastro de produto
id_produto INT PRIMARY KEY AUTO_INCREMENT,
denominacao VARCHAR (100) NOT NULL,
preco DECIMAL (10,2)  NOT NULL,
imagem_produto LONGBLOB,
situacao CHAR(1) NOT NULL DEFAULT 'A',
id_categoria  INT NOT NULL,
FOREIGN KEY (id_categoria) REFERENCES categoria (id_categoria));





CREATE TABLE pedido(
id_pedido INT PRIMARY KEY AUTO_INCREMENT,
quantidade INT NOT NULL,
preco DECIMAL (10,2),
valor_total DECIMAL (10,2),
status_pedido CHAR(1) NOT NULL DEFAULT 'A' COMMENT 'A = Andamento, E = Entregue, F = Finalizado',
cancelado CHAR(1) NOT NULL DEFAULT 'N',
id_produto INT NOT NULL,
id_comanda INT NOT NULL,
FOREIGN KEY (id_produto) REFERENCES produto(id_produto),
FOREIGN KEY (id_comanda) REFERENCES comanda(id_comanda));









