-- Informações do PC
SELECT * FROM pc

-- Missões realizadas pelo pc
SELECT M.nome AS NomeMissao
FROM missao M
JOIN realizamissao RM ON M.IdMissao = RM.Missao
JOIN pc P ON RM.PC = P.IdPlayer
WHERE RM.Status = 1;

-- Itens do PC
SELECT I.nome
FROM Item I
JOIN GuardaItem GI ON I.IdItem = GI.Item
JOIN Inventario INV ON INV.IdInventario = GI.Inventario;

-- Armas do PC
SELECT A.nome
FROM Arma A
JOIN GuardaArma GA ON A.IdArma = GA.Arma
JOIN Inventario INV ON INV.IdInventario = GA.Inventario;

-- Armaduras do PC
SELECT AR.nome
FROM Armadura AR
JOIN GuardaArmadura GAR ON AR.IdArmadura = GAR.Armadura
JOIN Inventario INV ON INV.IdInventario = GAR.Inventario;
