## Expressões da álgebra relacional relacionadas às nossas [consultas](./DQL.sql)

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
