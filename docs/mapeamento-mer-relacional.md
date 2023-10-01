
# Modelo Entidade-Relacionamento para o Jogo "Spider-Man: Miles Morales"
Este documento descreve o modelo entidade-relacionamento (MER) elaborado para o jogo "Spider-Man: Miles Morales", que servirá como base para nosso trabalho na disciplina de Sistemas de Banco de Dados 1. O objetivo é demonstrar as tabelas e suas conexões no banco de dados através de um diagrama facilitar a manutenção e  o gerenciamento dos dados relacionados.

## Modelo Entidade-Relacionamento
![MER](https://github.com/SBD1/2023.2-Monster-Hunter-World/blob/main/docs/imagens/MER.png?raw=true)
<font size="3"><p style="text-align: center">Fonte: Autores.</p></font>

## Descrição das tabelas

1. **Mapa**:
   - Descreve a representação gráfica da cidade de Nova York no contexto do jogo, incluindo seus diferentes bairros e locais.

2. **Bairro**:
   - Representa uma subdivisão da cidade de Nova York no jogo, cada uma com características únicas e missões específicas.

3. **Local**:
   - Refere-se a um ponto específico dentro de um bairro ou área do jogo, onde atividades, missões ou eventos podem ocorrer.

3. **Conecta Local**:
   - Refere-se a conexão entre um local e outro para que o usuário possa se mover entre um local de origem e um de destino.

4. **Personagem**:
   - Engloba os protagonistas jogáveis e outros personagens interativos do jogo, como Miles Morales (o Homem-Aranha) e outros heróis ou aliados.

5. **PC (Personagem Controlado)**:
   - Indica personagens controlados diretamente pelo jogador, como Miles Morales (o Homem-Aranha), cujas ações e decisões são influenciadas pelo jogador.

6. **NPC (Personagem Não Controlado)**:
   - Refere-se a personagens não controlados pelo jogador, como habitantes da cidade, inimigos ou aliados.

7. **Missão**:
   - Representa uma tarefa ou objetivo que o jogador deve realizar durante o jogo, muitas vezes associada a uma batalha contra um inimigo.

9. **Traje**:
   - Representa as diferentes roupas ou trajes que o personagem pode usar, cada um podendo oferecer habilidades ao jogador.

10. **Colecionável**:
    - Refere-se a itens colecionáveis no jogo, como tokens, cartões ou outros objetos espalhados pelo ambiente, cada um associado ao desbloqueio de um traje.

11. **Habilidade**:
    - Engloba as ações ou capacidades especiais que o personagem pode adquirir ou aprimorar ao longo do jogo, proporcionando vantagens em combate.

11. **Habilidade PC**:
    - Refere-se a associação entre uma habilidade e um personagem controlável, onde esta também está associada a um traje.

11. **Habilidade NPC**:
    - Refere-se a associação entre uma habilidade e um personagem não controlável.

12. **Fase**:
    - Diz respeito às fases que o PC deve realizar durante o jogo para conseguir vencer.

