SELECT * FROM produto p
INNER JOIN categoria c ON c.id_categoria = p.id_categoria;




UPDATE produto SET id_categoria = 3 WHERE id_produto IN (2,3,4,5);	



DELIMITER // 
CREATE TRIGGER preco_intens_pedido
BEFORE INSERT  
ON pedido FOR EACH ROW 
BEGIN 
SET NEW.preco = (SELECT preco FROM produto WHERE id_produto = NEW.ID_PRODUTO);
END;
//

DROP TRIGGER itens_comanda;

DELIMITER // 
CREATE TRIGGER valor_totaL_pedido
BEFORE INSERT  
ON pedido FOR EACH ROW 
BEGIN 
SET NEW.valor_total = (NEW.quantidade*NEW.preco);
END;
//

DROP TRIGGER preco_itens_comanda;
DELIMITER //
CREATE TRIGGER preco_itens_comanda
AFTER UPDATE
ON pedido FOR EACH ROW
BEGIN
IF(NEW.cancelado <> OLD.cancelado )THEN
UPDATE comanda SET  valor_total = ( SELECT SUM(valor_total) FROM
pedido WHERE id_comanda = NEW.id_comanda AND cancelado = 'N')
WHERE id_comanda = NEW.id_comanda;
END IF;
END
//	


DELIMITER // 
CREATE TRIGGER recalcula_comanda
AFTER INSERT
ON pedido FOR EACH ROW
BEGIN
UPDATE comanda SET  valor_total = ( SELECT SUM(valor_total) FROM
pedido WHERE id_comanda = NEW.id_comanda AND cancelado = 'N')
WHERE id_comanda = NEW.id_comanda;
END
//	



SELECT SUM(valor_total) FROM pedido WHERE id_comanda = 1 AND cancelado = 'N';






SELECT * FROM login;







