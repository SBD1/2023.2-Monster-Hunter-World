# Algebra Relacional

A álgebra relacional é uma linguagem de consulta procedural, ou seja, o usuário especifica quais operações devem ser realizadas sobre os dados e como elas devem ser feitas. A álgebra relacional é composta por um conjunto de operadores que atuam sobre relações e produzem outras relações como resultado. 

## Expressões da álgebra relacional relacionadas às nossas [consultas](#)

Informações do PC
```
σ(IdPlayer = 1)(PC)
```
Missões realizadas pelo PC
```
NomeMissao ← π(nome)(σ(Status = 1 ∧ IdPlayer = 1 (missao ⨝(IdMissao = Missao) (realizamissao ⨝(PC = IdPlayer) pc)))
```
Itens do PC
```
ItemNome ← π(nome)(σ(IdInventario = 1 (Item ⨝(IdItem = Item) (GuardaItem ⨝(Inventario = IdInventario) Inventario)))
```
Armas do PC
```
ArmaNome ← π(nome)(σ(IdInventario = 1 (Arma ⨝(IdArma = Arma) (GuardaArma ⨝(Inventario = IdInventario) Inventario)))
```
Armaduras do PC
```
ArmaduraNome ← π(nome)(σ(IdInventario = 1 (Armadura ⨝(IdArmadura = Armadura) (GuardaArmadura ⨝(Inventario = IdInventario) Inventario)))
```
Listar todas as armaduras de raridade 5 ou superior:
```
Armadura_Raridade_5 = σ(Raridade >= 5)(Armadura)
```
Mostrar todas as lojas que vendem ferramentas de cura:
```
Lojas_Vendem_Cura = π(L.Nome, F.Nome) (σ(F.Funcao = 'Cura')(Loja ⨝ VendeFerramenta ⨝ Ferramenta))
```
Listar todos os amuletos guardados por um jogador específico:
```
Amuletos_Guardados_Jogador = π(A.Nome)(Amuleto ⨝ GuardaAmuleto ⨝ σ(Inventario = 1)(Inventario))
```
Calcular o custo total de todas as ferramentas vendidas por uma loja:
```
Custo_Total_Loja = π(L.Nome, CustoTotal) (Loja ⨝ (π(L.IdLoja, SUM(F.CustoCompra) AS CustoTotal)(VendeFerramenta ⨝ Ferramenta))
```
Listar as habilidades associadas a uma armadura específica:
```
Habilidades_Armadura_1 = π(H.Nome)(Habilidade ⨝ HabilidadeArmadura ⨝ σ(Armadura = 1)(Armadura))
```