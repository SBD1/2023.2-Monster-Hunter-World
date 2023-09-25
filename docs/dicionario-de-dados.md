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
