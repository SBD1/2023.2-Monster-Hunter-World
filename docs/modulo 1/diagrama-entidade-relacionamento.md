# Diagrama de Entidade-Relacionamento para o Jogo "Monster Hunter World"
Este documento descreve o diagrama de entidade-relacionamento (DER) elaborado para o jogo "Monster Hunter World", que servirá como base para nosso trabalho na disciplina de Sistemas de Banco de Dados 1. O objetivo é modelar as entidades e suas relações no contexto do jogo para facilitar o armazenamento e gerenciamento dos dados relacionados.

## Diagrama Entidade Relacionamento

Na figura 1, é possível ver a primeira versão do Diagrama Entidade Relacionamento. Para visualizar a imagem em alta resolução, clique [aqui](https://raw.githubusercontent.com/SBD1/2023.2-Monster-Hunter-World/main/docs/imagens/DER.png).

<font size="3"><p style="text-align: center">Figura 1: Diagrama entidade relacionamento - versão 1.</p></font>

![DER](https://github.com/SBD1/2023.2-Monster-Hunter-World/blob/main/docs/imagens/DER.png?raw=true)

<font size="3"><p style="text-align: center">Fonte: Autores.</p></font>

Na figura 2, é possível ver a segunda versão do Diagrama Entidade Relacionamento. Para visualizar a imagem em alta resolução, clique [aqui](https://raw.githubusercontent.com/SBD1/2023.2-Monster-Hunter-World/main/docs/imagens/DER_MonsterHunter_V2.png).

<font size="3"><p style="text-align: center">Figura 2: Diagrama entidade relacionamento - versão 2.</p></font>

![DER2](https://github.com/SBD1/2023.2-Monster-Hunter-World/blob/main/docs/imagens/DER_MonsterHunter_V2.png?raw=true)

Na figura 3, é possível ver a terceira e última versão do Diagrama Entidade Relacionamento. Para visualizar a imagem em alta resolução, clique [aqui](https://raw.githubusercontent.com/SBD1/2023.2-Monster-Hunter-World/main/docs/imagens/DER_MonsterHunter_V3.png).

<font size="3"><p style="text-align: center">Figura 3: Diagrama entidade relacionamento - versão 3.</p></font>

![DER3](https://github.com/SBD1/2023.2-Monster-Hunter-World/blob/main/docs/imagens/DER_MonsterHunter_V3.png?raw=true)

<font size="3"><p style="text-align: center">Fonte: Autores.</p></font>
## Entidades e Relacionamentos

### Mapa

- *Descrição:* Um local jogável onde as missões ocorrem.
- *Relacionamentos:* Possui regiões; as missões ocorrem no mapa.

### Região

- *Descrição:* Uma parte distinta de um mapa com características específicas.
- *Relacionamentos:* Está em um mapa; possui NPCs e Amigato; o NPC está em uma região.

### Amigato

- *Descrição:* Um companheiro controlado pelo jogo ou jogador para auxiliar na caça.
- *Relacionamentos:* Está em uma região; o PC possui um Amigato; utiliza equipamento.

### PC (Personagem Jogável)

- *Descrição:* O personagem controlado pelo jogador.
- *Relacionamentos:* Está em uma região; possui Amigato e Inventário; realiza missões.

### NPC (Personagem Não Jogável)

- *Descrição:* Personagens controlados pelo jogo, não controlados pelo jogador.
- *Relacionamentos:* Está em uma região; possui loja e forja; dá missões.

### Equipamento

- *Descrição:* Itens que o PC e o Amigato podem usar para a caça.
- *Relacionamentos:* É guardado no inventário; criado na forja; vendido na loja; usado pelo Amigato.

### Arma (Tipo de Equipamento)

- *Descrição:* Equipamento usado para atacar monstros.
- *Relacionamentos:* É um tipo de equipamento.

### Armadura (Tipo de Equipamento)

- *Descrição:* Equipamento usado para proteger o PC contra danos dos monstros.
- *Relacionamentos:* É um tipo de equipamento.

### Amuleto (Tipo de Equipamento)

- *Descrição:* Equipamento que confere habilidades ao PC.
- *Relacionamentos:* É um tipo de equipamento; possui habilidades.

### Ferramenta (Tipo de Equipamento)

- *Descrição:* Equipamento especial usado para várias funções durante a caça.
- *Relacionamentos:* É um tipo de equipamento.

### Habilidade

- *Descrição:* Habilidades especiais que podem ser conferidas pelo amuleto ou armadura.
- *Relacionamentos:* É possuído pela armadura e amuleto.

### Itens

- *Descrição:* Diversos objetos úteis no jogo, como poções e armadilhas.
- *Relacionamentos:* São guardados no inventário; usados para criar equipamento na forja; dropados pela instância do monstro.

### Inventário

- *Descrição:* Espaço onde o PC guarda equipamentos e itens.
- *Relacionamentos:* Guarda equipamentos e itens.

### Loja

- *Descrição:* Local onde os jogadores podem comprar equipamentos.
- *Relacionamentos:* Possuída pelo NPC; vende equipamento.

### Forja

- *Descrição:* Local onde os jogadores podem criar equipamentos.
- *Relacionamentos:* Possuída pelo NPC; cria equipamento; usa itens.

### Fala

- *Descrição:* Diálogos entre personagens.
- *Relacionamentos:* É pré-requisito para etapas da missão.

### Monstro

- *Descrição:* Criaturas que os jogadores caçam no jogo.
- *Relacionamentos:* Possui instância do monstro; é um pré-requisito para etapas da missão.

### Missão

- *Descrição:* Tarefas ou objetivos que os jogadores devem completar.
- *Relacionamentos:* Ocorre em um mapa; possui etapas da missão; é dado pelo NPC; é um pré-requisito para outras missões.

### EtapaMissão

- *Descrição:* Parte de uma missão que precisa ser completada.
- *Relacionamentos:* Precisa de uma fala e de um monstro.

### InstanciaMonstro

- *Descrição:* Versão específica de um monstro encontrada durante uma missão.
- *Relacionamentos:* Dropa itens.

    

    
