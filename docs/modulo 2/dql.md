# Data Query Language

## Introdução

Data Query Language (DQL) é uma categoria de comandos em sistemas de gerenciamento de banco de dados (SGBD) que se concentra na recuperação e consulta de dados armazenados em um banco de dados. A DQL é usada para extrair informações específicas de uma ou mais tabelas, permitindo que os usuários ou aplicativos pesquisem e recuperem dados com base em critérios específicos. 

## DQL - Monster Hunter World

Nesta etapa do nosso projeto, apresentamos algumas consultas que serão úteis e constantemente utilizadas em nosso jogo, o código SQL das consultas está disponível abaixo:

```
-- Informações do PC
SELECT * FROM pc
WHERE IdPlayer = 1; -- Aqui a gente substitui pelo id do player desejado.

-- Missões realizadas pelo pc
SELECT M.nome AS NomeMissao
FROM missao M
JOIN realizamissao RM ON M.IdMissao = RM.Missao
JOIN pc P ON RM.PC = P.IdPlayer
WHERE RM.Status = 1 AND P.IdPlayer = 1; -- Aqui a gente substitui pelo id do player desejado.

-- Itens do PC
SELECT I.nome
FROM Item I
JOIN GuardaItem GI ON I.IdItem = GI.Item
JOIN Inventario INV ON INV.IdInventario = GI.Inventario
WHERE INV.IdInventario = 1; -- Aqui a gente substitui pelo id do inventario do player desejado.

-- Armas do PC
SELECT A.nome
FROM Arma A
JOIN GuardaArma GA ON A.IdArma = GA.Arma
JOIN Inventario INV ON INV.IdInventario = GA.Inventario
WHERE INV.IdInventario = 1; -- Aqui a gente substitui pelo id do inventario do player desejado.

-- Armaduras do PC
SELECT AR.nome
FROM Armadura AR
JOIN GuardaArmadura GAR ON AR.IdArmadura = GAR.Armadura
JOIN Inventario INV ON INV.IdInventario = GAR.Inventario
WHERE INV.IdInventario = 1; -- Aqui a gente substitui pelo id do inventario do player desejado.

-- Armaduras que tem raridade maior ou igual a 5
SELECT *
FROM Armadura
WHERE Raridade >= 5;

-- Todas as lojas que vendem ferramentas de cura (pode ser reutilizado pra outras fuinções):
SELECT L.Nome AS NomeLoja, F.Nome AS NomeFerramenta
FROM Loja AS L
JOIN VendeFerramenta AS VF ON L.IdLoja = VF.Loja
JOIN Ferramenta AS F ON VF.Ferramenta = F.IdFerramenta
WHERE F.Funcao = 'Cura';

-- Listar todos os amuletos guardados por um jogador específico:
SELECT A.Nome AS NomeAmuleto
FROM Amuleto AS A
JOIN GuardaAmuleto AS GA ON A.IdAmuleto = GA.Amuleto
WHERE GA.Inventario = 1; -- Aqui a gente substitui pelo id do player desejado.

-- Calcular o custo total de todas as ferramentas vendidas por uma loja:
SELECT L.Nome AS NomeLoja, SUM(F.CustoCompra) AS CustoTotal
FROM Loja AS L
JOIN VendeFerramenta AS VF ON L.IdLoja = VF.Loja
JOIN Ferramenta AS F ON VF.Ferramenta = F.IdFerramenta
GROUP BY L.Nome;

-- Listar as habilidades associadas a uma armadura específica:
SELECT H.Nome AS NomeHabilidade
FROM Habilidade AS H
JOIN HabilidadeArmadura AS HA ON H.IdHabilidade = HA.Habilidade
WHERE HA.Armadura = 1; -- Aqui a gente substitui pelo id da armadura desejada.
```
