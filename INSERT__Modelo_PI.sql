SELECT * FROM pessoa;

INSERT INTO login(usuario, senha)
VALUES ('PAULO', SHA2('12353',512)),
('layanne', SHA2('43424',512));



INSERT INTO pessoa (nome, cpf, telefone, email, id_login)
VALUES('consumidor padrao', '000000000', '0000000000', '00000000',  NULL),
('PAULO', '564378623', '61982150249', 'batistaoliveira798@gmail.com', 1),
('layanne', '55247558947', '61298216345', 'lay@gmail.com', 2);

INSERT INTO endereco(logradouro, numero_imovel, complemento, bairro, cidade, uf, cep, id_pessoa)
VALUES('segundaa avenida', 32, 'sagunda avenida bloco 1620', 'nucleo bandeirante', 'brasilia', 'DF', '717815052',1),
('conjunto 3', 16, 'QR 405', 'samambaia','Brasilia', 'DF', '576298465',  2);

UPDATE login SET senha = SHA2('12353',512) WHERE usuario = 'PAULO';
UPDATE login SET senha = SHA2('43424',512) WHERE usuario = 'layanne';

INSERT INTO funcionario (matricula, id_pessoa)
VALUES('12314544', 1),
('57457439',  2);

INSERT INTO cliente(id_pessoa)
VALUES(1);

INSERT INTO mesa(numero,capacidade)
VALUES(1, 2),
(2, 10),
(3, 8),
(4, 16),
(5, 4);

INSERT INTO categoria(denominacao)
VALUES('Pratos Principais'),
('Petiscos'),
('Sobremesas'),
('Bebidas');




INSERT INTO produto(denominacao, preco, id_categoria)
VALUES('Arroz Feijão Macarrão e Salada', 24.99, 1),
('Espetinho de Carne Bovina', 15.99, 2),
('Espetinho de Frango', 12.76, 2),
('Espetinho de Linguiça Porco', 14.99, 2),
('Espetinho de Linguiça de Frango', 11.50, 2),
('Coca-Cola Lata 300ml', 7.50, 3),
('Pepsi lata 300ml', 5.88, 3),
('Choop 500 ml', 9.99, 3);







 
 INSERT INTO forma_pagamento(denominacao)
 VALUES ('Debito'),
('Pix'),
('Dinheiro'),
('Cartão de Credito');



INSERT INTO comanda(desconto, acrescimo, valor_total, id_cliente, id_mesa, id_funcionario, id_forma_pagamento)
VALUES(0,0,15.99, 1, 1, 1, 1);


INSERT INTO pedido(preco, quantidade, valor_total, id_produto, id_comanda)
VALUES((SELECT preco FROM produto 	WHERE id_produto = 5), 10, (preco*quantidade), 1, 1);



INSERT INTO pedido(quantidade,id_produto,id_comanda)
VALUES(10, 5, 1);

SELECT preco FROM produto 	WHERE id_produto = 2;
 
 
SELECT * FROM login;
SELECT *FROM pessoa;
SELECT * from pedido;
SELECT * FROM categoria;
SELECT * FROM forma_pagamento;
SELECT * from produto;
SELECT * from mesa;
SELECT * FROM cliente;
SELECT * FROM comanda;