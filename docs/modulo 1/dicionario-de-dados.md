# Dicionário de Dados para o Jogo "Monster Hunter World" 

## Tabela: Mapa
### Descrição: Tabela que armazenará os dados do mapa do game.

| Nome Variável | Descrição                            | Tipo de Dado | Tamanho | Restrições de Domínio |
| :-----------: | :----------------------------------: | :-----: | :----------------: | :-------------------: |
| IdMapa        | Número de identificação do mapa.     | Int     |                   | PK                    |
| nome          | Nome do mapa.                        | Varchar | 64                 | Not null               |
| descricao     | Descrição do mapa.                   | Varchar | 256                 | Not null               |

## Tabela: Regiao
### Descrição: Tabela que armazenará os dados da região.
#### Observações: Essa tabela possui uma chave estrangeira da tabela mapa.


| Nome Variável | Descrição                            | Tipo de Dado | Tamanho | Restrições de Domínio |
| :-----------: | :----------------------------------: | :-----: | :----------------: | :-------------------: |
| IdRegiao      | Número de identificação da região.  | Int     |                   | PK                    |
| Mapa        | Número de identificação do mapa.         | Int     |                 | FK                    |
| Nome          | Nome da região.                      | Varchar | 64                 | Not null               |
| descricao     | Descrição do mapa.                   | Varchar | 256                 | Not null               |


## Tabela: LevaEm
### Descrição: Tabela que armazenará os dados de que região leva até outra região.
#### Observações: Essa tabela possui duas chaves estrangeiras para a tabela região.

| Nome Variável | Descrição                                   | Tipo de Dado | Tamanho | Restrições de Domínio |
| :-----------: | :----------------------------------------: | :----------: | :-----: | :-------------------: |
| RegiaoOrigem        | Região de origem           | Int      |         | PK FK                    |
| RegiaoDestino        | Região de destino        | Int     |                 | PK FK                    |

## Tabela: NPC
### Descrição: Tabela que armazenará os dados do NPC (Personagem Não-Jogavel).
#### Observações: Essa tabela possui uma chave estrangeira da tabela regiao.
| Nome Variável | Descrição                                   | Tipo de Dado | Tamanho | Restrições de Domínio |
| :-----------: | :----------------------------------------: | :----------: | :-----: | :-------------------: |
| IdNPC         | Número de identificação do NPC.            | Int      |         | PK                    |
| Regiao        | Número de identificação da Regiao.         | Int     |                 | FK                    |
| Nome          | Nome do NPC.                      | Varchar | 64                 | Not null               |
| Descricao       | Descricao sobre o npc.   | Varchar  | 256                   | Default              |
| Funcao       | Funcao que o npc exerce.   | Varchar  | 64                   | Default              |
| Raca       | Raça do NPC.   | Varchar  | 32                   | Default              |
| Genero       | Genero do NPC.   | Varchar  | 16                   | Default              |


## Tabela: PC
### Descrição: Tabela que armazenará os dados do PC (Personagem Jogavel).
#### Observações: Essa tabela possui uma chave estrangeira da tabela regiao.
| Nome Variável | Descrição                                   | Tipo de Dado | Tamanho | Restrições de Domínio |
| :-----------: | :----------------------------------------: | :----------: | :-----: | :-------------------: |
| IdPlayer         | Número de identificação do PC.            | Int      |         | PK                    |
| Regiao        | Número de identificação da Regiao.         | Int     |                 | FK                    |
| Nome          | Nome do PC.                      | Varchar | 64                 | Not null               |
| Ranque       | Ranque do PC.   | Int  |                    | Default              |
| Vida       | Pontos de vida do PC.   | Int  |                    | Default              |
| Vigor       | Pontos de vigor do PC.   | Int  |                    | Default              |
| Afinidade   | Tipo de arma de afinidade do PC(Glaive Inseto, Espada dupla, Espadão, etc.).   | Int  |                    | Default              |
| Genero       | Genero do PC.   | Varchar  | 16                   | Default              |
| CorPele       | Cor da pele do PC.   | Varchar  | 16                   | Default              |
| CorCabelo       | Cor do cabelo do PC.   | Varchar  | 16                   | Default              |
| CorOlho       | Cor do olho do PC.   | Varchar  | 16                   | Default              |
| TipoCabelo   | Tipo de cabelo do PC.   | Int  |                    | Default              |
| TipoOlho   | Tipo de Olho do PC.   | Int  |                    | Default              |


## Tabela: Amigato
### Descrição: Tabela que armazenará os dados do Amigato.
#### Observações: Essa tabela possui uma chave estrangeira da tabela regiao e uma em PC.
| Nome Variável | Descrição                                   | Tipo de Dado | Tamanho | Restrições de Domínio |
| :-----------: | :----------------------------------------: | :----------: | :-----: | :-------------------: |
| IdAmigato         | Número de identificação do Amigato.            | Int      |         | PK                    |
| Regiao        | Número de identificação da Regiao.         | Int     |                 | FK                    |
| PC        | Número de identificação do PC.         | Int     |                 | FK                    |
| Nome          | Nome do Amigato.                      | Varchar | 64                 | Not null               |Bigint  |                    | Default              |
| Nivel       | Nivel do Amigato.   | Int  |                    | Default              |
| Status       | Status do Amigato.   | Int  |                    | Default              |
| Vida       | Pontos de vida do Amigato.   | Int  |                    | Default              |


## Tabela: Fala
### Descrição: Tabela que armazenará os dados das falas dos NPC.
#### Observações: Essa tabela possui uma chave estrangeira da tabela NPC.
| Nome Variável | Descrição                                   | Tipo de Dado | Tamanho | Restrições de Domínio |
| :-----------: | :----------------------------------------: | :----------: | :-----: | :-------------------: |
| IdFala         | Número de identificação da Fala.            | Int      |         | PK                    |
| NPC        | Número de identificação do NPC.         | Int     |                 | FK                    |
| Fala       | Texto da fala do npc.   | Varchar  | 256                   | Default              |
| Repetivel       | Se a fala pode ser repetida ou nao.   | Boolean  |                   | Not null/Check              |


## Tabela: FalaPreReq
### Descrição: Tabela que armazenará os dados dos PreRequisitos das falas dos NPC.
#### Observações: Essa tabela possui duas chaves estrangeiras da tabela Fala.
| Nome Variável | Descrição                                   | Tipo de Dado | Tamanho | Restrições de Domínio |
| :-----------: | :----------------------------------------: | :----------: | :-----: | :-------------------: |
| IdFalaPreReq         | Número de identificação do pré-requisito Fala.            | Int      |         | PK                    |
| FalaPreReq        | Número de identificação da fala que é pré-requisito.         | Int     |                 | FK                    |
| Fala        | Número de identificação da fala que tem pré-requisito.         | Int     |                 | FK                    |


## Tabela: Monstro
### Descrição: Tabela que armazenará os dados do Monstro.
| Nome Variável      | Descrição                                                   | Tipo de Dado | Tamanho | Restrições de Domínio       |
|--------------------|-------------------------------------------------------------|--------------|---------|---------------------------|
| IdMonstro           | Número de identificação do Monstro.                          | Int          |         | PK                        |
| Nome                | Nome do Monstro.                                           | Varchar      | 64      | Not Null                  |
| Elemento            | Inteiro correspondente ao elemento do Monstro.              | Int          |         | Default                   |
| AtacaMonstros       | Booleano para saber se o monstro ataca outros monstros.      | Boolean      |         | Not Null, Check           |
| AlcanceHostilidade  | Alcance da hostilidade do Monstro.                           | Int          |         | Default                   |
| Tipo                | Inteiro correspondente ao tipo do Monstro.                   | Int          |         | Default                   |



## Tabela: InstanciaMonstro
### Descrição: Tabela que armazenará os dados da Instancia do Monstro.
#### Observações: Essa tabela possui uma chave estrangeira da tabela Monstro.
| Nome Variável | Descrição                                   | Tipo de Dado | Tamanho | Restrições de Domínio |
| :-----------: | :----------------------------------------: | :----------: | :-----: | :-------------------: |
| IdInstanciaMonstro         | Número de identificação da Instancia do Monstro.            | Int      |         | PK                    |
| Monstro        | Número de identificação do Monstro.         | Int     |                 | FK                    |
| Status       | Status do Monstro (Vivo, Morto, Dormindo).   | Int  |                    | Default              |
| Vida       | Pontos de vida do Monstro.   | Int  |                    | Default              |
| Tamanho      | Tamanho do Monstro.   | Int  |                    | Default              |
| Nivel       | Nivel do Monstro.   | Int  |                    | Default              |
| Ataque       | Pontos de ataque do Monstro.   | Int  |                    | Default              |

## Tabela: RegiaoMonstro
### Descrição: Tabela que armazenará os dados da Regiao onde o monstro vive.
#### Observações: Essa tabela possui uma chave estrangeira da tabela regiao e uma em Monstro.
| Nome Variável | Descrição                                   | Tipo de Dado | Tamanho | Restrições de Domínio |
| :-----------: | :----------------------------------------: | :----------: | :-----: | :-------------------: |
| IdRegiaoMonstro         | Número de identificação da relação região monstro.            | Int      |         | PK                    |
| Regiao        | Número de identificação da Regiao.         | Int     |                 | FK                    |
| Monstro        | Número de identificação do Monstro.         | Int     |                 | FK                    |

## Tabela: AtacaMonstro
### Descrição: Tabela que armazenará os dados dos ataques de um personagem a um monstro.
#### Observações: Essa tabela possui uma chave estrangeira da tabela PC e uma em Monstro.
| Nome Variável | Descrição                                   | Tipo de Dado | Tamanho | Restrições de Domínio |
| :-----------: | :----------------------------------------: | :----------: | :-----: | :-------------------: |
| IdAtacaMonstro         | Número de identificação da relação ataque monstro.            | Int      |         | PK                    |
| PC        | Número de identificação do PC.         | Int     |                 | FK                    |
| Monstro        | Número de identificação do Monstro.         | Int     |                 | FK                    |
| Dano       | Valor do Dano.   | Int  |                    | Default              |
| Horario     | Quando o ataque ocorreu.   | Timestamp  |                    | Default              |

## Tabela: Equipamento
### Descrição: Tabela que armazenará a categoria de cada equipamento.
#### Observações: sem observações.

| Nome Variável | Descrição                                   | Tipo de Dado | Tamanho | Restrições de Domínio |
| :-----------: | :----------------------------------------: | :----------: | :-----: | :-------------------: |
| IdEquipamento        | Número de identificação da Equipamento           | Int      |         | PK                    |
| Categoria       | Número da categoria do equipamento (1 a 4)        | Int     |                 |                 |

## Tabela: UtilizaEquipamento
### Descrição: Tabela que registra equipamento utilizado pelo PC.
#### Observações: essa tabela possui uma chave estrangeira pra tabela equipamentos e uma pra tabela PC.

| Nome Variável     | Descrição                                     | Tipo de Dado | Tamanho | Restrições de Domínio |
| :---------------: | :------------------------------------------: | :----------: | :-----: | :-------------------: |
| IdEquipamento  | Número de identificação do registro do equipamento | Int |         | PK        FK            |
| IdPC     | Número de identificação do player que utiliza o equipamento | Int      |         | PK FK |

## Tabela: GuardaEquipamento
### Descrição: Tabela que registra equipamento equipamentos guardados no inventário.
#### Observações: essa tabela possui uma chave estrangeira pra tabela equipamentos e uma pra tabela Inventario.

| Nome Variável     | Descrição                                     | Tipo de Dado | Tamanho | Restrições de Domínio |
| :---------------: | :------------------------------------------: | :----------: | :-----: | :-------------------: |
| IdEquipamento  | Número de identificação do registro do equipamento | Int |         | PK        FK            |
| IdInventario     | Número de identificação do inventario que guarda o equipamento | Int      |         | PK FK |

## Tabela: CriaEquipamento
### Descrição: Tabela que registra qual forja cria qual equipamento.
#### Observações: essa tabela possui uma chave estrangeira pra tabela equipamentos e uma pra tabela Forja.

| Nome Variável     | Descrição                                     | Tipo de Dado | Tamanho | Restrições de Domínio |
| :---------------: | :------------------------------------------: | :----------: | :-----: | :-------------------: |
| IdEquipamento  | Número de identificação do registro do equipamento | Int |         | PK        FK            |
| IdInventario     | Número de identificação da forja que cria o equipamento. | Int      |         | PK FK |

## Tabela: VendeEquipamento
### Descrição: Tabela que registra qual loja vende qual equipamento.
#### Observações: essa tabela possui uma chave estrangeira pra tabela equipamentos e uma pra tabela Loja.

| Nome Variável     | Descrição                                     | Tipo de Dado | Tamanho | Restrições de Domínio |
| :---------------: | :------------------------------------------: | :----------: | :-----: | :-------------------: |
| IdEquipamento  | Número de identificação do registro do equipamento | Int |         | PK        FK            |
| IdLoja    | Número de identificação da loja que vende o equipamento. | Int      |         | PK FK |

## Tabela: AmigatoEquipamento
### Descrição: Tabela que registra equipamento utilizado por amigato.
#### Observações: essa tabela possui uma chave estrangeira pra tabela equipamentos e uma pra tabela Amigato.

| Nome Variável     | Descrição                                     | Tipo de Dado | Tamanho | Restrições de Domínio |
| :---------------: | :------------------------------------------: | :----------: | :-----: | :-------------------: |
| IdEquipamento  | Número de identificação do registro do equipamento | Int |         | PK        FK            |
| IdAmigato    | Número do amigato que utiliza o equipamento | Int      |         | PK FK |

## Tabela: Missao
### Descrição: Tabela que armazenará os dados das missões.
#### Observações: Essa tabela possui uma chave estrangeira da tabela Mapa e uma em NPC.
| Nome Variável | Descrição                                   | Tipo de Dado | Tamanho | Restrições de Domínio |
| :-----------: | :----------------------------------------: | :----------: | :-----: | :-------------------: |
| IdMissao         | Número de identificação da Missão.            | Int      |         | PK                    |
| Mapa        | Número de identificação do Mapa.         | Int     |                 | FK                    |
| NPC        | Número de identificação do NPC.         | Int     |                 | FK                    |
| Nome       | Nome da Missao.                      | Varchar | 64                 | Not null               |
| Nivel     | Nivel da Missao.   | Int  |                    | Default              |
| Tipo     | Inteiro que representa o tipo da missão (Caça, assassinato, etc).   | Int  |                    | Default              |
| Cliente     | Nome do cliente da missão.   | Varchar | 64                 | Not null               |
| Descricao    | Descrição sobre a missão.   | Varchar  | 256                   | Default              |
| MaximoDesmaios     | Máximo de desmaios que podem ocorrer durante a missão.   | Int  |                    | Default              |
| Tempo     | Tempo em minutos que representa o limite de tempo da missão.   | Int  |                    | Default              |
| Premio     | Valor em dinheiro do premio da missão.   | Int  |                    | Default              |
| Resumo     | Resumo da missão.   | Varchar  |      128              | Default              |
| RanqueMinimo     | Ranque mínimo do personagem para pegar a missão.   | Int  |                    | Default              |


## Tabela: MissaoPreReq
### Descrição: Tabela que armazenará os dados dos pré-requisitos de uma missão.
#### Observações: Essa tabela possui duas chaves estrangeiras na tabela Missao.
| Nome Variável | Descrição                                   | Tipo de Dado | Tamanho | Restrições de Domínio |
| :-----------: | :----------------------------------------: | :----------: | :-----: | :-------------------: |
| IdMissaoPreReq         | Número de identificação da relação de pré-requisito da missão.            | Int      |         | PK                    |
| MissaoPreReq        | Número de identificação da missão que é pré-requisito.         | Int     |                 | FK                    |
| Missao        | Número de identificação da missão que tem pré-requisito.         | Int     |                 | FK                    |



## Tabela: EtapaMissao
### Descrição: Tabela que armazenará os dados das etapas de uma missão.
#### Observações: Essa tabela possui uma chave estrangeira na tabela missao.
| Nome Variável | Descrição                                   | Tipo de Dado | Tamanho | Restrições de Domínio |
| :-----------: | :----------------------------------------: | :----------: | :-----: | :-------------------: |
| IdEtapaMissao         | Número de identificação da Etapa da missão.            | Int      |         | PK                    |
| Missao        | Número de identificação da Missao.         | Int     |                 | FK                    |
| Nome        | Nome da etapa.         | Varchar | 64                 | Not null               |
| Status         | Valor que representa o status da etapa (Concluída, Cancelada, Em andamento).            | Int      |         | Default                    |
| Descricao        | Descrição sobre a etapa da missão.   | Varchar  | 256                   | Default              |


## Tabela: EtapaMonstro
### Descrição: Tabela que armazenará os dados dos monstros a serem mortos em uma etapa da missão.
#### Observações: Essa tabela possui uma chave estrangeira da tabela EtapaMissao e uma em Monstro.
| Nome Variável | Descrição                                   | Tipo de Dado | Tamanho | Restrições de Domínio |
| :-----------: | :----------------------------------------: | :----------: | :-----: | :-------------------: |
| IdEtapaMonstro         | Número de identificação da relação etapa monstro.            | Int      |         | PK                    |
| EtapaMissao        | Número de identificação da Etapa da Missão.         | Int     |                 | FK                    |
| Monstro        | Número de identificação do Monstro.         | Int     |                 | FK                    |
| Quantidade         | Quantidade de monstros a serem mortos.            | Int      |         | Default                    |

## Tabela: EtapaFala
### Descrição: Tabela que armazenará os dados das falas com NPC necessárias para uma missão.
#### Observações: Essa tabela possui uma chave estrangeira da tabela EtapaMissao e uma em Fala.
| Nome Variável | Descrição                                   | Tipo de Dado | Tamanho | Restrições de Domínio |
| :-----------: | :----------------------------------------: | :----------: | :-----: | :-------------------: |
| IdEtapaFala         | Número de identificação da relação etapa fala.            | Int      |         | PK                    |
| EtapaMissao        | Número de identificação da Etapa da Missão.         | Int     |                 | FK                    |
| Fala        | Número de identificação da Fala do NPC.         | Int     |                 | FK                    |

## Tabela: RealizaMissao
### Descrição: Tabela que armazenará os dados da relação entre um personagem e uma missão realizada.
#### Observações: Essa tabela possui uma chave estrangeira da tabela PC e uma em Missao.
| Nome Variável | Descrição                                   | Tipo de Dado | Tamanho | Restrições de Domínio |
| :-----------: | :----------------------------------------: | :----------: | :-----: | :-------------------: |
| IdRealizaMissao         | Número de identificação da relação PC Missao.            | Int      |         | PK                    |
| Missao        | Número de identificação da missao.         | Int     |                 | FK                    |
| PC        | Número de identificação do PC.         | Int     |                 | FK                    |
| Status        | Status da missão(Cancelada, concluida, em andamento).         | Int     |                 | Default                    |

## Tabela: Inventario
### Descrição: Tabela que armazenará os dados do Inventário de um personagem.
#### Observações: Essa tabela possui uma chave estrangeira da tabela PC.
| Nome Variável | Descrição                                   | Tipo de Dado | Tamanho | Restrições de Domínio |
| :-----------: | :----------------------------------------: | :----------: | :-----: | :-------------------: |
| IdInventario         | Número de identificação do Inventário do personagem.            | Int      |         | PK                    |
| PC        | Número de identificação do PC.         | Int     |                 | FK                    |
| CapacidadeMaxima        | Capacidade Máxima do Inventário.         | Int     |                 | Default                    |


## Tabela: Loja
### Descrição: Tabela que armazenará os dados de uma loja do jogo.
#### Observações: Essa tabela possui uma chave estrangeira da tabela NPC.
| Nome Variável | Descrição                                   | Tipo de Dado | Tamanho | Restrições de Domínio |
| :-----------: | :----------------------------------------: | :----------: | :-----: | :-------------------: |
| IdLoja         | Número de identificação da loja.            | Int      |         | PK                    |
| NPC        | Número de identificação do NPC responsável pela loja.         | Int     |                 | FK                    |
| Tipo        | Tipo de loja (Armas, Armadura, Amuleto, etc)         | Int     |                 | Default                    |

## Tabela: Forja
### Descrição: Tabela que armazenará os dados de uma forja do jogo.
#### Observações: Essa tabela possui uma chave estrangeira da tabela NPC.
| Nome Variável | Descrição                                   | Tipo de Dado | Tamanho | Restrições de Domínio |
| :-----------: | :----------------------------------------: | :----------: | :-----: | :-------------------: |
| IdForja         | Número de identificação da forja.            | Int      |         | PK                    |
| NPC        | Número de identificação do NPC responsável pela forja.         | Int     |                 | FK                    |
| Tipo        | Tipo de forja (Armas, Armadura, Amuleto, etc)         | Int     |                 | Default                    |

## Tabela: Item
### Descrição: Tabela que armazenará os dados dos itens do jogo.
| Nome Variável | Descrição                                   | Tipo de Dado | Tamanho | Restrições de Domínio |
| :-----------: | :----------------------------------------: | :----------: | :-----: | :-------------------: |
| IdItem         | Número de identificação do Item.            | Int      |         | PK         FK            |
| Nome        |  Nome do item.         | Varchar | 64                 | Not null               |
| Raridade        | Nível de raridade do item.         | Int     |                 | Default                    |
| Tipo        | Tipo de item (Consumível, Munição, Material).         | Int     |                 | Default                    |
| Funcao        | Função do item.         | Varchar  | 64     | Default                    |
| Descricao        | Descrição do item.   | Varchar  | 256                   | Default              |
| ValorVenda        | Valor da venda do item.         | Int     |                 | Default                    |
| CustoCompra        | Custo da compra do item.         | Int     |                 | Default                    |

## Tabela: DropaItem
### Descrição: Tabela que armazenará os dados dos itens dropados de um monstro.
#### Observações: Essa tabela possui uma chave estrangeira da tabela Item e uma em InstanciaMonstro.
| Nome Variável | Descrição                                   | Tipo de Dado | Tamanho | Restrições de Domínio |
| :-----------: | :----------------------------------------: | :----------: | :-----: | :-------------------: |
| IdDropaItem         | Número de identificação da relação de dropar item.            | Int      |         | PK                    |
| Monstro        | Númer de identificação da instancia do monstro que dropa o item.         | Int     |                 | FK                    |
| Item        | Número de identificação do item que é dropado.         | Int     |                 | FK                    |

## Tabela: UsaItem
### Descrição: Tabela que armazenará os dados dos itens utilizados para forja de equipamentos.
#### Observações: Essa tabela possui uma chave estrangeira da tabela Forja e uma em Item.
| Nome Variável | Descrição                                   | Tipo de Dado | Tamanho | Restrições de Domínio |
| :-----------: | :----------------------------------------: | :----------: | :-----: | :-------------------: |
| IdUsaItem         | Número de identificação da relação de itens usados para forja.            | Int      |         | PK                    |
| Forja        | Número de identificação da forja.         | Int     |                 | FK                    |
| Item        | Número de identificação do Item.         | Int     |                 | FK                    |


## Tabela: Arma
### Descrição: Tabela que armazenará os dados das armas do jogo.
| Nome Variável | Descrição                                   | Tipo de Dado | Tamanho | Restrições de Domínio |
| :-----------: | :----------------------------------------: | :----------: | :-----: | :-------------------: |
| IdArma         | Número de identificação da arma.            | Int      |         | PK                    |
| Nome        |  Nome da arma.         | Varchar | 64                 | Not null               |
| Nivel        | Nível da arma.         | Int     |                 | Default                    |
| Raridade        | Raridade da arma.         | Int     |                 | Default                    |
| CustoCompra        | Custo da compra da arma.         | Int     |                 | Default                    |
| ValorVenda        | Valor da venda da arma.         | Int     |                 | Default                    |
| Descricao        | Descrição da arma.   | Varchar  | 256                   | Default              |
| Tipo        | Tipo de arma (Glaive Inseto, Espada dupla, Espadão, Espada Longa, etc).         | Int     |                 | Default                    |
| Ataque        | Valor do ataque da arma.         | Int     |                 | Default                    |
| Afiacao        | Valor da afiação da arma.         | Int     |                 | Default                    |
| Elemento        | Elemento da arma.         | Varchar     |  32               | Default                    |
| ValorElemento        | Valor do elemento da arma.         | Int     |                 | Default                    |


## Tabela: Armadura
### Descrição: Tabela que armazenará os dados das armaduras do jogo.
| Nome Variável | Descrição                                   | Tipo de Dado | Tamanho | Restrições de Domínio |
| :-----------: | :----------------------------------------: | :----------: | :-----: | :-------------------: |
| IdArmadura         | Número de identificação da armadura.            | Int      |         | PK                    |
| Nome        |  Nome da armadura.         | Varchar | 64                 | Not null               |
| Nivel        | Nível da armadura.         | Int     |                 | Default                    |
| Raridade        | Raridade da armadura.         | Int     |                 | Default                    |
| CustoCompra        | Custo da compra da armadura.         | Int     |                 | Default                    |
| ValorVenda        | Valor da venda da armadura.         | Int     |                 | Default                    |
| Descricao        | Descrição da armadura.   | Varchar  | 256                   | Default              |
| Tipo        | Tipo de Armadura (Cabeça, corpo, pernas, mãos, cabeça do amigato, etc).         | Int     |                 | Default                    |
| Defesa        | Valor da defesa da armadura.         | Int     |                 | Default                    |
| Fogo        | Acrescimo de defesa de fogo a armadura.         | Int     |                 | Default                    |
| Agua        | Acrescimo de defesa de agua a armadura.         | Int     |                 | Default                    |
| Raio        | Acrescimo de defesa de raio a armadura.         | Int     |                 | Default                    |
| Gelo        | Acrescimo de defesa de gelo a armadura.         | Int     |                 | Default                    |
| Dragao        | Acrescimo de defesa de dragão a armadura.         | Int     |                 | Default                    |



## Tabela: Amuleto
### Descrição: Tabela que armazenará os dados dos amuletos do jogo.
| Nome Variável | Descrição                                   | Tipo de Dado | Tamanho | Restrições de Domínio |
| :-----------: | :----------------------------------------: | :----------: | :-----: | :-------------------: |
| IdAmuleto         | Número de identificação do amuleto.            | Int      |         | PK                    |
| Nome        |  Nome do amuleto.         | Varchar | 64                 | Not null               |
| Nivel        | Nível do amuleto.         | Int     |                 | Default                    |
| Raridade        | Raridade do amuleto.         | Int     |                 | Default                    |
| CustoCompra        | Custo da compra do amuleto.         | Int     |                 | Default                    |
| ValorVenda        | Valor da venda do amuleto.         | Int     |                 | Default                    |
| Descricao        | Descrição do amuleto.   | Varchar  | 256                   | Default              |
| Tipo        | Tipo de amuleto (Defesa, Ataque, Vida, etc).         | Int     |                 | Default                    |
| Melhoria        | Número de melhoria do amuleto.         | Int     |                 | Default                    |


## Tabela: Ferramenta
### Descrição: Tabela que armazenará os dados dos ataques de um personagem a um monstro.
| Nome Variável | Descrição                                   | Tipo de Dado | Tamanho | Restrições de Domínio |
| :-----------: | :----------------------------------------: | :----------: | :-----: | :-------------------: |
| IdFerramenta         | Número de identificação da ferramenta.            | Int      |         | PK                    |
| Nome        |  Nome da ferramenta.         | Varchar | 64                 | Not null               |
| Nivel        | Nível da ferramenta.         | Int     |                 | Default                    |
| Raridade        | Raridade da ferramenta.         | Int     |                 | Default                    |
| CustoCompra        | Custo da compra da ferramenta.         | Int     |                 | Default                    |
| ValorVenda        | Valor da venda da ferramenta.         | Int     |                 | Default                    |
| Descricao        | Descrição da ferramenta.   | Varchar  | 256                   | Default              |
| Tipo        | Tipo de ferramenta (manta, reforço de vida, pedra de amolar, etc).         | Int     |                 | Default                    |
| Funcao        | Função da ferramenta.         | Varchar     |  64               | Default                    |
| TempoEfeito        | Tempo de duração do efeito da ferramenta.         | Int     |                 | Default                    |
| TempoRecarga        | Tempo de recarga do efeito da ferramenta.         | Int     |                 | Default                    |


## Tabela: Habilidade
### Descrição: Tabela que armazenará os dados das habilidades do jogo.
| Nome Variável | Descrição                                   | Tipo de Dado | Tamanho | Restrições de Domínio |
| :-----------: | :----------------------------------------: | :----------: | :-----: | :-------------------: |
| IdHabilidade         | Número de identificação da habilidade.            | Int      |         | PK                    |
| Nome        | Nome da habilidade.         | Varchar | 64                 | Not null               |
| Nivel        | Nível da habilidade.         | Int     |                 | Default                    |
| Descricao     |   Descrição da habilidade.   | Varchar  | 256                   | Default              |
| Funcao        | Função da habilidade.         | Varchar     |  64               | Default                    |

## Tabela: HabilidadeAmuleto
### Descrição: Tabela que armazenará os dados das habilidades para um amuleto.
#### Observações: Essa tabela possui uma chave estrangeira da tabela Amuleto e uma em Habilidade.
| Nome Variável | Descrição                                   | Tipo de Dado | Tamanho | Restrições de Domínio |
| :-----------: | :----------------------------------------: | :----------: | :-----: | :-------------------: |
| IdHabilidadeAmuleto         | Número de identificação da relação habilidade amuleto.            | Int      |         | PK                    |
| Amuleto        | Número de identificação do amuleto.         | Int     |                 | FK                    |
| Habilidade        | Número de identificação da habilidade.         | Int     |                 | FK                    |

## Tabela: HabilidadeArmadura
### Descrição: Tabela que armazenará os dados das habilidades para um armadura.
#### Observações: Essa tabela possui uma chave estrangeira da tabela Armadura e uma em Habilidade.
| Nome Variável | Descrição                                   | Tipo de Dado | Tamanho | Restrições de Domínio |
| :-----------: | :----------------------------------------: | :----------: | :-----: | :-------------------: |
| IdHabilidadeArmadura         | Número de identificação da relação habilidade armadura.            | Int      |         | PK                    |
| Armadura        | Número de identificação do armadura.         | Int     |                 | FK                    |
| Habilidade        | Número de identificação da habilidade.         | Int     |                 | FK                    |

