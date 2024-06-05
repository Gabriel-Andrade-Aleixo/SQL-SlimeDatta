CREATE DATABASE SlimeDatta;
USE SlimeDatta;

CREATE TABLE personagem (
  id_personagem      INT             IDENTITY    PRIMARY KEY,
  nome               VARCHAR(100),
  data_nascimento    DATE,
  raca               VARCHAR(100),
  idade              AS DATEDIFF(YEAR, data_nascimento, GETDATE())
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


-- Inserindo dados na tabela Personagem
INSERT INTO Personagem (nome, data_nascimento, raca) VALUES
('Rimuru Tempest', '1720-01-01', 'Slime'),
('Shizu', '1995-05-10', 'Humana'),
('Benimaru', '1998-02-14', 'Oni'),
('Shion', '1997-03-12', 'Oni'),
('Gobta', '2001-05-01', 'Goblin'),
('Ranga', '2000-06-18', 'Lobo Tempest'),
('Souei', '1996-07-21', 'Oni'),
('Hakurou', '1945-08-19', 'Oni'),
('Milim Nava', '1500-09-01', 'Dragonoid'),
('Diablo', '1700-10-10', 'Demônio'),
('Geld', '1985-11-25', 'Orc'),
('Treyni', '1800-12-15', 'Dryad'),
('Garm', '1992-01-17', 'Dwarf'),
('Kaijin', '1989-02-28', 'Dwarf'),
('Vesta', '1990-03-03', 'Dwarf'),
('Rigurd', '1950-04-04', 'Goblin'),
('Beretta', '1750-05-05', 'Homúnculo'),
('Gabil', '1980-06-06', 'Dragonewt'),
('Albis', '1994-07-07', 'Snake'),
('Phobio', '1995-08-08', 'Beastman');

-- Inserindo dados na tabela Habilidade
INSERT INTO Habilidade (nome, tipo, nivel_poder) VALUES
('Predator', 'Ataque', 10),
('Great Sage', 'Suporte', 9),
('Black Lightning', 'Ataque', 8),
('Megiddo', 'Ataque', 10),
('Clairvoyance', 'Suporte', 7),
('Dragon Power', 'Ataque', 10),
('Demon Lords Haki', 'Ataque', 9),
('Healing', 'Suporte', 6),
('Water Blade', 'Ataque', 7),
('Shadow Motion', 'Ataque', 8);

-- Inserindo dados na tabela Item
INSERT INTO Item (nome, tipo, efeito) VALUES
('Potion', 'Cura', 'Recupera HP'),
('Magic Sword', 'Ataque', 'Aumenta dano'),
('Shield', 'Defesa', 'Aumenta defesa'),
('Mana Potion', 'Cura', 'Recupera MP'),
('Fire Scroll', 'Ataque', 'Lança uma bola de fogo'),
('Ice Amulet', 'Defesa', 'Resiste ao gelo'),
('Ring of Strength', 'Ataque', 'Aumenta força'),
('Elixir of Life', 'Cura', 'Recupera completamente HP e MP'),
('Stealth Cloak', 'Suporte', 'Torna invisível por um tempo'),
('Boots of Speed', 'Suporte', 'Aumenta a velocidade de movimento');

-- Inserindo dados na tabela Local
INSERT INTO Local (nome, tipo, descricao) VALUES
('Tempest', 'Cidade', 'Cidade principal dos monstros'),
('Floresta Jura', 'Floresta', 'Grande floresta onde Rimuru chegou'),
('Dwargon', 'Cidade', 'Cidade dos anões'),
('Farmenas', 'Cidade', 'Reino dos humanos'),
('Caverna dos Espíritos', 'Caverna', 'Lar dos espíritos elementais'),
('Vulcão Magma', 'Vulcão', 'Vulcão ativo onde vivem os Ifrits'),
('Lago Azul', 'Lago', 'Lago de águas cristalinas'),
('Vale Sombrio', 'Vale', 'Vale onde a luz do sol raramente chega'),
('Montanha Nebulosa', 'Montanha', 'Montanha coberta de neblina'),
('Ruínas Antigas', 'Ruínas', 'Ruínas de uma antiga civilização');

-- Inserindo dados na tabela Evento
INSERT INTO Evento (nome, data, descricao) VALUES
('Fundação de Tempest', '2020-01-01', 'Fundação da cidade de Tempest'),
('Batalha contra Orc Lord', '2020-06-01', 'Grande batalha contra Orc Lord'),
('Confronto com Charybdis', '2021-02-15', 'Batalha contra o monstro Charybdis'),
('Invasão de Clayman', '2021-07-20', 'Invasão liderada pelo Lorde Demônio Clayman'),
('Aliança com Dwargon', '2019-12-01', 'Formação de uma aliança com o reino dos anões'),
('Festival de Tempest', '2021-09-10', 'Primeiro festival da cidade de Tempest'),
('Encontro com Milim', '2020-03-05', 'Primeiro encontro com a Lorde Demônio Milim Nava'),
('Aparição de Veldora', '2022-01-01', 'Libertação do dragão Veldora'),
('Conquista de Farmenas', '2021-05-25', 'Conquista do reino de Farmenas'),
('Derrota de Hinata', '2021-11-11', 'Batalha e derrota de Hinata Sakaguchi');

-- Inserindo dados na tabela Possui
INSERT INTO possui (id_personagem, id_habilidade) VALUES
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

-- Inserindo dados na tabela Usa
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

-- Inserindo dados na tabela Esteve
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

-- Inserindo dados na tabela Participa
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


-- CRUD
-- Inserir um novo personagem:
INSERT INTO personagem (nome, data_nascimento, raca) VALUES
('Gobuta', '2000-01-01', 'Lobo');

--Inserir uma nova habilidade:
INSERT INTO habilidade (nome, tipo, nivel_poder) VALUES
('Gula', 'Defesa', 5);

-- Inserir um novo item:
INSERT INTO item (nome, tipo, efeito) VALUES
('Espada do Heroi', 'Ataque', 'Ao acertar um atk a ambos no duelo morrem');

SELECT * FROM personagem
SELECT * FROM habilidade
SELECT * FROM item


-- Selecionar todos os personagens:
SELECT * FROM personagem;

-- Atualizar a raça de um personagem:
UPDATE personagem
SET raca = 'Goblin'
WHERE nome = 'Gobuta';

SELECT * FROM personagem
WHERE nome = 'Gobuta';

-- Excluir um personagem:
DELETE FROM personagem
WHERE nome = 'Gobuta';

SELECT * FROM personagem;

-- Relatórios
--1. Consulta com Junção entre Personagem e Habilidade
SELECT p.nome AS Personagem, h.nome AS Habilidade
FROM personagem p
JOIN possui ph ON p.id_personagem = ph.id_personagem
JOIN habilidade h ON ph.id_habilidade = h.id_habilidade;


-- 2. Consulta com Filtro em Personagem e Item
SELECT p.nome AS Personagem, i.nome AS Item
FROM personagem p
JOIN usa pi ON p.id_personagem = pi.id_personagem
JOIN item i ON pi.id_item = i.id_item
WHERE i.tipo = 'Ataque';

-- 3. Consulta com Ordenação em Personagem e Evento
SELECT e.nome AS Evento, p.nome AS Personagem
FROM evento e
JOIN participa pe ON e.id_evento = pe.id_evento
JOIN personagem p ON pe.id_personagem = p.id_personagem
ORDER BY e.data;

--4. Consulta de Personagem com Mais de Uma Habilidade
SELECT p.nome AS Personagem, COUNT(ph.id_habilidade) AS NumeroDeHabilidades
FROM personagem p
JOIN possui ph ON p.id_personagem = ph.id_personagem
GROUP BY p.nome
HAVING COUNT(ph.id_habilidade) > 1;

--5. Consulta de Personagens com Data de Nascimento Filtrada
SELECT nome, data_nascimento
FROM personagem
WHERE data_nascimento < '1900-01-01';

--6. Consulta de Habilidades com Nível de Poder Maior que 4
SELECT nome, tipo, nivel_poder
FROM habilidade
WHERE nivel_poder > 4;

--7. Consulta de Itens com Tipo Específico
SELECT nome, tipo, efeito
FROM item
WHERE tipo = 'Cura';

--8. Consulta de Personagem e Locais Visitados
SELECT l.nome AS Local, p.nome AS Personagem
FROM local l
JOIN esteve pl ON l.id_local = pl.id_local
JOIN personagem p ON pl.id_personagem = p.id_personagem;

--9. Consulta de Eventos em um Intervalo de Data
SELECT nome, data, descricao
FROM evento
WHERE data BETWEEN '2020-01-01' AND '2021-12-31';

--10. Consulta de E-mails Associados a Personagens
SELECT p.nome AS Personagem, e.endereco_email AS Email
FROM personagem p
JOIN email e ON p.id_personagem = e.id_personagem;


