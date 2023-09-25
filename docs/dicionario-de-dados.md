# Dicionário de Dados para o Jogo "Spider-Man: Miles Morales" 

## Tabela: Mapa
### Descrição: Tabela que armazenará os dados do mapa do game.

| Nome Variável | Descrição                            | Tipo de Dado | Tamanho | Restrições de Domínio |
| :-----------: | :----------------------------------: | :-----: | :----------------: | :-------------------: |
| idMapa        | Número de identificação do mapa.     | Int     | 4                  | PK                    |
| nome          | Nome do mapa.                        | Varchar | 20                 | Default               |
| tamanho       | Tamanho do mapa.                     | Bigint  |                    | Default               |
| descricao     | Descrição do mapa.                   | Varchar | 50                 | Default               |

## Tabela: Bairro
### Descrição: Tabela que armazenará as informações dos bairros do mapa.
#### Observações: Essa tabela possui uma chave estrangeira da tabela mapa.

| Nome Variável | Descrição                        | Tipo de Dado    | Tamanho | Restrições de Domínio |
| :-----------: | :--------------------------------------: | :-----: | :----------------: | :-------------------: |
| idBairro      | Número de identificação do bairro.       | Int     | 4                  | PK                    |
| idMapa        | Número de identificação do mapa.         | Int     | 4                  | FK                    |
| nome          | Nome do bairro.                          | Varchar | 20                 | Not null              |
| tamanho       | Tamanho do bairro.                       | Bigint  |                    | Default               |
| clima         | Clima do bairro.                         | Varchar | 10                 | -                     |

## Tabela: Local
### Descrição: Tabela que armazenará as informações dos locais dos bairros.
#### Observações: Essa tabela possui uma chave estrangeira da tabela bairro.

| Nome Variável | Descrição                          | Tipo de Dado    | Tamanho | Restrições de Domínio |
| :-----------: | :----------------------------------------: | :-----: | :----------------: | :-------------------: |
| idLocal       | Número de identificação do local.           | Int    | 4                  | PK                  |
| idBairro      | Número de identificação do bairro em que o local está. | Int    | 4       | FK|
| nome          | Nome do local.                             | Varchar | 20                 | Not Null              |
| tamanho       | Função do local.                           | Varchar | 30                 | -                     |

## Tabela: conectaLocal
### Descrição: Tabela que armazenará os dados do autorelacionamento da tabela Local.
#### Observações: Essa tabela possui duas chaves estrangeiras da tabela local.

| Nome Variável    | Descrição                                         | Tipo de Dado | Tamanho | Restrições de Domínio |
| :--------------: | :-----------------------------------------------: | :----------: | :-----: | :-------------------:|
| idConectaLocal   | Número de identificação da conexão entre o local de origem e local de destino.  | Int          | 4       | PK                    |
| idLocalOrigem    | Número de identificação do local de origem.       | Int          | 4       | FK                    |
| idLocalDestino   | Número de identificação do local de destino.      | Int          | 4       | FK                    |

## Tabela: Personagem
### Descrição: Tabela que armazenará as informações dos personagens.

|Nome Variável|Descrição|Tipo de Dado|Tamanho|Restrições de Dominío|
|:-:|:-:|:-:|:-:|:-:|
|idPersonagem|Número de identificação do personagem.|Int|4|PK|
|categoria|Categoria do personagem (pode ser PC ou NPC)|Varchar|20|Not null|

## Tabela: PC (Player Character)
### Descrição: Tabela que armazenará as informações dos pc's.
#### Observações: Essa tabela possui duas chaves estrangeiras, uma de tabela Personagem e a outra da tabela Local.

|Nome Variável|Descrição|Tipo de Dado|Tamanho|Restrições de Dominío|
|:-:|:-:|:-:|:-:|:-:|
|idPc|Número de identificação do npc.|Int|4|PK|
|idPersonagem|Número de identificação do personagem.|Int|4|FK|
|idLocal|Número de identificação do local em que o PC se encontra.|Int|4|FK|
|nome|Nome do PC.|Varchar|20|Not null|
|identidadeSecreta|Identidade secreta do PC.|Varchar|20|-|
|idade|Idade do PC.|Int|4|-|
|especie|Espécie do PC.|Varchar|20|Not null|
|vida||Int|4|Default|

## Tabela: Npc (Non Playable Character)
### Descrição: Tabela que armazenará as informações dos npc's.
#### Observações: Essa tabela possui duas chaves estrangeiras, uma da tabela Personagem e a outra da tabela Local.

|Nome Variável|Descrição|Tipo de Dado|Tamanho|Restrições de Dominío|
|:-:|:-:|:-:|:-:|:-:|
|idNpc|Número de identificação do NPC.|Int|4|PK|
|idPersonagem|Número de identificação do personagem|Int|4|FK|
|idLocal|Número de identificação do local em que o NPC se encontra.|Int|4|FK|
|nome|Nome do NPC.|Varchar|20|Not null|
|especie|Espécie do NPC.|Varchar|20|Not null|
|vida|Vida do NPC no contexto do game.|Int|4|Default|
|motivacao|Motivação do NPC no contexto do game|Varchar|50|-|
|e_Inimigo|Variável a que diz se o NPC é inimigo ou não dp PC.|Boolean|1|Not null/Check|

## Tabela: Traje
### Descrição: Tabela que armazenará as informações dos trajes.
#### Observações: Essa tabela possui uma chave estrangeira da tabela PC.

|Nome Variável|Descrição|Tipo de Dado|Tamanho|Restrições de Dominío|
|:-:|:-:|:-:|:-:|:-:|
|idTraje|Número doe identificação do traje.|Int|4|PK|
|idPC|Número de identificação do player character (PC)|Int|4|FK|
|nome|Nome do traje.|Varchar|20|Not null|
|descricao|Descrição do traje.|Varchar|50|Not null|
|habilidadeAprimorada|Qual habilidade será aprimorada com o traje em questão.|Varchar|20|Not null/Check|

## Tabela: Habilidade
### Descrição: Tabela que armazenará as informações das habilidades.

|Nome Variável|Descrição|Tipo de Dado|Tamanho|Restrições de Dominío|
|:-:|:-:|:-:|:-:|:-:|
|idHabilidade|Número de identificação da habilidade.|Int|4|PK|
|nome|Nome da habilidade.|Varchar|20|Not null|
|descricao|Descrição da habilidade.|Varchar|50|Not null|
|dano|Dano causado pela habilidade|Int|4|Not null/Check|

## Tabela: HabilidadeNPC
### Descrição: Tabela que armazenará  as informações das habilidades dos NPC's.
#### Observações: Essa tabela possui duas chaves estrangeiras, uma da tabela NPC e a outra da tabela Habilidade.

|:-:|:-:|:-:|:-:|:-:|
|Nome Variável|Descrição|Tipo de Dado|Tamanho|Restrições de Dominío|
|idHabilidadeNPC|Número de identificação da habilidade do NPC.|Int|4|PK|
|idNPC|Número de identificação do NPC.|Int|4|FK|
|idHabilidade|Número de identificação da habilidade.|Int|4|FK|

## Tabela: HabilidadePC
### Descrição: Tabela que armazenará as informações das habilidades dos PC's.
#### Obervações: Essa tabela possui três chaves estrangeiraw, uma da tabela PC, uma da tabela Traje e a outra da tabela Habilidade.

|:-:|:-:|:-:|:-:|:-:|
|Nome Variável|Descrição|Tipo de Dado|Tamanho|Restrições de Dominío|
|idHabilidadePC|Número de identificação da habilidade do PC.|Int|4|PK|
|idPC|Número de identificação do PC.|Int|4|FK|
|idHabilidade|Número de identificação da habilidade.|Int|4|FK|
|idTraje|Número de identificação do Traje do PC.|Int|4|FK|

## Tabela: Missão
### Descrição: Tabela que armazenará as informações das missões dos PC's e NPC's.
#### Observações: Essa tabela possui duas chaves estrangeiras, uma da tabela NPC e a outra da tabela PC.

|Nome Variável|Descrição|Tipo de Dado|Tamanho|Restrições de Dominío|
|:-:|:-:|:-:|:-:|:-:|
|idMissao|Número de identificação da missão.|Int|4|PK|
|idNPC|Número de identificação do NPC (non playable character).|Int|4|FK|
|idPC|Número de identificação do PC (player character).|Int|4|FK|
|nome|Nome da missão.|Varchar|20|Not null|
|descricao|Descrição da missão.|Varchar|50|Not null|
|recompensa|Recompensa da missão.|Varchar|20|-|
|status|Status da missão.|Varchar|20|-|

## Tabela: Colecionável
### Descrição: Tabela que armazenará os colecionáveis do PC
#### Observações: Essa tabela possui duas chaves estrangeiras, uma da tabela PC e a outra da tabela Traje.

|:-:|:-:|:-:|:-:|:-:|
|Nome Variável|Descrição|Tipo de Dado|Tamanho|Restrições de Dominío|
|idColecionavel|Número de identificação do colecionável|Int|4|PK|
|idPC|Número de identificação do PC (player character).|Int|4|FK|
|idTraje|Número de identificação do traje.|Int|4|FK|
|nome|Nome do colecionável.|Varchar|20|Not null|
|tipo|Tipo do colecionável.|Varchar|20|Not null|
|funcao|Função do colecionável.|Varchar|20|Not null|

## Tabela: Fase
### Descrição: Tabela que armazenará as informações das fases do game.
#### Observações: Essa tabela possui duas chaves estrangeiras, uma de tabela Missão e a outra da tabela PC.

|Nome Variável|Descrição|Tipo de Dado|Tamanho|Restrições de Dominío|
|:-:|:-:|:-:|:-:|:-:|
|idFase|Número de identificação do colecionável.|Int|4|PK|
|idPC|Número de identificação do PC (player character).|Int|4|FK|
|objetivo|Objetivo da fase, referenciado na descrição da missão.|Varchar|30|FK|
|nome|Nome da fase.|Varchar|20|Not null|
|descricao|Descrição da fase.|Varchar|30|Not full|
|status|Status da fase.|Varchar|20|-|
