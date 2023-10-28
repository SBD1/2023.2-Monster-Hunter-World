## Normalização dos dados de acordo com as tabelas existentes no nosso [modelo relacional](https://github.com/SBD1/2023.2-Monster-Hunter-World/blob/main/docs/modulo%201/mapeamento-mer-relacional.md).

### Tabela Mapa - Normalização até a 3ª Forma Normal (3NF)

A tabela "Mapa" foi normalizada até a 3ª Forma Normal (3NF) com base nas dependências funcionais identificadas. A seguir, descrevemos as etapas de normalização realizadas:

**Dependências Funcionais:**
- "IdMapa" é a chave primária, e, portanto, todos os outros atributos dependem funcionalmente dele.
- "Nome," "TamanhoX," "TamanhoY," e "Descricao" não têm dependências funcionais entre si, pois são atributos independentes.

**1. 1ª Forma Normal (1NF):** A tabela já estava na 1NF, uma vez que cada atributo contém apenas valores atômicos e não repetidos, e "IdMapa" é a chave primária.

**2. 2ª Forma Normal (2NF):** A 2NF não se aplica a esta tabela, pois não há chaves primárias compostas.

**3. 3ª Forma Normal (3NF):** A tabela está na 3NF, uma vez que as dependências funcionais identificadas foram tratadas. Cada atributo é diretamente dependente da chave primária "IdMapa".

Não há necessidade de continuar a normalização para a 4ª Forma Normal (4NF) ou a Forma Normal de Boyce-Codd (BCNF) nesta tabela, uma vez que não foram identificadas dependências funcionais adicionais.

Este é o estado final da normalização da tabela "Mapa".

### Tabela Regiao - Normalização até a 3ª Forma Normal (3NF)

A tabela "Regiao" foi normalizada até a 3ª Forma Normal (3NF) com base nas dependências funcionais identificadas. A seguir, descrevemos as etapas de normalização realizadas:

**Dependências Funcionais:**
- "IdRegiao" é a chave primária, e, portanto, todos os outros atributos dependem funcionalmente dele.
- "Mapa" é uma chave estrangeira que se relaciona com a tabela "Mapa", estabelecendo uma dependência funcional em relação a "IdRegiao" para criar a relação.

**1. 1ª Forma Normal (1NF):** A tabela já estava na 1NF, uma vez que cada atributo contém apenas valores atômicos e não repetidos, e "IdRegiao" é a chave primária.

**2. 2ª Forma Normal (2NF):** A 2NF não se aplica a esta tabela, pois não há chaves primárias compostas.

**3. 3ª Forma Normal (3NF):** A tabela está na 3NF, uma vez que as dependências funcionais identificadas foram tratadas. Cada atributo é diretamente dependente da chave primária "IdRegiao". A presença da chave estrangeira "Mapa" não afeta a normalização, pois está relacionada a outra tabela.

Não há necessidade de continuar a normalização para a 4ª Forma Normal (4NF) ou a Forma Normal de Boyce-Codd (BCNF) nesta tabela, uma vez que não foram identificadas dependências funcionais adicionais.

Este é o estado final da normalização da tabela "Regiao".

### Tabela NPC - Normalização até a 3ª Forma Normal (3NF)

A tabela "NPC" foi normalizada até a 3ª Forma Normal (3NF) com base nas dependências funcionais identificadas. A seguir, descrevemos as etapas de normalização realizadas:

**Dependências Funcionais:**
- "IdNPC" é a chave primária, e, portanto, todos os outros atributos dependem funcionalmente dele.
- "Regiao" é uma chave estrangeira que se relaciona com a tabela "Regiao," estabelecendo uma dependência funcional em relação a "IdNPC" para criar a relação.

**1. 1ª Forma Normal (1NF):** A tabela já estava na 1NF, uma vez que cada atributo contém apenas valores atômicos e não repetidos, e "IdNPC" é a chave primária.

**2. 2ª Forma Normal (2NF):** A 2NF não se aplica a esta tabela, pois não há chaves primárias compostas.

**3. 3ª Forma Normal (3NF):** A tabela está na 3NF, uma vez que as dependências funcionais identificadas foram tratadas. Cada atributo é diretamente dependente da chave primária "IdNPC." A presença da chave estrangeira "Regiao" não afeta a normalização, pois está relacionada a outra tabela.

Não há necessidade de continuar a normalização para a 4ª Forma Normal (4NF) ou a Forma Normal de Boyce-Codd (BCNF) nesta tabela, uma vez que não foram identificadas dependências funcionais adicionais.

Este é o estado final da normalização da tabela "NPC."

### Tabela PC - Normalização até a 3ª Forma Normal (3NF)

A tabela "PC" foi normalizada até a 3ª Forma Normal (3NF) com base nas dependências funcionais identificadas. A seguir, descrevemos as etapas de normalização realizadas:

**Dependências Funcionais:**
- "IdPlayer" é a chave primária, e, portanto, todos os outros atributos dependem funcionalmente dele.
- "Regiao" é uma chave estrangeira que se relaciona com a tabela "Regiao," estabelecendo uma dependência funcional em relação a "IdPlayer" para criar a relação.

**1. 1ª Forma Normal (1NF):** A tabela já estava na 1NF, uma vez que cada atributo contém apenas valores atômicos e não repetidos, e "IdPlayer" é a chave primária.

**2. 2ª Forma Normal (2NF):** A 2NF não se aplica a esta tabela, pois não há chaves primárias compostas.

**3. 3ª Forma Normal (3NF):** A tabela está na 3NF, uma vez que as dependências funcionais identificadas foram tratadas. Cada atributo é diretamente dependente da chave primária "IdPlayer." A presença da chave estrangeira "Regiao" não afeta a normalização, pois está relacionada a outra tabela.

Não há necessidade de continuar a normalização para a 4ª Forma Normal (4NF) ou a Forma Normal de Boyce-Codd (BCNF) nesta tabela, uma vez que não foram identificadas dependências funcionais adicionais.

Este é o estado final da normalização da tabela "PC."

### Tabela Amigato - Normalização até a 3ª Forma Normal (3NF)

A tabela "Amigato" foi normalizada até a 3ª Forma Normal (3NF) com base nas dependências funcionais identificadas. A seguir, descrevemos as etapas de normalização realizadas:

**Dependências Funcionais:**
- "IdAmigato" é a chave primária, e, portanto, todos os outros atributos dependem funcionalmente dele.
- "Regiao" é uma chave estrangeira que se relaciona com a tabela "Regiao," estabelecendo uma dependência funcional em relação a "IdAmigato" para criar a relação.
- "PC" é uma chave estrangeira que se relaciona com a tabela "PC," estabelecendo uma dependência funcional em relação a "IdAmigato" para criar a relação.

**1. 1ª Forma Normal (1NF):** A tabela já estava na 1NF, uma vez que cada atributo contém apenas valores atômicos e não repetidos, e "IdAmigato" é a chave primária.

**2. 2ª Forma Normal (2NF):** A 2NF não se aplica a esta tabela, pois não há chaves primárias compostas.

**3. 3ª Forma Normal (3NF):** A tabela está na 3NF, uma vez que as dependências funcionais identificadas foram tratadas. Cada atributo é diretamente dependente da chave primária "IdAmigato." A presença das chaves estrangeiras "Regiao" e "PC" não afeta a normalização, pois estão relacionadas a outras tabelas.

Não há necessidade de continuar a normalização para a 4ª Forma Normal (4NF) ou a Forma Normal de Boyce-Codd (BCNF) nesta tabela, uma vez que não foram identificadas dependências funcionais adicionais.

Este é o estado final da normalização da tabela "Amigato."


### Tabela Fala - Normalização até a 3ª Forma Normal (3NF)

A tabela "Fala" foi normalizada até a 3ª Forma Normal (3NF) com base nas dependências funcionais identificadas. A seguir, descrevemos as etapas de normalização realizadas:

**Dependências Funcionais:**
- "IdFala" é a chave primária, e, portanto, todos os outros atributos dependem funcionalmente dele.
- "NPC" é uma chave estrangeira que se relaciona com a tabela "NPC," estabelecendo uma dependência funcional em relação a "IdFala" para criar a relação.

**1. 1ª Forma Normal (1NF):** A tabela já estava na 1NF, uma vez que cada atributo contém apenas valores atômicos e não repetidos, e "IdFala" é a chave primária.

**2. 2ª Forma Normal (2NF):** A 2NF não se aplica a esta tabela, pois não há chaves primárias compostas.

**3. 3ª Forma Normal (3NF):** A tabela está na 3NF, uma vez que as dependências funcionais identificadas foram tratadas. Cada atributo é diretamente dependente da chave primária "IdFala." A presença da chave estrangeira "NPC" não afeta a normalização, pois está relacionada a outra tabela.

Não há necessidade de continuar a normalização para a 4ª Forma Normal (4NF) ou a Forma Normal de Boyce-Codd (BCNF) nesta tabela, uma vez que não foram identificadas dependências funcionais adicionais.

Este é o estado final da normalização da tabela "Fala."

### Tabela FalaPreReq - Normalização até a 3ª Forma Normal (3NF)

A tabela "FalaPreReq" foi normalizada até a 3ª Forma Normal (3NF) com base nas dependências funcionais identificadas. A seguir, descrevemos as etapas de normalização realizadas:

**Dependências Funcionais:**
- "IdFalaPreReq" é a chave primária, e, portanto, todos os outros atributos dependem funcionalmente dele.
- "FalaPreReq" é uma chave estrangeira que se relaciona com a tabela "Fala," estabelecendo uma dependência funcional em relação a "IdFalaPreReq" para criar a relação.
- "Fala" é uma chave estrangeira que se relaciona com a tabela "Fala," estabelecendo uma dependência funcional em relação a "IdFalaPreReq" para criar a relação.

**1. 1ª Forma Normal (1NF):** A tabela já estava na 1NF, uma vez que cada atributo contém apenas valores atômicos e não repetidos, e "IdFalaPreReq" é a chave primária.

**2. 2ª Forma Normal (2NF):** A 2NF não se aplica a esta tabela, pois não há chaves primárias compostas.

**3. 3ª Forma Normal (3NF):** A tabela está na 3NF, uma vez que as dependências funcionais identificadas foram tratadas. Cada atributo é diretamente dependente da chave primária "IdFalaPreReq." As chaves estrangeiras "FalaPreReq" e "Fala" não afetam a normalização, pois estão relacionadas a outras tabelas.

Não há necessidade de continuar a normalização para a 4ª Forma Normal (4NF) ou a Forma Normal de Boyce-Codd (BCNF) nesta tabela, uma vez que não foram identificadas dependências funcionais adicionais.

Este é o estado final da normalização da tabela "FalaPreReq."

### Tabela Monstro - Normalização até a 3ª Forma Normal (3NF)

A tabela "Monstro" foi normalizada até a 3ª Forma Normal (3NF) com base nas dependências funcionais identificadas. A seguir, descrevemos as etapas de normalização realizadas:

**Dependências Funcionais:**
- "IdMonstro" é a chave primária, e, portanto, todos os outros atributos dependem funcionalmente dele.
- "IdAmigato" é uma chave estrangeira que se relaciona com a tabela "Amigato," estabelecendo uma dependência funcional em relação a "IdMonstro" para criar a relação.

**1. 1ª Forma Normal (1NF):** A tabela já estava na 1NF, uma vez que cada atributo contém apenas valores atômicos e não repetidos, e "IdMonstro" é a chave primária.

**2. 2ª Forma Normal (2NF):** A 2NF não se aplica a esta tabela, pois não há chaves primárias compostas.

**3. 3ª Forma Normal (3NF):** A tabela está na 3NF, uma vez que as dependências funcionais identificadas foram tratadas. Cada atributo é diretamente dependente da chave primária "IdMonstro." A presença da chave estrangeira "IdAmigato" não afeta a normalização, pois está relacionada a outra tabela.

Não há necessidade de continuar a normalização para a 4ª Forma Normal (4NF) ou a Forma Normal de Boyce-Codd (BCNF) nesta tabela, uma vez que não foram identificadas dependências funcionais adicionais.

Este é o estado final da normalização da tabela "Monstro."

### Tabela InstanciaMonstro - Normalização até a 3ª Forma Normal (3NF)

A tabela "InstanciaMonstro" foi normalizada até a 3ª Forma Normal (3NF) com base nas dependências funcionais identificadas. A seguir, descrevemos as etapas de normalização realizadas:

**Dependências Funcionais:**
- "IdInstanciaMonstro" é a chave primária, e, portanto, todos os outros atributos dependem funcionalmente dele.
- "Monstro" é uma chave estrangeira que se relaciona com a tabela "Monstro," estabelecendo uma dependência funcional em relação a "IdInstanciaMonstro" para criar a relação.

**1. 1ª Forma Normal (1NF):** A tabela já estava na 1NF, uma vez que cada atributo contém apenas valores atômicos e não repetidos, e "IdInstanciaMonstro" é a chave primária.

**2. 2ª Forma Normal (2NF):** A 2NF não se aplica a esta tabela, pois não há chaves primárias compostas.

**3. 3ª Forma Normal (3NF):** A tabela está na 3NF, uma vez que as dependências funcionais identificadas foram tratadas. Cada atributo é diretamente dependente da chave primária "IdInstanciaMonstro." A presença da chave estrangeira "Monstro" não afeta a normalização, pois está relacionada a outra tabela.

Não há necessidade de continuar a normalização para a 4ª Forma Normal (4NF) ou a Forma Normal de Boyce-Codd (BCNF) nesta tabela, uma vez que não foram identificadas dependências funcionais adicionais.

Este é o estado final da normalização da tabela "InstanciaMonstro."

### Tabela RegiaoMonstro - Normalização até a 3ª Forma Normal (3NF)

A tabela "RegiaoMonstro" foi normalizada até a 3ª Forma Normal (3NF) com base nas dependências funcionais identificadas. A seguir, descrevemos as etapas de normalização realizadas:

**Dependências Funcionais:**
- "IdRegiaoMonstro" é a chave primária, e, portanto, todos os outros atributos dependem funcionalmente dele.
- "Regiao" é uma chave estrangeira que se relaciona com a tabela "Regiao," estabelecendo uma dependência funcional em relação a "IdRegiaoMonstro" para criar a relação.
- "Monstro" é uma chave estrangeira que se relaciona com a tabela "Monstro," estabelecendo uma dependência funcional em relação a "IdRegiaoMonstro" para criar a relação.

**1. 1ª Forma Normal (1NF):** A tabela já estava na 1NF, uma vez que cada atributo contém apenas valores atômicos e não repetidos, e "IdRegiaoMonstro" é a chave primária.

**2. 2ª Forma Normal (2NF):** A 2NF não se aplica a esta tabela, pois não há chaves primárias compostas.

**3. 3ª Forma Normal (3NF):** A tabela está na 3NF, uma vez que as dependências funcionais identificadas foram tratadas. Cada atributo é diretamente dependente da chave primária "IdRegiaoMonstro." As chaves estrangeiras "Regiao" e "Monstro" não afetam a normalização, pois estão relacionadas a outras tabelas.

Não há necessidade de continuar a normalização para a 4ª Forma Normal (4NF) ou a Forma Normal de Boyce-Codd (BCNF) nesta tabela, uma vez que não foram identificadas dependências funcionais adicionais.

Este é o estado final da normalização da tabela "RegiaoMonstro."

### Tabela AtacaMonstro - Normalização até a 3ª Forma Normal (3NF)

A tabela "AtacaMonstro" foi normalizada até a 3ª Forma Normal (3NF) com base nas dependências funcionais identificadas. A seguir, descrevemos as etapas de normalização realizadas:

**Dependências Funcionais:**
- "IdAtacaMonstro" é a chave primária, e, portanto, todos os outros atributos dependem funcionalmente dele.
- "PC" é uma chave estrangeira que se relaciona com a tabela "PC," estabelecendo uma dependência funcional em relação a "IdAtacaMonstro" para criar a relação.
- "Monstro" é uma chave estrangeira que se relaciona com a tabela "Monstro," estabelecendo uma dependência funcional em relação a "IdAtacaMonstro" para criar a relação.

**1. 1ª Forma Normal (1NF):** A tabela já estava na 1NF, uma vez que cada atributo contém apenas valores atômicos e não repetidos, e "IdAtacaMonstro" é a chave primária.

**2. 2ª Forma Normal (2NF):** A 2NF não se aplica a esta tabela, pois não há chaves primárias compostas.

**3. 3ª Forma Normal (3NF):** A tabela está na 3NF, uma vez que as dependências funcionais identificadas foram tratadas. Cada atributo é diretamente dependente da chave primária "IdAtacaMonstro." As chaves estrangeiras "PC" e "Monstro" não afetam a normalização, pois estão relacionadas a outras tabelas.

Não há necessidade de continuar a normalização para a 4ª Forma Normal (4NF) ou a Forma Normal de Boyce-Codd (BCNF) nesta tabela, uma vez que não foram identificadas dependências funcionais adicionais.

Este é o estado final da normalização da tabela "AtacaMonstro."

### Tabela Missao - Normalização até a 3ª Forma Normal (3NF)

A tabela "Missao" foi normalizada até a 3ª Forma Normal (3NF) com base nas dependências funcionais identificadas. A seguir, descrevemos as etapas de normalização realizadas:

**Dependências Funcionais:**
- "IdMissao" é a chave primária, e, portanto, todos os outros atributos dependem funcionalmente dele.
- "Mapa" é uma chave estrangeira que se relaciona com a tabela "Mapa," estabelecendo uma dependência funcional em relação a "IdMissao" para criar a relação.
- "NPC" é uma chave estrangeira que se relaciona com a tabela "NPC," estabelecendo uma dependência funcional em relação a "IdMissao" para criar a relação.

**1. 1ª Forma Normal (1NF):** A tabela já estava na 1NF, uma vez que cada atributo contém apenas valores atômicos e não repetidos, e "IdMissao" é a chave primária.

**2. 2ª Forma Normal (2NF):** A 2NF não se aplica a esta tabela, pois não há chaves primárias compostas.

**3. 3ª Forma Normal (3NF):** A tabela está na 3NF, uma vez que as dependências funcionais identificadas foram tratadas. Cada atributo é diretamente dependente da chave primária "IdMissao." As chaves estrangeiras "Mapa" e "NPC" não afetam a normalização, pois estão relacionadas a outras tabelas.

Não há necessidade de continuar a normalização para a 4ª Forma Normal (4NF) ou a Forma Normal de Boyce-Codd (BCNF) nesta tabela, uma vez que não foram identificadas dependências funcionais adicionais.

Este é o estado final da normalização da tabela "Missao."

### Tabela MissaoPreReq - Normalização até a 3ª Forma Normal (3NF)

A tabela "MissaoPreReq" foi normalizada até a 3ª Forma Normal (3NF) com base nas dependências funcionais identificadas. A seguir, descrevemos as etapas de normalização realizadas:

**Dependências Funcionais:**
- "IdMissaoPreReq" é a chave primária, e, portanto, todos os outros atributos dependem funcionalmente dele.
- "MissaoPreReq" é uma chave estrangeira que se relaciona com a tabela "Missao," estabelecendo uma dependência funcional em relação a "IdMissaoPreReq" para criar a relação.
- "Missao" é uma chave estrangeira que se relaciona com a tabela "Missao," estabelecendo uma dependência funcional em relação a "IdMissaoPreReq" para criar a relação.

**1. 1ª Forma Normal (1NF):** A tabela já estava na 1NF, uma vez que cada atributo contém apenas valores atômicos e não repetidos, e "IdMissaoPreReq" é a chave primária.

**2. 2ª Forma Normal (2NF):** A 2NF não se aplica a esta tabela, pois não há chaves primárias compostas.

**3. 3ª Forma Normal (3NF):** A tabela está na 3NF, uma vez que as dependências funcionais identificadas foram tratadas. Cada atributo é diretamente dependente da chave primária "IdMissaoPreReq." As chaves estrangeiras "MissaoPreReq" e "Missao" não afetam a normalização, pois estão relacionadas a outras tabelas.

Não há necessidade de continuar a normalização para a 4ª Forma Normal (4NF) ou a Forma Normal de Boyce-Codd (BCNF) nesta tabela, uma vez que não foram identificadas dependências funcionais adicionais.

Este é o estado final da normalização da tabela "MissaoPreReq."

### Tabela EtapaMissao - Normalização até a 3ª Forma Normal (3NF)

A tabela "EtapaMissao" foi normalizada até a 3ª Forma Normal (3NF) com base nas dependências funcionais identificadas. A seguir, descrevemos as etapas de normalização realizadas:

**Dependências Funcionais:**
- "IdEtapaMissao" é a chave primária, e, portanto, todos os outros atributos dependem funcionalmente dele.
- "Missao" é uma chave estrangeira que se relaciona com a tabela "Missao," estabelecendo uma dependência funcional em relação a "IdEtapaMissao" para criar a relação.

**1. 1ª Forma Normal (1NF):** A tabela já estava na 1NF, uma vez que cada atributo contém apenas valores atômicos e não repetidos, e "IdEtapaMissao" é a chave primária.

**2. 2ª Forma Normal (2NF):** A 2NF não se aplica a esta tabela, pois não há chaves primárias compostas.

**3. 3ª Forma Normal (3NF):** A tabela está na 3NF, uma vez que as dependências funcionais identificadas foram tratadas. Cada atributo é diretamente dependente da chave primária "IdEtapaMissao." A chave estrangeira "Missao" não afeta a normalização, pois está relacionada a outra tabela.

Não há necessidade de continuar a normalização para a 4ª Forma Normal (4NF) ou a Forma Normal de Boyce-Codd (BCNF) nesta tabela, uma vez que não foram identificadas dependências funcionais adicionais.

Este é o estado final da normalização da tabela "EtapaMissao."

### Tabela EtapaMonstro - Normalização até a 3ª Forma Normal (3NF)

A tabela "EtapaMonstro" foi normalizada até a 3ª Forma Normal (3NF) com base nas dependências funcionais identificadas. A seguir, descrevemos as etapas de normalização realizadas:

**Dependências Funcionais:**
- "IdEtapaMonstro" é a chave primária, e, portanto, todos os outros atributos dependem funcionalmente dele.
- "EtapaMissao" é uma chave estrangeira que se relaciona com a tabela "EtapaMissao," estabelecendo uma dependência funcional em relação a "IdEtapaMonstro" para criar a relação.
- "Monstro" é uma chave estrangeira que se relaciona com a tabela "Monstro," estabelecendo uma dependência funcional em relação a "IdEtapaMonstro" para criar a relação.

**1. 1ª Forma Normal (1NF):** A tabela já estava na 1NF, uma vez que cada atributo contém apenas valores atômicos e não repetidos, e "IdEtapaMonstro" é a chave primária.

**2. 2ª Forma Normal (2NF):** A 2NF não se aplica a esta tabela, pois não há chaves primárias compostas.

**3. 3ª Forma Normal (3NF):** A tabela está na 3NF, uma vez que as dependências funcionais identificadas foram tratadas. Cada atributo é diretamente dependente da chave primária "IdEtapaMonstro." As chaves estrangeiras "EtapaMissao" e "Monstro" não afetam a normalização, pois estão relacionadas a outras tabelas.

Não há necessidade de continuar a normalização para a 4ª Forma Normal (4NF) ou a Forma Normal de Boyce-Codd (BCNF) nesta tabela, uma vez que não foram identificadas dependências funcionais adicionais.

Este é o estado final da normalização da tabela "EtapaMonstro."

### Tabela EtapaFala - Normalização até a 3ª Forma Normal (3NF)

A tabela "EtapaFala" foi normalizada até a 3ª Forma Normal (3NF) com base nas dependências funcionais identificadas. A seguir, descrevemos as etapas de normalização realizadas:

**Dependências Funcionais:**
- "IdEtapaFala" é a chave primária, e, portanto, todos os outros atributos dependem funcionalmente dele.
- "EtapaMissao" é uma chave estrangeira que se relaciona com a tabela "EtapaMissao," estabelecendo uma dependência funcional em relação a "IdEtapaFala" para criar a relação.
- "Fala" é uma chave estrangeira que se relaciona com a tabela "Fala," estabelecendo uma dependência funcional em relação a "IdEtapaFala" para criar a relação.

**1. 1ª Forma Normal (1NF):** A tabela já estava na 1NF, uma vez que cada atributo contém apenas valores atômicos e não repetidos, e "IdEtapaFala" é a chave primária.

**2. 2ª Forma Normal (2NF):** A 2NF não se aplica a esta tabela, pois não há chaves primárias compostas.

**3. 3ª Forma Normal (3NF):** A tabela está na 3NF, uma vez que as dependências funcionais identificadas foram tratadas. Cada atributo é diretamente dependente da chave primária "IdEtapaFala." As chaves estrangeiras "EtapaMissao" e "Fala" não afetam a normalização, pois estão relacionadas a outras tabelas.

Não há necessidade de continuar a normalização para a 4ª Forma Normal (4NF) ou a Forma Normal de Boyce-Codd (BCNF) nesta tabela, uma vez que não foram identificadas dependências funcionais adicionais.

Este é o estado final da normalização da tabela "EtapaFala."

### Tabela RealizaMissao - Normalização até a 3ª Forma Normal (3NF)

A tabela "RealizaMissao" foi normalizada até a 3ª Forma Normal (3NF) com base nas dependências funcionais identificadas. A seguir, descrevemos as etapas de normalização realizadas:

**Dependências Funcionais:**
- "IdRealizaMissao" é a chave primária, e, portanto, todos os outros atributos dependem funcionalmente dele.
- "Missao" é uma chave estrangeira que se relaciona com a tabela "Missao," estabelecendo uma dependência funcional em relação a "IdRealizaMissao" para criar a relação.
- "PC" é uma chave estrangeira que se relaciona com a tabela "PC," estabelecendo uma dependência funcional em relação a "IdRealizaMissao" para criar a relação.

**1. 1ª Forma Normal (1NF):** A tabela já estava na 1NF, uma vez que cada atributo contém apenas valores atômicos e não repetidos, e "IdRealizaMissao" é a chave primária.

**2. 2ª Forma Normal (2NF):** A 2NF não se aplica a esta tabela, pois não há chaves primárias compostas.

**3. 3ª Forma Normal (3NF):** A tabela está na 3NF, uma vez que as dependências funcionais identificadas foram tratadas. Cada atributo é diretamente dependente da chave primária "IdRealizaMissao." As chaves estrangeiras "Missao" e "PC" não afetam a normalização, pois estão relacionadas a outras tabelas.

Não há necessidade de continuar a normalização para a 4ª Forma Normal (4NF) ou a Forma Normal de Boyce-Codd (BCNF) nesta tabela, uma vez que não foram identificadas dependências funcionais adicionais.

Este é o estado final da normalização da tabela "RealizaMissao."

### Tabela Inventario - Normalização até a 3ª Forma Normal (3NF)

A tabela "Inventario" foi normalizada até a 3ª Forma Normal (3NF) com base nas dependências funcionais identificadas. A seguir, descrevemos as etapas de normalização realizadas:

**Dependências Funcionais:**
- "IdInventario" é a chave primária, e, portanto, todos os outros atributos dependem funcionalmente dele.
- "PC" é uma chave estrangeira que se relaciona com a tabela "PC," estabelecendo uma dependência funcional em relação a "IdInventario" para criar a relação.

**1. 1ª Forma Normal (1NF):** A tabela já estava na 1NF, uma vez que cada atributo contém apenas valores atômicos e não repetidos, e "IdInventario" é a chave primária.

**2. 2ª Forma Normal (2NF):** A 2NF não se aplica a esta tabela, pois não há chaves primárias compostas.

**3. 3ª Forma Normal (3NF):** A tabela está na 3NF, uma vez que as dependências funcionais identificadas foram tratadas. Cada atributo é diretamente dependente da chave primária "IdInventario." A chave estrangeira "PC" não afeta a normalização, pois está relacionada a outra tabela.

Não há necessidade de continuar a normalização para a 4ª Forma Normal (4NF) ou a Forma Normal de Boyce-Codd (BCNF) nesta tabela, uma vez que não foram identificadas dependências funcionais adicionais.

Este é o estado final da normalização da tabela "Inventario."

### Tabela Loja - Normalização até a 3ª Forma Normal (3NF)

A tabela "Loja" foi normalizada até a 3ª Forma Normal (3NF) com base nas dependências funcionais identificadas. A seguir, descrevemos as etapas de normalização realizadas:

**Dependências Funcionais:**
- "IdLoja" é a chave primária, e, portanto, todos os outros atributos dependem funcionalmente dele.
- "NPC" é uma chave estrangeira que se relaciona com a tabela "NPC," estabelecendo uma dependência funcional em relação a "IdLoja" para criar a relação.

**1. 1ª Forma Normal (1NF):** A tabela já estava na 1NF, uma vez que cada atributo contém apenas valores atômicos e não repetidos, e "IdLoja" é a chave primária.

**2. 2ª Forma Normal (2NF):** A 2NF não se aplica a esta tabela, pois não há chaves primárias compostas.

**3. 3ª Forma Normal (3NF):** A tabela está na 3NF, uma vez que as dependências funcionais identificadas foram tratadas. Cada atributo é diretamente dependente da chave primária "IdLoja." A chave estrangeira "NPC" não afeta a normalização, pois está relacionada a outra tabela.

Não há necessidade de continuar a normalização para a 4ª Forma Normal (4NF) ou a Forma Normal de Boyce-Codd (BCNF) nesta tabela, uma vez que não foram identificadas dependências funcionais adicionais.

Este é o estado final da normalização da tabela "Loja."

### Tabela Forja - Normalização até a 3ª Forma Normal (3NF)

A tabela "Forja" foi normalizada até a 3ª Forma Normal (3NF) com base nas dependências funcionais identificadas. A seguir, descrevemos as etapas de normalização realizadas:

**Dependências Funcionais:**
- "IdForja" é a chave primária, e, portanto, todos os outros atributos dependem funcionalmente dele.
- "NPC" é uma chave estrangeira que se relaciona com a tabela "NPC," estabelecendo uma dependência funcional em relação a "IdForja" para criar a relação.

**1. 1ª Forma Normal (1NF):** A tabela já estava na 1NF, uma vez que cada atributo contém apenas valores atômicos e não repetidos, e "IdForja" é a chave primária.

**2. 2ª Forma Normal (2NF):** A 2NF não se aplica a esta tabela, pois não há chaves primárias compostas.

**3. 3ª Forma Normal (3NF):** A tabela está na 3NF, uma vez que as dependências funcionais identificadas foram tratadas. Cada atributo é diretamente dependente da chave primária "IdForja." A chave estrangeira "NPC" não afeta a normalização, pois está relacionada a outra tabela.

Não há necessidade de continuar a normalização para a 4ª Forma Normal (4NF) ou a Forma Normal de Boyce-Codd (BCNF) nesta tabela, uma vez que não foram identificadas dependências funcionais adicionais.

Este é o estado final da normalização da tabela "Forja."

### Tabela Item - Normalização até a 3ª Forma Normal (3NF)

A tabela "Item" foi normalizada até a 3ª Forma Normal (3NF) com base nas dependências funcionais identificadas. A seguir, descrevemos as etapas de normalização realizadas:

**Dependências Funcionais:**
- "IdItem" é a chave primária, e, portanto, todos os outros atributos dependem funcionalmente dele. Os atributos como "Nome," "Raridade," "Tipo," "Funcao," "Descricao," "ValorVenda," e "CustoCompra" dependem funcionalmente de "IdItem."

**1. 1ª Forma Normal (1NF):** A tabela já estava na 1NF, uma vez que cada atributo contém apenas valores atômicos e não repetidos, e "IdItem" é a chave primária.

**2. 2ª Forma Normal (2NF):** A 2NF não se aplica a esta tabela, pois não há chaves primárias compostas.

**3. 3ª Forma Normal (3NF):** A tabela está na 3NF, uma vez que as dependências funcionais identificadas foram tratadas. Cada atributo é diretamente dependente da chave primária "IdItem."

Não há necessidade de continuar a normalização para a 4ª Forma Normal (4NF) ou a Forma Normal de Boyce-Codd (BCNF) nesta tabela, uma vez que não foram identificadas dependências funcionais adicionais.

Este é o estado final da normalização da tabela "Item."

### Tabela DropaItem - Normalização até a 3ª Forma Normal (3NF)

A tabela "DropraItem" foi normalizada até a 3ª Forma Normal (3NF) com base nas dependências funcionais identificadas. A seguir, descrevemos as etapas de normalização realizadas:

**Dependências Funcionais:**
- "IdDropaItem" é a chave primária, e, portanto, todos os outros atributos dependem funcionalmente dele.
- "Monstro" é uma chave estrangeira que se relaciona com a tabela "InstanciaMonstro," estabelecendo uma dependência funcional em relação a "IdDropaItem" para criar a relação.
- "Item" é uma chave estrangeira que se relaciona com a tabela "Item," estabelecendo uma dependência funcional em relação a "IdDropaItem" para criar a relação.

**1. 1ª Forma Normal (1NF):** A tabela já estava na 1NF, uma vez que cada atributo contém apenas valores atômicos e não repetidos, e "IdDropaItem" é a chave primária.

**2. 2ª Forma Normal (2NF):** A 2NF não se aplica a esta tabela, pois não há chaves primárias compostas.

**3. 3ª Forma Normal (3NF):** A tabela está na 3NF, uma vez que as dependências funcionais identificadas foram tratadas. Cada atributo é diretamente dependente da chave primária "IdDropaItem." As chaves estrangeiras "Monstro" e "Item" não afetam a normalização, pois estão relacionadas a outras tabelas.

Não há necessidade de continuar a normalização para a 4ª Forma Normal (4NF) ou a Forma Normal de Boyce-Codd (BCNF) nesta tabela, uma vez que não foram identificadas dependências funcionais adicionais.

Este é o estado final da normalização da tabela "DropraItem."

### Tabela GuardaItem - Normalização até a 3ª Forma Normal (3NF)

A tabela "GuardaItem" foi normalizada até a 3ª Forma Normal (3NF) com base nas dependências funcionais identificadas. A seguir, descrevemos as etapas de normalização realizadas:

**Dependências Funcionais:**
- "IdGuardaItem" é a chave primária, e, portanto, todos os outros atributos dependem funcionalmente dele.
- "Inventario" é uma chave estrangeira que se relaciona com a tabela "Inventario," estabelecendo uma dependência funcional em relação a "IdGuardaItem" para criar a relação.
- "Item" é uma chave estrangeira que se relaciona com a tabela "Item," estabelecendo uma dependência funcional em relação a "IdGuardaItem" para criar a relação.

**1. 1ª Forma Normal (1NF):** A tabela já estava na 1NF, uma vez que cada atributo contém apenas valores atômicos e não repetidos, e "IdGuardaItem" é a chave primária.

**2. 2ª Forma Normal (2NF):** A 2NF não se aplica a esta tabela, pois não há chaves primárias compostas.

**3. 3ª Forma Normal (3NF):** A tabela está na 3NF, uma vez que as dependências funcionais identificadas foram tratadas. Cada atributo é diretamente dependente da chave primária "IdGuardaItem." As chaves estrangeiras "Inventario" e "Item" não afetam a normalização, pois estão relacionadas a outras tabelas.

Não há necessidade de continuar a normalização para a 4ª Forma Normal (4NF) ou a Forma Normal de Boyce-Codd (BCNF) nesta tabela, uma vez que não foram identificadas dependências funcionais adicionais.

Este é o estado final da normalização da tabela "GuardaItem."

### Tabela UsaItem - Normalização até a 3ª Forma Normal (3NF)

A tabela "UsaItem" foi normalizada até a 3ª Forma Normal (3NF) com base nas dependências funcionais identificadas. A seguir, descrevemos as etapas de normalização realizadas:

**Dependências Funcionais:**
- "IdUsaItem" é a chave primária, e, portanto, todos os outros atributos dependem funcionalmente dele.
- "Forja" é uma chave estrangeira que se relaciona com a tabela "Forja," estabelecendo uma dependência funcional em relação a "IdUsaItem" para criar a relação.
- "Item" é uma chave estrangeira que se relaciona com a tabela "Item," estabelecendo uma dependência funcional em relação a "IdUsaItem" para criar a relação.

**1. 1ª Forma Normal (1NF):** A tabela já estava na 1NF, uma vez que cada atributo contém apenas valores atômicos e não repetidos, e "IdUsaItem" é a chave primária.

**2. 2ª Forma Normal (2NF):** A 2NF não se aplica a esta tabela, pois não há chaves primárias compostas.

**3. 3ª Forma Normal (3NF):** A tabela está na 3NF, uma vez que as dependências funcionais identificadas foram tratadas. Cada atributo é diretamente dependente da chave primária "IdUsaItem." As chaves estrangeiras "Forja" e "Item" não afetam a normalização, pois estão relacionadas a outras tabelas.

Não há necessidade de continuar a normalização para a 4ª Forma Normal (4NF) ou a Forma Normal de Boyce-Codd (BCNF) nesta tabela, uma vez que não foram identificadas dependências funcionais adicionais.

Este é o estado final da normalização da tabela "UsaItem."

### Tabela Arma - Normalização até a 3ª Forma Normal (3NF)

A tabela "Arma" foi normalizada até a 3ª Forma Normal (3NF) com base nas dependências funcionais identificadas. A seguir, descrevemos as etapas de normalização realizadas:

**Dependências Funcionais:**
- "IdArma" é a chave primária, e, portanto, todos os outros atributos dependem funcionalmente dele. Os atributos como "Nome," "Nivel," "Raridade," "CustoCompra," "ValorVenda," "Descricao," "Tipo," "Ataque," "Afiacao," "Elemento," e "ValorElemento" dependem funcionalmente de "IdArma."

**1. 1ª Forma Normal (1NF):** A tabela já estava na 1NF, uma vez que cada atributo contém apenas valores atômicos e não repetidos, e "IdArma" é a chave primária.

**2. 2ª Forma Normal (2NF):** A 2NF não se aplica a esta tabela, pois não há chaves primárias compostas.

**3. 3ª Forma Normal (3NF):** A tabela está na 3NF, uma vez que as dependências funcionais identificadas foram tratadas. Cada atributo é diretamente dependente da chave primária "IdArma."

Não há necessidade de continuar a normalização para a 4ª Forma Normal (4NF) ou a Forma Normal de Boyce-Codd (BCNF) nesta tabela, uma vez que não foram identificadas dependências funcionais adicionais.

Este é o estado final da normalização da tabela "Arma."

### Tabela GuardaArma - Normalização até a 3ª Forma Normal (3NF)

A tabela "GuardaArma" foi normalizada até a 3ª Forma Normal (3NF) com base nas dependências funcionais identificadas. A seguir, descrevemos as etapas de normalização realizadas:

**Dependências Funcionais:**
- "IdGuardaArma" é a chave primária, e, portanto, todos os outros atributos dependem funcionalmente dele.
- "Inventario" é uma chave estrangeira que se relaciona com a tabela "Inventario," estabelecendo uma dependência funcional em relação a "IdGuardaArma" para criar a relação.
- "Arma" é uma chave estrangeira que se relaciona com a tabela "Arma," estabelecendo uma dependência funcional em relação a "IdGuardaArma" para criar a relação.

**1. 1ª Forma Normal (1NF):** A tabela já estava na 1NF, uma vez que cada atributo contém apenas valores atômicos e não repetidos, e "IdGuardaArma" é a chave primária.

**2. 2ª Forma Normal (2NF):** A 2NF não se aplica a esta tabela, pois não há chaves primárias compostas.

**3. 3ª Forma Normal (3NF):** A tabela está na 3NF, uma vez que as dependências funcionais identificadas foram tratadas. Cada atributo é diretamente dependente da chave primária "IdGuardaArma." As chaves estrangeiras "Inventario" e "Arma" não afetam a normalização, pois estão relacionadas a outras tabelas.

Não há necessidade de continuar a normalização para a 4ª Forma Normal (4NF) ou a Forma Normal de Boyce-Codd (BCNF) nesta tabela, uma vez que não foram identificadas dependências funcionais adicionais.

Este é o estado final da normalização da tabela "GuardaArma."

### Tabela UtilizaArma - Normalização até a 3ª Forma Normal (3NF)

A tabela "UtilizaArma" foi normalizada até a 3ª Forma Normal (3NF) com base nas dependências funcionais identificadas. A seguir, descrevemos as etapas de normalização realizadas:

**Dependências Funcionais:**
- "IdUtilizaArma" é a chave primária, e, portanto, todos os outros atributos dependem funcionalmente dele.
- "PC" é uma chave estrangeira que se relaciona com a tabela "PC," estabelecendo uma dependência funcional em relação a "IdUtilizaArma" para criar a relação.
- "Arma" é uma chave estrangeira que se relaciona com a tabela "Arma," estabelecendo uma dependência funcional em relação a "IdUtilizaArma" para criar a relação.

**1. 1ª Forma Normal (1NF):** A tabela já estava na 1NF, uma vez que cada atributo contém apenas valores atômicos e não repetidos, e "IdUtilizaArma" é a chave primária.

**2. 2ª Forma Normal (2NF):** A 2NF não se aplica a esta tabela, pois não há chaves primárias compostas.

**3. 3ª Forma Normal (3NF):** A tabela está na 3NF, uma vez que as dependências funcionais identificadas foram tratadas. Cada atributo é diretamente dependente da chave primária "IdUtilizaArma." As chaves estrangeiras "PC" e "Arma" não afetam a normalização, pois estão relacionadas a outras tabelas.

Não há necessidade de continuar a normalização para a 4ª Forma Normal (4NF) ou a Forma Normal de Boyce-Codd (BCNF) nesta tabela, uma vez que não foram identificadas dependências funcionais adicionais.

Este é o estado final da normalização da tabela "UtilizaArma."

### Tabela AmigatoArma - Normalização até a 3ª Forma Normal (3NF)

A tabela "AmigatoArma" foi normalizada até a 3ª Forma Normal (3NF) com base nas dependências funcionais identificadas. A seguir, descrevemos as etapas de normalização realizadas:

**Dependências Funcionais:**
- "IdAmigatoArma" é a chave primária, e, portanto, todos os outros atributos dependem funcionalmente dele.
- "Amigato" é uma chave estrangeira que se relaciona com a tabela "Amigato," estabelecendo uma dependência funcional em relação a "IdAmigatoArma" para criar a relação.
- "Arma" é uma chave estrangeira que se relaciona com a tabela "Arma," estabelecendo uma dependência funcional em relação a "IdAmigatoArma" para criar a relação.

**1. 1ª Forma Normal (1NF):** A tabela já estava na 1NF, uma vez que cada atributo contém apenas valores atômicos e não repetidos, e "IdAmigatoArma" é a chave primária.

**2. 2ª Forma Normal (2NF):** A 2NF não se aplica a esta tabela, pois não há chaves primárias compostas.

**3. 3ª Forma Normal (3NF):** A tabela está na 3NF, uma vez que as dependências funcionais identificadas foram tratadas. Cada atributo é diretamente dependente da chave primária "IdAmigatoArma." As chaves estrangeiras "Amigato" e "Arma" não afetam a normalização, pois estão relacionadas a outras tabelas.

Não há necessidade de continuar a normalização para a 4ª Forma Normal (4NF) ou a Forma Normal de Boyce-Codd (BCNF) nesta tabela, uma vez que não foram identificadas dependências funcionais adicionais.

Este é o estado final da normalização da tabela "AmigatoArma."

### Tabela VendeArma - Normalização até a 3ª Forma Normal (3NF)

A tabela "VendeArma" foi normalizada até a 3ª Forma Normal (3NF) com base nas dependências funcionais identificadas. A seguir, descrevemos as etapas de normalização realizadas:

**Dependências Funcionais:**
- "IdVendeArma" é a chave primária, e, portanto, todos os outros atributos dependem funcionalmente dele.
- "Loja" é uma chave estrangeira que se relaciona com a tabela "Loja," estabelecendo uma dependência funcional em relação a "IdVendeArma" para criar a relação.
- "Arma" é uma chave estrangeira que se relaciona com a tabela "Arma," estabelecendo uma dependência funcional em relação a "IdVendeArma" para criar a relação.

**1. 1ª Forma Normal (1NF):** A tabela já estava na 1NF, uma vez que cada atributo contém apenas valores atômicos e não repetidos, e "IdVendeArma" é a chave primária.

**2. 2ª Forma Normal (2NF):** A 2NF não se aplica a esta tabela, pois não há chaves primárias compostas.

**3. 3ª Forma Normal (3NF):** A tabela está na 3NF, uma vez que as dependências funcionais identificadas foram tratadas. Cada atributo é diretamente dependente da chave primária "IdVendeArma." As chaves estrangeiras "Loja" e "Arma" não afetam a normalização, pois estão relacionadas a outras tabelas.

Não há necessidade de continuar a normalização para a 4ª Forma Normal (4NF) ou a Forma Normal de Boyce-Codd (BCNF) nesta tabela, uma vez que não foram identificadas dependências funcionais adicionais.

Este é o estado final da normalização da tabela "VendeArma."

### Tabela CriaArma - Normalização até a 3ª Forma Normal (3NF)

A tabela "CriaArma" foi normalizada até a 3ª Forma Normal (3NF) com base nas dependências funcionais identificadas. A seguir, descrevemos as etapas de normalização realizadas:

**Dependências Funcionais:**
- "IdCriaArma" é a chave primária, e, portanto, todos os outros atributos dependem funcionalmente dele.
- "Forja" é uma chave estrangeira que se relaciona com a tabela "Forja," estabelecendo uma dependência funcional em relação a "IdCriaArma" para criar a relação.
- "Arma" é uma chave estrangeira que se relaciona com a tabela "Arma," estabelecendo uma dependência funcional em relação a "IdCriaArma" para criar a relação.

**1. 1ª Forma Normal (1NF):** A tabela já estava na 1NF, uma vez que cada atributo contém apenas valores atômicos e não repetidos, e "IdCriaArma" é a chave primária.

**2. 2ª Forma Normal (2NF):** A 2NF não se aplica a esta tabela, pois não há chaves primárias compostas.

**3. 3ª Forma Normal (3NF):** A tabela está na 3NF, uma vez que as dependências funcionais identificadas foram tratadas. Cada atributo é diretamente dependente da chave primária "IdCriaArma." As chaves estrangeiras "Forja" e "Arma" não afetam a normalização, pois estão relacionadas a outras tabelas.

Não há necessidade de continuar a normalização para a 4ª Forma Normal (4NF) ou a Forma Normal de Boyce-Codd (BCNF) nesta tabela, uma vez que não foram identificadas dependências funcionais adicionais.

Este é o estado final da normalização da tabela "CriaArma."

### Tabela Armadura - Normalização até a 3ª Forma Normal (3NF)

A tabela "Armadura" foi normalizada até a 3ª Forma Normal (3NF) com base nas dependências funcionais identificadas. A seguir, descrevemos as etapas de normalização realizadas:

**Dependências Funcionais:**
- "IdArmadura" é a chave primária, e, portanto, todos os outros atributos dependem funcionalmente dele. Os atributos como "Nome," "Nivel," "Raridade," "CustoCompra," "ValorVenda," "Descricao," "Tipo," "Defesa," "Fogo," "Agua," "Raio," "Gelo," e "Dragao" dependem funcionalmente de "IdArmadura."

**1. 1ª Forma Normal (1NF):** A tabela já estava na 1NF, uma vez que cada atributo contém apenas valores atômicos e não repetidos, e "IdArmadura" é a chave primária.

**2. 2ª Forma Normal (2NF):** A 2NF não se aplica a esta tabela, pois não há chaves primárias compostas.

**3. 3ª Forma Normal (3NF):** A tabela está na 3NF, uma vez que as dependências funcionais identificadas foram tratadas. Cada atributo é diretamente dependente da chave primária "IdArmadura."

Não há necessidade de continuar a normalização para a 4ª Forma Normal (4NF) ou a Forma Normal de Boyce-Codd (BCNF) nesta tabela, uma vez que não foram identificadas dependências funcionais adicionais.

Este é o estado final da normalização da tabela "Armadura."

### Tabela GuardaArmadura - Normalização até a 3ª Forma Normal (3NF)

A tabela "GuardaArmadura" foi normalizada até a 3ª Forma Normal (3NF) com base nas dependências funcionais identificadas. A seguir, descrevemos as etapas de normalização realizadas:

**Dependências Funcionais:**
- "IdGuardaArmadura" é a chave primária, e, portanto, todos os outros atributos dependem funcionalmente dele.
- "Inventario" é uma chave estrangeira que se relaciona com a tabela "Inventario," estabelecendo uma dependência funcional em relação a "IdGuardaArmadura" para criar a relação.
- "Armadura" é uma chave estrangeira que se relaciona com a tabela "Armadura," estabelecendo uma dependência funcional em relação a "IdGuardaArmadura" para criar a relação.

**1. 1ª Forma Normal (1NF):** A tabela já estava na 1NF, uma vez que cada atributo contém apenas valores atômicos e não repetidos, e "IdGuardaArmadura" é a chave primária.

**2. 2ª Forma Normal (2NF):** A 2NF não se aplica a esta tabela, pois não há chaves primárias compostas.

**3. 3ª Forma Normal (3NF):** A tabela está na 3NF, uma vez que as dependências funcionais identificadas foram tratadas. Cada atributo é diretamente dependente da chave primária "IdGuardaArmadura." As chaves estrangeiras "Inventario" e "Armadura" não afetam a normalização, pois estão relacionadas a outras tabelas.

Não há necessidade de continuar a normalização para a 4ª Forma Normal (4NF) ou a Forma Normal de Boyce-Codd (BCNF) nesta tabela, uma vez que não foram identificadas dependências funcionais adicionais.

Este é o estado final da normalização da tabela "GuardaArmadura."

### Tabela UtilizaArmadura - Normalização até a 3ª Forma Normal (3NF)

A tabela "UtilizaArmadura" foi normalizada até a 3ª Forma Normal (3NF) com base nas dependências funcionais identificadas. A seguir, descrevemos as etapas de normalização realizadas:

**Dependências Funcionais:**
- "IdUtilizaArmadura" é a chave primária, e, portanto, todos os outros atributos dependem funcionalmente dele.
- "PC" é uma chave estrangeira que se relaciona com a tabela "PC," estabelecendo uma dependência funcional em relação a "IdUtilizaArmadura" para criar a relação.
- "Armadura" é uma chave estrangeira que se relaciona com a tabela "Armadura," estabelecendo uma dependência funcional em relação a "IdUtilizaArmadura" para criar a relação.

**1. 1ª Forma Normal (1NF):** A tabela já estava na 1NF, uma vez que cada atributo contém apenas valores atômicos e não repetidos, e "IdUtilizaArmadura" é a chave primária.

**2. 2ª Forma Normal (2NF):** A 2NF não se aplica a esta tabela, pois não há chaves primárias compostas.

**3. 3ª Forma Normal (3NF):** A tabela está na 3NF, uma vez que as dependências funcionais identificadas foram tratadas. Cada atributo é diretamente dependente da chave primária "IdUtilizaArmadura." As chaves estrangeiras "PC" e "Armadura" não afetam a normalização, pois estão relacionadas a outras tabelas.

Não há necessidade de continuar a normalização para a 4ª Forma Normal (4NF) ou a Forma Normal de Boyce-Codd (BCNF) nesta tabela, uma vez que não foram identificadas dependências funcionais adicionais.

Este é o estado final da normalização da tabela "UtilizaArmadura."

### Tabela AmigatoArmadura - Normalização até a 3ª Forma Normal (3NF)

A tabela "AmigatoArmadura" foi normalizada até a 3ª Forma Normal (3NF) com base nas dependências funcionais identificadas. A seguir, descrevemos as etapas de normalização realizadas:

**Dependências Funcionais:**
- "IdAmigatoArmadura" é a chave primária, e, portanto, todos os outros atributos dependem funcionalmente dele.
- "Amigato" é uma chave estrangeira que se relaciona com a tabela "Amigato," estabelecendo uma dependência funcional em relação a "IdAmigatoArmadura" para criar a relação.
- "Armadura" é uma chave estrangeira que se relaciona com a tabela "Armadura," estabelecendo uma dependência funcional em relação a "IdAmigatoArmadura" para criar a relação.

**1. 1ª Forma Normal (1NF):** A tabela já estava na 1NF, uma vez que cada atributo contém apenas valores atômicos e não repetidos, e "IdAmigatoArmadura" é a chave primária.

**2. 2ª Forma Normal (2NF):** A 2NF não se aplica a esta tabela, pois não há chaves primárias compostas.

**3. 3ª Forma Normal (3NF):** A tabela está na 3NF, uma vez que as dependências funcionais identificadas foram tratadas. Cada atributo é diretamente dependente da chave primária "IdAmigatoArmadura." As chaves estrangeiras "Amigato" e "Armadura" não afetam a normalização, pois estão relacionadas a outras tabelas.

Não há necessidade de continuar a normalização para a 4ª Forma Normal (4NF) ou a Forma Normal de Boyce-Codd (BCNF) nesta tabela, uma vez que não foram identificadas dependências funcionais adicionais.

Este é o estado final da normalização da tabela "AmigatoArmadura."

### Tabela VendeArmadura - Normalização até a 3ª Forma Normal (3NF)

A tabela "VendeArmadura" foi normalizada até a 3ª Forma Normal (3NF) com base nas dependências funcionais identificadas. A seguir, descrevemos as etapas de normalização realizadas:

**Dependências Funcionais:**
- "IdVendeArmadura" é a chave primária, e, portanto, todos os outros atributos dependem funcionalmente dele.
- "Loja" é uma chave estrangeira que se relaciona com a tabela "Loja," estabelecendo uma dependência funcional em relação a "IdVendeArmadura" para criar a relação.
- "Armadura" é uma chave estrangeira que se relaciona com a tabela "Armadura," estabelecendo uma dependência funcional em relação a "IdVendeArmadura" para criar a relação.

**1. 1ª Forma Normal (1NF):** A tabela já estava na 1NF, uma vez que cada atributo contém apenas valores atômicos e não repetidos, e "IdVendeArmadura" é a chave primária.

**2. 2ª Forma Normal (2NF):** A 2NF não se aplica a esta tabela, pois não há chaves primárias compostas.

**3. 3ª Forma Normal (3NF):** A tabela está na 3NF, uma vez que as dependências funcionais identificadas foram tratadas. Cada atributo é diretamente dependente da chave primária "IdVendeArmadura." As chaves estrangeiras "Loja" e "Armadura" não afetam a normalização, pois estão relacionadas a outras tabelas.

Não há necessidade de continuar a normalização para a 4ª Forma Normal (4NF) ou a Forma Normal de Boyce-Codd (BCNF) nesta tabela, uma vez que não foram identificadas dependências funcionais adicionais.

Este é o estado final da normalização da tabela "VendeArmadura."

### Tabela CriaArmadura - Normalização até a 3ª Forma Normal (3NF)

A tabela "CriaArmadura" foi normalizada até a 3ª Forma Normal (3NF) com base nas dependências funcionais identificadas. A seguir, descrevemos as etapas de normalização realizadas:

**Dependências Funcionais:**
- "IdCriaArmadura" é a chave primária, e, portanto, todos os outros atributos dependem funcionalmente dele.
- "Forja" é uma chave estrangeira que se relaciona com a tabela "Forja," estabelecendo uma dependência funcional em relação a "IdCriaArmadura" para criar a relação.
- "Armadura" é uma chave estrangeira que se relaciona com a tabela "Armadura," estabelecendo uma dependência funcional em relação a "IdCriaArmadura" para criar a relação.

**1. 1ª Forma Normal (1NF):** A tabela já estava na 1NF, uma vez que cada atributo contém apenas valores atômicos e não repetidos, e "IdCriaArmadura" é a chave primária.

**2. 2ª Forma Normal (2NF):** A 2NF não se aplica a esta tabela, pois não há chaves primárias compostas.

**3. 3ª Forma Normal (3NF):** A tabela está na 3NF, uma vez que as dependências funcionais identificadas foram tratadas. Cada atributo é diretamente dependente da chave primária "IdCriaArmadura." As chaves estrangeiras "Forja" e "Armadura" não afetam a normalização, pois estão relacionadas a outras tabelas.

Não há necessidade de continuar a normalização para a 4ª Forma Normal (4NF) ou a Forma Normal de Boyce-Codd (BCNF) nesta tabela, uma vez que não foram identificadas dependências funcionais adicionais.

Este é o estado final da normalização da tabela "CriaArmadura."

### Tabela Amuleto - Normalização até a 3ª Forma Normal (3NF)

A tabela "Amuleto" foi normalizada até a 3ª Forma Normal (3NF). A seguir, descrevemos as etapas de normalização realizadas:

**Dependências Funcionais:**
- "IdAmuleto" é a chave primária, e, portanto, todos os outros atributos dependem funcionalmente dele.

**1. 1ª Forma Normal (1NF):** A tabela já estava na 1NF, uma vez que cada atributo contém apenas valores atômicos e não repetidos, e "IdAmuleto" é a chave primária.

**2. 2ª Forma Normal (2NF):** A 2NF não se aplica a esta tabela, pois não há chaves primárias compostas.

**3. 3ª Forma Normal (3NF):** A tabela está na 3NF. Os atributos não primários não têm dependências transitivas e são diretamente dependentes da chave primária "IdAmuleto." Não foram identificadas dependências funcionais adicionais que justifiquem uma normalização mais profunda.

Não há necessidade de continuar a normalização para a 4ª Forma Normal (4NF) ou a Forma Normal de Boyce-Codd (BCNF) nesta tabela, uma vez que não foram identificadas dependências funcionais adicionais.

Este é o estado final da normalização da tabela "Amuleto."

### Tabela GuardaAmuleto - Normalização até a 3ª Forma Normal (3NF)

A tabela "GuardaAmuleto" foi normalizada até a 3ª Forma Normal (3NF) com base nas dependências funcionais identificadas. A seguir, descrevemos as etapas de normalização realizadas:

**Dependências Funcionais:**
- "IdGuardaAmuleto" é a chave primária, e, portanto, todos os outros atributos dependem funcionalmente dele.
- "Inventario" é uma chave estrangeira que se relaciona com a tabela "Inventario," estabelecendo uma dependência funcional em relação a "IdGuardaAmuleto" para criar a relação.
- "Amuleto" é uma chave estrangeira que se relaciona com a tabela "Amuleto," estabelecendo uma dependência funcional em relação a "IdGuardaAmuleto" para criar a relação.

**1. 1ª Forma Normal (1NF):** A tabela já estava na 1NF, uma vez que cada atributo contém apenas valores atômicos e não repetidos, e "IdGuardaAmuleto" é a chave primária.

**2. 2ª Forma Normal (2NF):** A 2NF não se aplica a esta tabela, pois não há chaves primárias compostas.

**3. 3ª Forma Normal (3NF):** A tabela está na 3NF. Os atributos não primários não têm dependências transitivas e são diretamente dependentes da chave primária "IdGuardaAmuleto." As chaves estrangeiras "Inventario" e "Amuleto" não afetam a normalização, pois estão relacionadas a outras tabelas.

Não há necessidade de continuar a normalização para a 4ª Forma Normal (4NF) ou a Forma Normal de Boyce-Codd (BCNF) nesta tabela, uma vez que não foram identificadas dependências funcionais adicionais.

Este é o estado final da normalização da tabela "GuardaAmuleto."

### Tabela UtilizaAmuleto - Normalização até a 3ª Forma Normal (3NF)

A tabela "UtilizaAmuleto" foi normalizada até a 3ª Forma Normal (3NF) com base nas dependências funcionais identificadas. A seguir, descrevemos as etapas de normalização realizadas:

**Dependências Funcionais:**
- "IdUtilizaAmuleto" é a chave primária, e, portanto, todos os outros atributos dependem funcionalmente dele.
- "PC" é uma chave estrangeira que se relaciona com a tabela "PC," estabelecendo uma dependência funcional em relação a "IdUtilizaAmuleto" para criar a relação.
- "Amuleto" é uma chave estrangeira que se relaciona com a tabela "Amuleto," estabelecendo uma dependência funcional em relação a "IdUtilizaAmuleto" para criar a relação.

**1. 1ª Forma Normal (1NF):** A tabela já estava na 1NF, uma vez que cada atributo contém apenas valores atômicos e não repetidos, e "IdUtilizaAmuleto" é a chave primária.

**2. 2ª Forma Normal (2NF):** A 2NF não se aplica a esta tabela, pois não há chaves primárias compostas.

**3. 3ª Forma Normal (3NF):** A tabela está na 3NF. Os atributos não primários não têm dependências transitivas e são diretamente dependentes da chave primária "IdUtilizaAmuleto." As chaves estrangeiras "PC" e "Amuleto" não afetam a normalização, pois estão relacionadas a outras tabelas.

Não há necessidade de continuar a normalização para a 4ª Forma Normal (4NF) ou a Forma Normal de Boyce-Codd (BCNF) nesta tabela, uma vez que não foram identificadas dependências funcionais adicionais.

Este é o estado final da normalização da tabela "UtilizaAmuleto."

### Tabela AmigatoAmuleto - Normalização até a 3ª Forma Normal (3NF)

A tabela "AmigatoAmuleto" foi normalizada até a 3ª Forma Normal (3NF) com base nas dependências funcionais identificadas. A seguir, descrevemos as etapas de normalização realizadas:

**Dependências Funcionais:**
- "IdAmigatoAmuleto" é a chave primária, e, portanto, todos os outros atributos dependem funcionalmente dele.
- "Amigato" é uma chave estrangeira que se relaciona com a tabela "Amigato," estabelecendo uma dependência funcional em relação a "IdAmigatoAmuleto" para criar a relação.
- "Amuleto" é uma chave estrangeira que se relaciona com a tabela "Amuleto," estabelecendo uma dependência funcional em relação a "IdAmigatoAmuleto" para criar a relação.

**1. 1ª Forma Normal (1NF):** A tabela já estava na 1NF, uma vez que cada atributo contém apenas valores atômicos e não repetidos, e "IdAmigatoAmuleto" é a chave primária.

**2. 2ª Forma Normal (2NF):** A 2NF não se aplica a esta tabela, pois não há chaves primárias compostas.

**3. 3ª Forma Normal (3NF):** A tabela está na 3NF. Os atributos não primários não têm dependências transitivas e são diretamente dependentes da chave primária "IdAmigatoAmuleto." As chaves estrangeiras "Amigato" e "Amuleto" não afetam a normalização, pois estão relacionadas a outras tabelas.

Não há necessidade de continuar a normalização para a 4ª Forma Normal (4NF) ou a Forma Normal de Boyce-Codd (BCNF) nesta tabela, uma vez que não foram identificadas dependências funcionais adicionais.

Este é o estado final da normalização da tabela "AmigatoAmuleto."

### Tabela VendeAmuleto - Normalização até a 3ª Forma Normal (3NF)

A tabela "VendeAmuleto" foi normalizada até a 3ª Forma Normal (3NF) com base nas dependências funcionais identificadas. A seguir, descrevemos as etapas de normalização realizadas:

**Dependências Funcionais:**
- "IdVendeAmuleto" é a chave primária, e, portanto, todos os outros atributos dependem funcionalmente dele.
- "Loja" é uma chave estrangeira que se relaciona com a tabela "Loja," estabelecendo uma dependência funcional em relação a "IdVendeAmuleto" para criar a relação.
- "Amuleto" é uma chave estrangeira que se relaciona com a tabela "Amuleto," estabelecendo uma dependência funcional em relação a "IdVendeAmuleto" para criar a relação.

**1. 1ª Forma Normal (1NF):** A tabela já estava na 1NF, uma vez que cada atributo contém apenas valores atômicos e não repetidos, e "IdVendeAmuleto" é a chave primária.

**2. 2ª Forma Normal (2NF):** A 2NF não se aplica a esta tabela, pois não há chaves primárias compostas.

**3. 3ª Forma Normal (3NF):** A tabela está na 3NF. Os atributos não primários não têm dependências transitivas e são diretamente dependentes da chave primária "IdVendeAmuleto." As chaves estrangeiras "Loja" e "Amuleto" não afetam a normalização, pois estão relacionadas a outras tabelas.

Não há necessidade de continuar a normalização para a 4ª Forma Normal (4NF) ou a Forma Normal de Boyce-Codd (BCNF) nesta tabela, uma vez que não foram identificadas dependências funcionais adicionais.

Este é o estado final da normalização da tabela "VendeAmuleto."

### Tabela CriaAmuleto - Normalização até a 3ª Forma Normal (3NF)

A tabela "CriaAmuleto" foi normalizada até a 3ª Forma Normal (3NF) com base nas dependências funcionais identificadas. A seguir, descrevemos as etapas de normalização realizadas:

**Dependências Funcionais:**
- "IdCriaAmuleto" é a chave primária, e, portanto, todos os outros atributos dependem funcionalmente dele.
- "Forja" é uma chave estrangeira que se relaciona com a tabela "Forja," estabelecendo uma dependência funcional em relação a "IdCriaAmuleto" para criar a relação.
- "Amuleto" é uma chave estrangeira que se relaciona com a tabela "Amuleto," estabelecendo uma dependência funcional em relação a "IdCriaAmuleto" para criar a relação.

**1. 1ª Forma Normal (1NF):** A tabela já estava na 1NF, uma vez que cada atributo contém apenas valores atômicos e não repetidos, e "IdCriaAmuleto" é a chave primária.

**2. 2ª Forma Normal (2NF):** A 2NF não se aplica a esta tabela, pois não há chaves primárias compostas.

**3. 3ª Forma Normal (3NF):** A tabela está na 3NF. Os atributos não primários não têm dependências transitivas e são diretamente dependentes da chave primária "IdCriaAmuleto." As chaves estrangeiras "Forja" e "Amuleto" não afetam a normalização, pois estão relacionadas a outras tabelas.

Não há necessidade de continuar a normalização para a 4ª Forma Normal (4NF) ou a Forma Normal de Boyce-Codd (BCNF) nesta tabela, uma vez que não foram identificadas dependências funcionais adicionais.

Este é o estado final da normalização da tabela "CriaAmuleto."

### Tabela Ferramenta - Normalização até a 3ª Forma Normal (3NF)

A tabela "Ferramenta" foi normalizada até a 3ª Forma Normal (3NF) com base nas dependências funcionais identificadas. A seguir, descrevemos as etapas de normalização realizadas:

**Dependências Funcionais:**
- "IdFerramenta" é a chave primária, e, portanto, todos os outros atributos dependem funcionalmente dele.

**1. 1ª Forma Normal (1NF):** A tabela já estava na 1NF, uma vez que cada atributo contém apenas valores atômicos e não repetidos, e "IdFerramenta" é a chave primária.

**2. 2ª Forma Normal (2NF):** A 2NF não se aplica a esta tabela, pois não há chaves primárias compostas.

**3. 3ª Forma Normal (3NF):** A tabela está na 3NF. Os atributos não primários não têm dependências transitivas e são diretamente dependentes da chave primária "IdFerramenta."

Não há necessidade de continuar a normalização para a 4ª Forma Normal (4NF) ou a Forma Normal de Boyce-Codd (BCNF) nesta tabela, uma vez que não foram identificadas dependências funcionais adicionais.

Este é o estado final da normalização da tabela "Ferramenta."

### Tabela GuardaFerramenta - Normalização até a 3ª Forma Normal (3NF)

A tabela "GuardaFerramenta" foi normalizada até a 3ª Forma Normal (3NF) com base nas dependências funcionais identificadas. A seguir, descrevemos as etapas de normalização realizadas:

**Dependências Funcionais:**
- "IdGuardaFerramenta" é a chave primária, e, portanto, todos os outros atributos dependem funcionalmente dele.
- "Inventario" é uma chave estrangeira que se relaciona com a tabela "Inventario," estabelecendo uma dependência funcional em relação a "IdGuardaFerramenta" para criar a relação.
- "Ferramenta" é uma chave estrangeira que se relaciona com a tabela "Ferramenta," estabelecendo uma dependência funcional em relação a "IdGuardaFerramenta" para criar a relação.

**1. 1ª Forma Normal (1NF):** A tabela já estava na 1NF, uma vez que cada atributo contém apenas valores atômicos e não repetidos, e "IdGuardaFerramenta" é a chave primária.

**2. 2ª Forma Normal (2NF):** A 2NF não se aplica a esta tabela, pois não há chaves primárias compostas.

**3. 3ª Forma Normal (3NF):** A tabela está na 3NF. Os atributos não primários não têm dependências transitivas e são diretamente dependentes da chave primária "IdGuardaFerramenta." As chaves estrangeiras "Inventario" e "Ferramenta" não afetam a normalização, pois estão relacionadas a outras tabelas.

Não há necessidade de continuar a normalização para a 4ª Forma Normal (4NF) ou a Forma Normal de Boyce-Codd (BCNF) nesta tabela, uma vez que não foram identificadas dependências funcionais adicionais.

Este é o estado final da normalização da tabela "GuardaFerramenta."

### Tabela UtilizaFerramenta - Normalização até a 3ª Forma Normal (3NF)

A tabela "UtilizaFerramenta" foi normalizada até a 3ª Forma Normal (3NF) com base nas dependências funcionais identificadas. A seguir, descrevemos as etapas de normalização realizadas:

**Dependências Funcionais:**
- "IdUtilizaFerramenta" é a chave primária, e, portanto, todos os outros atributos dependem funcionalmente dele.
- "PC" é uma chave estrangeira que se relaciona com a tabela "PC," estabelecendo uma dependência funcional em relação a "IdUtilizaFerramenta" para criar a relação.
- "Ferramenta" é uma chave estrangeira que se relaciona com a tabela "Ferramenta," estabelecendo uma dependência funcional em relação a "IdUtilizaFerramenta" para criar a relação.

**1. 1ª Forma Normal (1NF):** A tabela já estava na 1NF, uma vez que cada atributo contém apenas valores atômicos e não repetidos, e "IdUtilizaFerramenta" é a chave primária.

**2. 2ª Forma Normal (2NF):** A 2NF não se aplica a esta tabela, pois não há chaves primárias compostas.

**3. 3ª Forma Normal (3NF):** A tabela está na 3NF. Os atributos não primários não têm dependências transitivas e são diretamente dependentes da chave primária "IdUtilizaFerramenta." As chaves estrangeiras "PC" e "Ferramenta" não afetam a normalização, pois estão relacionadas a outras tabelas.

Não há necessidade de continuar a normalização para a 4ª Forma Normal (4NF) ou a Forma Normal de Boyce-Codd (BCNF) nesta tabela, uma vez que não foram identificadas dependências funcionais adicionais.

Este é o estado final da normalização da tabela "UtilizaFerramenta."

### Tabela AmigatoFerramenta - Normalização até a 3ª Forma Normal (3NF)

A tabela "AmigatoFerramenta" foi normalizada até a 3ª Forma Normal (3NF) com base nas dependências funcionais identificadas. A seguir, descrevemos as etapas de normalização realizadas:

**Dependências Funcionais:**
- "IdAmigatoFerramenta" é a chave primária, e, portanto, todos os outros atributos dependem funcionalmente dele.
- "Amigato" é uma chave estrangeira que se relaciona com a tabela "Amigato," estabelecendo uma dependência funcional em relação a "IdAmigatoFerramenta" para criar a relação.
- "Ferramenta" é uma chave estrangeira que se relaciona com a tabela "Ferramenta," estabelecendo uma dependência funcional em relação a "IdAmigatoFerramenta" para criar a relação.

**1. 1ª Forma Normal (1NF):** A tabela já estava na 1NF, uma vez que cada atributo contém apenas valores atômicos e não repetidos, e "IdAmigatoFerramenta" é a chave primária.

**2. 2ª Forma Normal (2NF):** A 2NF não se aplica a esta tabela, pois não há chaves primárias compostas.

**3. 3ª Forma Normal (3NF):** A tabela está na 3NF. Os atributos não primários não têm dependências transitivas e são diretamente dependentes da chave primária "IdAmigatoFerramenta." As chaves estrangeiras "Amigato" e "Ferramenta" não afetam a normalização, pois estão relacionadas a outras tabelas.

Não há necessidade de continuar a normalização para a 4ª Forma Normal (4NF) ou a Forma Normal de Boyce-Codd (BCNF) nesta tabela, uma vez que não foram identificadas dependências funcionais adicionais.

Este é o estado final da normalização da tabela "AmigatoFerramenta."

### Tabela VendeFerramenta - Normalização até a 3ª Forma Normal (3NF)

A tabela "VendeFerramenta" foi normalizada até a 3ª Forma Normal (3NF) com base nas dependências funcionais identificadas. A seguir, descrevemos as etapas de normalização realizadas:

**Dependências Funcionais:**
- "IdVendeFerramenta" é a chave primária, e, portanto, todos os outros atributos dependem funcionalmente dele.
- "Loja" é uma chave estrangeira que se relaciona com a tabela "Loja," estabelecendo uma dependência funcional em relação a "IdVendeFerramenta" para criar a relação.
- "Ferramenta" é uma chave estrangeira que se relaciona com a tabela "Ferramenta," estabelecendo uma dependência funcional em relação a "IdVendeFerramenta" para criar a relação.

**1. 1ª Forma Normal (1NF):** A tabela já estava na 1NF, uma vez que cada atributo contém apenas valores atômicos e não repetidos, e "IdVendeFerramenta" é a chave primária.

**2. 2ª Forma Normal (2NF):** A 2NF não se aplica a esta tabela, pois não há chaves primárias compostas.

**3. 3ª Forma Normal (3NF):** A tabela está na 3NF. Os atributos não primários não têm dependências transitivas e são diretamente dependentes da chave primária "IdVendeFerramenta." As chaves estrangeiras "Loja" e "Ferramenta" não afetam a normalização, pois estão relacionadas a outras tabelas.

Não há necessidade de continuar a normalização para a 4ª Forma Normal (4NF) ou a Forma Normal de Boyce-Codd (BCNF) nesta tabela, uma vez que não foram identificadas dependências funcionais adicionais.

Este é o estado final da normalização da tabela "VendeFerramenta."

### Tabela Habilidade - Normalização até a 3ª Forma Normal (3NF)

A tabela "Habilidade" foi normalizada até a 3ª Forma Normal (3NF) com base nas dependências funcionais identificadas. A seguir, descrevemos as etapas de normalização realizadas:

**Dependências Funcionais:**
- "IdHabilidade" é a chave primária, e, portanto, todos os outros atributos dependem funcionalmente dele.

**1. 1ª Forma Normal (1NF):** A tabela já estava na 1NF, uma vez que cada atributo contém apenas valores atômicos e não repetidos, e "IdHabilidade" é a chave primária.

**2. 2ª Forma Normal (2NF):** A 2NF não se aplica a esta tabela, pois não há chaves primárias compostas.

**3. 3ª Forma Normal (3NF):** A tabela está na 3NF. Os atributos não primários não têm dependências transitivas e são diretamente dependentes da chave primária "IdHabilidade."

Não há necessidade de continuar a normalização para a 4ª Forma Normal (4NF) ou a Forma Normal de Boyce-Codd (BCNF) nesta tabela, uma vez que não foram identificadas dependências funcionais adicionais.

Este é o estado final da normalização da tabela "Habilidade."
.

### Tabela HabilidadeAmuleto - Normalização até a 3ª Forma Normal (3NF)

A tabela "HabilidadeAmuleto" foi normalizada até a 3ª Forma Normal (3NF) com base nas dependências funcionais identificadas. A seguir, descrevemos as etapas de normalização realizadas:

**Dependências Funcionais:**
- "IdHabilidadeAmuleto" é a chave primária, e, portanto, todos os outros atributos dependem funcionalmente dele.
- "Amuleto" é uma chave estrangeira que se relaciona com a tabela "Amuleto," estabelecendo uma dependência funcional em relação a "IdHabilidadeAmuleto" para criar a relação.
- "Habilidade" é uma chave estrangeira que se relaciona com a tabela "Habilidade," estabelecendo uma dependência funcional em relação a "IdHabilidadeAmuleto" para criar a relação.

**1. 1ª Forma Normal (1NF):** A tabela já estava na 1NF, uma vez que cada atributo contém apenas valores atômicos e não repetidos, e "IdHabilidadeAmuleto" é a chave primária.

**2. 2ª Forma Normal (2NF):** A 2NF não se aplica a esta tabela, pois não há chaves primárias compostas.

**3. 3ª Forma Normal (3NF):** A tabela está na 3NF. Os atributos não primários não têm dependências transitivas e são diretamente dependentes da chave primária "IdHabilidadeAmuleto." As chaves estrangeiras "Amuleto" e "Habilidade" não afetam a normalização, pois estão relacionadas a outras tabelas.

Não há necessidade de continuar a normalização para a 4ª Forma Normal (4NF) ou a Forma Normal de Boyce-Codd (BCNF) nesta tabela, uma vez que não foram identificadas dependências funcionais adicionais.

Este é o estado final da normalização da tabela "HabilidadeAmuleto."

### Tabela HabilidadeArmadura - Normalização até a 3ª Forma Normal (3NF)

A tabela "HabilidadeArmadura" foi normalizada até a 3ª Forma Normal (3NF) com base nas dependências funcionais identificadas. A seguir, descrevemos as etapas de normalização realizadas:

**Dependências Funcionais:**
- "IdHabilidadeArmadura" é a chave primária, e, portanto, todos os outros atributos dependem funcionalmente dele.
- "Armadura" é uma chave estrangeira que se relaciona com a tabela "Armadura," estabelecendo uma dependência funcional em relação a "IdHabilidadeArmadura" para criar a relação.
- "Habilidade" é uma chave estrangeira que se relaciona com a tabela "Habilidade," estabelecendo uma dependência funcional em relação a "IdHabilidadeArmadura" para criar a relação.

**1. 1ª Forma Normal (1NF):** A tabela já estava na 1NF, uma vez que cada atributo contém apenas valores atômicos e não repetidos, e "IdHabilidadeArmadura" é a chave primária.

**2. 2ª Forma Normal (2NF):** A 2NF não se aplica a esta tabela, pois não há chaves primárias compostas.

**3. 3ª Forma Normal (3NF):** A tabela está na 3NF. Os atributos não primários não têm dependências transitivas e são diretamente dependentes da chave primária "IdHabilidadeArmadura." As chaves estrangeiras "Armadura" e "Habilidade" não afetam a normalização, pois estão relacionadas a outras tabelas.

Não há necessidade de continuar a normalização para a 4ª Forma Normal (4NF) ou a Forma Normal de Boyce-Codd (BCNF) nesta tabela, uma vez que não foram identificadas dependências funcionais adicionais.

Este é o estado final da normalização da tabela "HabilidadeArmadura."




