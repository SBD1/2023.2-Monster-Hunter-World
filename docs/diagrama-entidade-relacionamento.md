# Diagrama de Entidade-Relacionamento para o Jogo "Spider-Man: Miles Morales"
Este documento descreve o diagrama de entidade-relacionamento (DER) elaborado para o jogo "Spider-Man: Miles Morales", que servirá como base para nosso trabalho na disciplina de Sistemas de Banco de Dados 1. O objetivo é modelar as entidades e suas relações no contexto do jogo para facilitar o armazenamento e gerenciamento dos dados relacionados.

## Diagrama Entidade Relacionamento
![der](https://github.com/SBD1/2023.2-Spider-Man-Miles-Morales/blob/main/docs/imagens/DIAGRAMA-ENTIDADE-RELACIONAMENTO.drawio%20(2).png?raw=true)
<font size="3"><p style="text-align: center">Fonte: Autores.</p></font>

## Descrição das Entidades

1. **Mapa**:
   - Descreve a representação gráfica da cidade de Nova York no contexto do jogo, incluindo seus diferentes bairros e locais.

2. **Bairro**:
   - Representa uma subdivisão da cidade de Nova York no jogo, cada uma com características únicas e missões específicas.

3. **Local**:
   - Refere-se a um ponto específico dentro de um bairro ou área do jogo, onde atividades, missões ou eventos podem ocorrer.

4. **Personagem**:
   - Engloba os protagonistas jogáveis e outros personagens interativos do jogo, como Miles Morales (o Homem-Aranha) e outros heróis ou aliados.

5. **PC (Personagem Controlado)**:
   - Indica personagens controlados diretamente pelo jogador, como Miles Morales (o Homem-Aranha), cujas ações e decisões são influenciadas pelo jogador.

6. **NPC (Personagem Não Controlado)**:
   - Refere-se a personagens não controlados pelo jogador, como habitantes da cidade, inimigos ou aliados.

7. **Missão**:
   - Representa uma tarefa ou objetivo que o jogador deve realizar durante o jogo, muitas vezes associada a uma batalha contra um inimigo.

8. **Mochila**:
   - Descreve os itens ou componentes que o personagem pode carregar consigo durante o jogo, como trajes e itens colecionáveis.

9. **Traje**:
   - Representa as diferentes roupas ou trajes que o personagem pode usar, cada um podendo oferecer habilidades ao jogador.

10. **Colecionável**:
    - Refere-se a itens colecionáveis no jogo, como tokens, cartões ou outros objetos espalhados pelo ambiente, cada um associado ao desbloqueio de um traje.

11. **Habilidade**:
    - Engloba as ações ou capacidades especiais que o personagem pode adquirir ou aprimorar ao longo do jogo, proporcionando vantagens em combate.

12. **Fase**:
    - Diz respeito às fases que o PC deve realizar durante o jogo para conseguir vencer.

## Relacionamentos

- **Mapa (possui) Bairro**:
  - Indica que um mapa possui vários bairros, fornecendo uma relação de propriedade entre essas entidades.

- **Bairro (possui) Local**:
  - Estabelece a relação de propriedade entre um bairro e vários locais dentro dele.

- **Local (leva_em) Local**:
  - Representa a conexão entre diferentes locais, indicando a possibilidade de se mover de um local para outro.

- **Local (possui) Personagem**:
  - Reflete a relação entre um local e os personagens que estão presentes nele.

- **Personagem (é) PC**:
  - Indica que um personagem é controlado diretamente pelo jogador, sendo o protagonista jogável.

- **Personagem (é) NPC**:
  - Representa que um personagem é não controlado diretamente pelo jogador, sendo controlado pela inteligência artificial ou parte da narrativa.

- **PC (enfrenta) NPC**:
  - Descreve a relação de enfrentamento entre o personagem controlado pelo jogador e personagens não controlados.

- **PC (possui) Mochila**:
  - Estabelece a posse de uma mochila pelo personagem controlado pelo jogador.

- **Mochila (guarda) Traje**:
  - Demonstra que uma mochila pode guardar diferentes trajes que o personagem pode usar.

- **Mochila (guarda) Colecionável**:
  - Indica que a mochila pode armazenar itens colecionáveis encontrados no jogo.

- **Colecionável (libera) Traje**:
  - Reflete que a coleta de determinados itens colecionáveis pode desbloquear novos trajes para o personagem.

- **Traje (libera) Habilidade**:
  - Mostra a relação entre um traje adquirido e as habilidades específicas que ele pode proporcionar ao personagem.

- **PC (ganha) Habilidade**:
  - Indica que o PC ganhou uma habilidade através de um traje.
  - 
- **NPC (possui) Habilidade**:
  - Indica que o NPC possui determinada habilidade.
 
- **Fase (é realizada) PC**:
  - Indica que a fase foi realizada pelo PC.
    

    
