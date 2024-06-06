# 1 - Cenário

 O sistema de banco de dados para "Slime Datta Ken" gerencia entidades como casas (id_casa - número, bairro, rua), personagens (id_personagem - nome, data de nascimento, raça, idade), habilidades (id_habilidade - nome, tipo, nível de poder), itens (id_item - nome, tipo, efeito), locais (id_local - nome, tipo, descrição), eventos (id_evento - nome, data, descrição) e e-mails (id_email - endereço de e-mail). Cada entidade possui atributos específicos, como número e localização para casas, nome e raça para personagens, e nome e efeito para itens. Relacionamentos são estabelecidos, como a residência de um personagem em uma casa, a posse de habilidades e itens por parte dos personagens, e a participação em eventos. Essa estrutura permite um acompanhamento detalhado das interações entre os elementos do universo de "Slime Datta Ken", garantindo uma experiência coesa e imersiva para os usuários.

# 2 - Modelagem Conceitual
<img src="./imagens/ConceitualSlimeDatta.png" width="100%" />

# 3 - Modelagem Lógica
<img src="./imagens/LógicoSlimeDatta.png" width="100%" />

# 4 - Modelagem Física
```sql
CREATE DATABASE SlimeDatta;
USE SlimeDatta;

CREATE TABLE casa (
  id_casa            INT             IDENTITY	 PRIMARY KEY,
  numero             INT			 NOT NULL,
  bairro             VARCHAR(40),
  rua                VARCHAR(60)
);

CREATE TABLE personagem (
  id_personagem      INT             IDENTITY    PRIMARY KEY,
  nome               VARCHAR(100),
  data_nascimento    DATE,
  raca               VARCHAR(100),
  id_casa            INT			 FOREIGN KEY REFERENCES casa(id_casa),
  idade              AS DATEDIFF(YEAR, data_nascimento, GETDATE())
);

CREATE TABLE registro (
  id_registro        INT             IDENTITY	 PRIMARY KEY,
  numero_registro    INT,
  id_personagem      INT             UNIQUE,
  FOREIGN KEY (id_personagem) REFERENCES personagem(id_personagem)
);

CREATE TABLE habilidade (
  id_habilidade      INT             IDENTITY    PRIMARY KEY,
  nome               VARCHAR(40),
  tipo               VARCHAR(20),
  nivel_poder        INT
);

CREATE TABLE item (
  id_item            INT             IDENTITY    PRIMARY KEY,
  nome               VARCHAR(40),
  tipo               VARCHAR(20),
  efeito             VARCHAR(60)
);

CREATE TABLE local (
  id_local           INT             IDENTITY    PRIMARY KEY,
  nome               VARCHAR(40),
  tipo               VARCHAR(20),
  descricao          VARCHAR(60)
);

CREATE TABLE evento (
  id_evento          INT             IDENTITY    PRIMARY KEY,
  nome               VARCHAR(40),
  data               DATE,
  descricao          VARCHAR(60)
);

CREATE TABLE email (
  id_email           INT             IDENTITY    PRIMARY KEY,
  id_personagem      INT,
  endereco_email     VARCHAR(255),
  FOREIGN KEY (id_personagem) REFERENCES personagem(id_personagem)
);

CREATE TABLE possui (
  id_personagem      INT,
  id_habilidade      INT,
  PRIMARY KEY (id_personagem, id_habilidade),
  FOREIGN KEY (id_personagem) REFERENCES personagem(id_personagem),
  FOREIGN KEY (id_habilidade) REFERENCES habilidade(id_habilidade)
);

CREATE TABLE usa (
  id_personagem      INT,
  id_item            INT,
  PRIMARY KEY (id_personagem, id_item),
  FOREIGN KEY (id_personagem) REFERENCES personagem(id_personagem),
  FOREIGN KEY (id_item) REFERENCES item(id_item)
);

CREATE TABLE esteve (
  id_personagem      INT,
  id_local           INT,
  PRIMARY KEY (id_personagem, id_local),
  FOREIGN KEY (id_personagem) REFERENCES personagem(id_personagem),
  FOREIGN KEY (id_local) REFERENCES local(id_local)
);

CREATE TABLE participa (
  id_personagem      INT,
  id_evento          INT,
  PRIMARY KEY (id_personagem, id_evento),
  FOREIGN KEY (id_personagem) REFERENCES personagem(id_personagem),
  FOREIGN KEY (id_evento) REFERENCES evento(id_evento)
);
```

# 5 - Inserção de Dados
```sql
-- Inserindo dados na tabela Personagem
INSERT INTO Personagem (id_personagem, nome, data_nascimento, raca) VALUES
(1, 'Rimuru Tempest', '1720-01-01', 'Slime'),
(2, 'Shizu', '1995-05-10', 'Humana'),
(3, 'Benimaru', '1998-02-14', 'Oni'),
(4, 'Shion', '1997-03-12', 'Oni'),
(5, 'Gobta', '2001-05-01', 'Goblin'),
(6, 'Ranga', '2000-06-18', 'Lobo Tempest'),
(7, 'Souei', '1996-07-21', 'Oni'),
(8, 'Hakurou', '1945-08-19', 'Oni'),
(9, 'Milim Nava', '1500-09-01', 'Dragonoid'),
(10, 'Diablo', '1700-10-10', 'Demônio'),
(11, 'Geld', '1985-11-25', 'Orc'),
(12, 'Treyni', '1800-12-15', 'Dryad'),
(13, 'Garm', '1992-01-17', 'Dwarf'),
(14, 'Kaijin', '1989-02-28', 'Dwarf'),
(15, 'Vesta', '1990-03-03', 'Dwarf'),
(16, 'Rigurd', '1950-04-04', 'Goblin'),
(17, 'Beretta', '1750-05-05', 'Homúnculo'),
(18, 'Gabil', '1980-06-06', 'Dragonewt'),
(19, 'Albis', '1994-07-07', 'Snake'),
(20, 'Phobio', '1995-08-08', 'Beastman');

-- Inserindo dados na tabela Habilidade
INSERT INTO Habilidade (id_habilidade, nome, tipo, nivel_poder) VALUES
(1, 'Predator', 'Ataque', 10),
(2, 'Great Sage', 'Suporte', 9),
(3, 'Black Lightning', 'Ataque', 8),
(4, 'Megiddo', 'Ataque', 10),
(5, 'Clairvoyance', 'Suporte', 7),
(6, 'Dragon Power', 'Ataque', 10),
(7, 'Demon Lord\s Haki', 'Ataque', 9),
(8, 'Healing', 'Suporte', 6),
(9, 'Water Blade', 'Ataque', 7),
(10, 'Shadow Motion', 'Ataque', 8);

-- Inserindo dados na tabela Item
INSERT INTO Item (id_item, nome, tipo, efeito) VALUES
(1, 'Potion', 'Cura', 'Recupera HP'),
(2, 'Magic Sword', 'Ataque', 'Aumenta dano'),
(3, 'Shield', 'Defesa', 'Aumenta defesa'),
(4, 'Mana Potion', 'Cura', 'Recupera MP'),
(5, 'Fire Scroll', 'Ataque', 'Lança uma bola de fogo'),
(6, 'Ice Amulet', 'Defesa', 'Resiste ao gelo'),
(7, 'Ring of Strength', 'Ataque', 'Aumenta força'),
(8, 'Elixir of Life', 'Cura', 'Recupera completamente HP e MP'),
(9, 'Stealth Cloak', 'Suporte', 'Torna invisível por um tempo'),
(10, 'Boots of Speed', 'Suporte', 'Aumenta a velocidade de movimento');

-- Inserindo dados na tabela Local
INSERT INTO Local (id_local, nome, tipo, descricao) VALUES
(1, 'Tempest', 'Cidade', 'Cidade principal dos monstros'),
(2, 'Floresta Jura', 'Floresta', 'Grande floresta onde Rimuru chegou'),
(3, 'Dwargon', 'Cidade', 'Cidade dos anões'),
(4, 'Farmenas', 'Cidade', 'Reino dos humanos'),
(5, 'Caverna dos Espíritos', 'Caverna', 'Lar dos espíritos elementais'),
(6, 'Vulcão Magma', 'Vulcão', 'Vulcão ativo onde vivem os Ifrits'),
(7, 'Lago Azul', 'Lago', 'Lago de águas cristalinas'),
(8, 'Vale Sombrio', 'Vale', 'Vale onde a luz do sol raramente chega'),
(9, 'Montanha Nebulosa', 'Montanha', 'Montanha coberta de neblina'),
(10, 'Ruínas Antigas', 'Ruínas', 'Ruínas de uma antiga civilização');

-- Inserindo dados na tabela Evento
INSERT INTO Evento (id_evento, nome, data, descricao) VALUES
(1, 'Fundação de Tempest', '2020-01-01', 'Fundação da cidade de Tempest'),
(2, 'Batalha contra Orc Lord', '2020-06-01', 'Grande batalha contra Orc Lord'),
(3, 'Confronto com Charybdis', '2021-02-15', 'Batalha contra o monstro Charybdis'),
(4, 'Invasão de Clayman', '2021-07-20', 'Invasão liderada pelo Lorde Demônio Clayman'),
(5, 'Aliança com Dwargon', '2019-12-01', 'Formação de uma aliança com o reino dos anões'),
(6, 'Festival de Tempest', '2021-09-10', 'Primeiro festival da cidade de Tempest'),
(7, 'Encontro com Milim', '2020-03-05', 'Primeiro encontro com a Lorde Demônio Milim Nava'),
(8, 'Aparição de Veldora', '2022-01-01', 'Libertação do dragão Veldora'),
(9, 'Conquista de Farmenas', '2021-05-25', 'Conquista do reino de Farmenas'),
(10, 'Derrota de Hinata', '2021-11-11', 'Batalha e derrota de Hinata Sakaguchi');

-- Inserindo dados na tabela Personagem_Habilidade
INSERT INTO possui(id_personagem, id_habilidade) VALUES
(1, 1),
(1, 2),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 6),
(10, 7),
(11, 9),
(12, 10),
(13, 9),
(14, 10),
(15, 8),
(16, 5),
(17, 3),
(18, 4),
(19, 2),
(20, 1);

-- Inserindo dados na tabela Personagem_Item
INSERT INTO usa (id_personagem, id_item) VALUES
(1, 1),
(1, 2),
(2, 1),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 1),
(12, 2),
(13, 3),
(14, 4),
(15, 5),
(16, 6),
(17, 7),
(18, 8),
(19, 9),
(20, 10);

-- Inserindo dados na tabela Personagem_Local
INSERT INTO esteve (id_personagem, id_local) VALUES
(1, 1),
(1, 2),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 1),
(12, 2),
(13, 3),
(14, 4),
(15, 5),
(16, 6),
(17, 7),
(18, 8),
(19, 9),
(20, 10);

-- Inserindo dados na tabela Personagem_Evento
INSERT INTO participa (id_personagem, id_evento) VALUES
(1, 1),
(1, 2),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 1),
(12, 2),
(13, 3),
(14, 4),
(15, 5),
(16, 6),
(17, 7),
(18, 8),
(19, 9),
(20, 10);

-- Inserindo e-mails na tabela Email
INSERT INTO email (id_personagem, endereco_email) VALUES
(1, 'rimuru.tempest@example.com'),
(1, 'rimuru.tempest@tempestcity.com'),
(2, 'shizu@example.com'),
(2, 'shizu@florestajura.com'),
(3, 'benimaru@example.com'),
(3, 'benimaru@oni.com'),
(4, 'shion@example.com'),
(4, 'shion@oni.com'),
(5, 'gobta@example.com'),
(5, 'gobta@goblin.com'),
(6, 'ranga@example.com'),
(6, 'ranga@lobotempest.com'),
(7, 'souei@example.com'),
(7, 'souei@oni.com'),
(8, 'hakurou@example.com'),
(8, 'hakurou@oni.com'),
(9, 'milim.nava@example.com'),
(9, 'milim.nava@dragonoid.com'),
(10, 'diablo@example.com'),
(10, 'diablo@demon.com'),
(11, 'geld@example.com'),
(11, 'geld@orc.com'),
(12, 'treyni@example.com'),
(12, 'treyni@dryad.com'),
(13, 'garm@example.com'),
(13, 'garm@dwarf.com'),
(14, 'kaijin@example.com'),
(14, 'kaijin@dwarf.com'),
(15, 'vesta@example.com'),
(15, 'vesta@dwarf.com'),
(16, 'rigurd@example.com'),
(16, 'rigurd@goblin.com'),
(17, 'beretta@example.com'),
(17, 'beretta@homunculo.com'),
(18, 'gabil@example.com'),
(18, 'gabil@dragonewt.com'),
(19, 'albis@example.com'),
(19, 'albis@snake.com'),
(20, 'phobio@example.com'),
(20, 'phobio@beastman.com');

-- Outra rodada de e-mails
INSERT INTO email (id_personagem, endereco_email) VALUES
(1, 'rimuru.alt@example.com'),
(2, 'shizu.alt@example.com'),
(3, 'benimaru.alt@example.com'),
(4, 'shion.alt@example.com'),
(5, 'gobta.alt@example.com'),
(6, 'ranga.alt@example.com'),
(7, 'souei.alt@example.com'),
(8, 'hakurou.alt@example.com'),
(9, 'milim.nava.alt@example.com'),
(10, 'diablo.alt@example.com'),
(11, 'geld.alt@example.com'),
(12, 'treyni.alt@example.com'),
(13, 'garm.alt@example.com'),
(14, 'kaijin.alt@example.com'),
(15, 'vesta.alt@example.com'),
(16, 'rigurd.alt@example.com'),
(17, 'beretta.alt@example.com'),
(18, 'gabil.alt@example.com'),
(19, 'albis.alt@example.com'),
(20, 'phobio.alt@example.com');
```

# 6 - CRUD
### 1. Inserção de Dados
### Inserir um novo personagem:

```sql
INSERT INTO personagem (nome, data_nascimento, raca) VALUES
('Gobuta', '2000-01-01', 'Lobo');
```

### Inserir uma nova habilidade:
```sql
INSERT INTO habilidade (nome, tipo, nivel_poder) VALUES
('Gula', 'Defesa', 5);
```

### Inserir um novo item:
```sql
INSERT INTO item (nome, tipo, efeito) VALUES
('Espada do Heroi', 'Ataque', 'Ao acertar um atk a ambos no duelo morrem');
```

### 2. Leitura de Dados Inserção
### Selecionar todos os personagens:
```sql
SELECT * FROM personagem
SELECT * FROM habilidade
SELECT * FROM item
```
<img src="./imagens/ConceitualSlimeDatta.png" width="100%" />

### 3. Atualização de Dados
### Atualizar a raça de um personagem:
```sql
UPDATE personagem
SET raca = 'Goblin'
WHERE nome = 'Gobuta';
```

### 4. Leitura de Dados Atualização
### Selecionar todos os personagens:
```sql
SELECT * FROM personagem
WHERE nome = 'Gobuta';
```
<img src="./imagens/ConceitualSlimeDatta.png" width="100%" />

### 5. Deleção de Dados
### Excluir um personagem:
```sql
DELETE FROM personagem
WHERE nome = 'Gobuta';
```

### 6. Leitura de Dados Deleção
### Selecionar todos os personagens:
```sql
SELECT * FROM personagem;
```
<img src="./imagens/ConceitualSlimeDatta.png" width="100%" />


## 7 - Relatórios

### 1. Consulta com Junção entre Personagem e Habilidade
Descrição: Esta consulta retorna todos os personagens junto com suas habilidades correspondentes.
```sql
SELECT p.nome AS Personagem, h.nome AS Habilidade
FROM personagem p
JOIN possui ph ON p.id_personagem = ph.id_personagem
JOIN habilidade h ON ph.id_habilidade = h.id_habilidade;
```

### 2. Consulta com Filtro em Personagem e Item
Descrição: Esta consulta retorna todos os personagens que possuem itens do tipo 'Ataque'.
```sql
SELECT p.nome AS Personagem, i.nome AS Item
FROM personagem p
JOIN usa pi ON p.id_personagem = pi.id_personagem
JOIN item i ON pi.id_item = i.id_item
WHERE i.tipo = 'Ataque';
```
<img src="./imagens/ConceitualSlimeDatta.png" width="100%" />

### 3. Consulta com Ordenação em Personagem e Evento
Descrição: Esta consulta retorna todos os eventos e os personagens que participaram, ordenados pela data do evento.
```sql
SELECT e.nome AS Evento, p.nome AS Personagem
FROM evento e
JOIN participa pe ON e.id_evento = pe.id_evento
JOIN personagem p ON pe.id_personagem = p.id_personagem
ORDER BY e.data;
```
<img src="./imagens/ConceitualSlimeDatta.png" width="100%" />

### 4. Consulta de Personagem com Mais de Uma Habilidade
Descrição: Esta consulta retorna os personagens que possuem mais de uma habilidade.
```sql
SELECT p.nome AS Personagem, COUNT(ph.id_habilidade) AS NumeroDeHabilidades
FROM personagem p
JOIN possui ph ON p.id_personagem = ph.id_personagem
GROUP BY p.nome
HAVING COUNT(ph.id_habilidade) > 1;
```
<img src="./imagens/ConceitualSlimeDatta.png" width="100%" />

### 5. Consulta de Personagens com Data de Nascimento Filtrada
Descrição: Esta consulta retorna os personagens que nasceram antes do ano 1900.
```sql
SELECT nome, data_nascimento
FROM personagem
WHERE data_nascimento < '1900-01-01';
```
<img src="./imagens/ConceitualSlimeDatta.png" width="100%" />

### 6. Consulta de Habilidades com Nível de Poder Maior que 4
Descrição: Esta consulta retorna habilidades cujo nível de poder é maior que 4.
```sql
SELECT nome, tipo, nivel_poder
FROM habilidade
WHERE nivel_poder > 4;
```
<img src="./imagens/ConceitualSlimeDatta.png" width="100%" />

### 7. Consulta de Itens com Tipo Específico
Descrição: Esta consulta retorna itens do tipo 'Cura'.
```sql
SELECT nome, tipo, efeito
FROM item
WHERE tipo = 'Cura';
```
<img src="./imagens/ConceitualSlimeDatta.png" width="100%" />

### 8. Consulta de Personagem e Locais Visitados
Descrição: Esta consulta retorna todos os locais visitados por cada personagem.
```sql
SELECT l.nome AS Local, p.nome AS Personagem
FROM local l
JOIN esteve pl ON l.id_local = pl.id_local
JOIN personagem p ON pl.id_personagem = p.id_personagem;
```
<img src="./imagens/ConceitualSlimeDatta.png" width="100%" />

### 9. Consulta de Eventos em um Intervalo de Data
Descrição: Esta consulta retorna eventos que ocorreram entre 2020 e 2021.
```sql
SELECT nome, data, descricao
FROM evento
WHERE data BETWEEN '2020-01-01' AND '2021-12-31';
```
<img src="./imagens/ConceitualSlimeDatta.png" width="100%" />

### 10. Consulta de E-mails Associados a Personagens
Descrição: Esta consulta retorna todos os personagens e seus e-mails associados.
```sql
SELECT p.nome AS Personagem, e.endereco_email AS Email
FROM personagem p
JOIN email e ON p.id_personagem = e.id_personagem;
```
<img src="./imagens/ConceitualSlimeDatta.png" width="100%" />
