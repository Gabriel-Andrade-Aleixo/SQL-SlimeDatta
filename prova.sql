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

-- Inser��o de dados na tabela casa
INSERT INTO casa (numero, bairro, rua) VALUES
(1, 'Bairro A', 'Rua Principal'),
(2, 'Bairro B', 'Rua Secund�ria'),
(3, 'Bairro C', 'Avenida Central'),
(4, 'Bairro D', 'Avenida dos Sonhos'),
(5, 'Bairro E', 'Rua da Harmonia'),
(6, 'Bairro F', 'Avenida das Flores'),
(7, 'Bairro G', 'Rua da Paz'),
(8, 'Bairro H', 'Avenida da Liberdade'),
(9, 'Bairro I', 'Rua do Sol'),
(10, 'Bairro J', 'Avenida da Esperan�a'),
(11, 'Bairro K', 'Rua da Alegria'),
(12, 'Bairro L', 'Avenida da Amizade'),
(13, 'Bairro M', 'Rua da Felicidade'),
(14, 'Bairro N', 'Avenida da Serenidade'),
(15, 'Bairro O', 'Rua das Estrelas'),
(16, 'Bairro P', 'Avenida do Amor'),
(17, 'Bairro Q', 'Rua da Harmonia'),
(18, 'Bairro R', 'Avenida da Aventura'),
(19, 'Bairro S', 'Rua do Destino'),
(20, 'Bairro T', 'Avenida da Magia');

-- Inser��o de dados na tabela personagem
INSERT INTO personagem (nome, data_nascimento, raca, id_casa) VALUES
('Rimuru Tempest', '1990-01-01', 'Slime', 1),
('Shion', '1995-03-15', 'Oni', 2),
('Benimaru', '1992-07-20', 'Kijin', 3),
('Shuna', '1993-05-10', 'Kijin', 4),
('Gobta', '2000-11-30', 'Goblin', 5),
('Milim Nava', '1985-09-25', 'Demon Lord', 6),
('Souei', '1991-12-05', 'Kijin', 7),
('Diablo', '1993-02-20', 'Demon', 8),
('Ranga', '1998-08-10', 'Wolf', 9),
('Gabiru', '1997-04-18', 'Lizardman', 10),
('Rigurd', '1988-06-30', 'Dwarf', 11),
('Treyni', '1990-10-22', 'Dryad', 12),
('Geld', '1994-11-15', 'Orc', 13),
('Clayman', '1987-03-07', 'Unknown', 14),
('Carrera', '1999-01-25', 'Harpy', 15),
('Grucius', '1996-07-12', 'Ogre', 16),
('Gabil', '1992-04-05', 'Goblin', 17),
('Hakurou', '1989-12-20', 'Kijin', 18),
('Souka', '2002-05-28', 'Elf', 19),
('Gale Gibson', '1997-08-17', 'Human', 20);

-- Inser��o de dados na tabela registro
INSERT INTO registro (numero_registro, id_personagem) VALUES
(1001, 1),
(1002, 2),
(1003, 3),
(1004, 4),
(1005, 5),
(1006, 6),
(1007, 7),
(1008, 8),
(1009, 9),
(1010, 10),
(1011, 11),
(1012, 12),
(1013, 13),
(1014, 14),
(1015, 15),
(1016, 16),
(1017, 17),
(1018, 18),
(1019, 19),
(1020, 20);

-- Inser��o de dados na tabela habilidade
INSERT INTO habilidade (nome, tipo, nivel_poder) VALUES
('Transforma��o', 'Ativa', 10),
('Explos�o de Fogo', 'Ativa', 8),
('Curandeirismo', 'Passiva', 7),
('Telecinese', 'Ativa', 9),
('Furtividade', 'Passiva', 2),
('Voo', 'Ativa', 9),
('Teletransporte', 'Ativa', 8),
('Ilus�o', 'Ativa', 7),
('Cura em Massa', 'Ativa', 4),
('Invisibilidade', 'Ativa', 4),
('For�a Sobrenatural', 'Ativa', 10),
('Manipula��o de Energia', 'Ativa', 9),
('Aura de Prote��o', 'Passiva', 7),
('Controle Mental', 'Ativa', 8),
('Evas�o', 'Passiva', 6),
('Regenera��o R�pida', 'Passiva', 9),
('Explos�o de Gelo', 'Ativa', 8),
('Telepatia', 'Ativa', 7),
('Escudo M�gico', 'Ativa', 2),
('Rajada de Vento', 'Ativa', 8);

-- Inser��o de dados na tabela item
INSERT INTO item (nome, tipo, efeito) VALUES
('Espada Longa', 'Arma', 'Aumenta o dano de ataque'),
('Po��o de Cura', 'Consum�vel', 'Recupera pontos de vida'),
('Anel de Prote��o', 'Acess�rio', 'Aumenta a defesa'),
('Arco e Flecha', 'Arma', 'Permite ataques � dist�ncia'),
('Amuleto de Sorte', 'Acess�rio', 'Aumenta a chance de acerto cr�tico'),
('Varinha M�gica', 'Arma', 'Permite lan�ar feiti�os'),
('Elixir de For�a', 'Consum�vel', 'Aumenta temporariamente a for�a'),
('Bracelete da Agilidade', 'Acess�rio', 'Aumenta a velocidade de movimento'),
('Talism� de Prote��o', 'Acess�rio', 'Reduz o dano recebido'),
('Adaga Envenenada', 'Arma', 'Causa dano e envenena o alvo'),
('Elmo de Resist�ncia', 'Acess�rio', 'Aumenta a resist�ncia a ataques f�sicos'),
('Orbe de Energia', 'Consum�vel', 'Recupera pontos de mana'),
('Botas de Fuga', 'Acess�rio', 'Permite escapar de batalhas'),
('Luvas da Destreza', 'Acess�rio', 'Aumenta a precis�o dos ataques'),
('Cajado Arcano', 'Arma', 'Aumenta o poder m�gico'),
('Po��o de Invisibilidade', 'Consum�vel', 'Torna o usu�rio invis�vel por um curto per�odo'),
('Pergaminho de Teleporte', 'Consum�vel', 'Permite teletransporte para um local conhecido'),
('Anel de Regenera��o', 'Acess�rio', 'Acelera a regenera��o de ferimentos'),
('Manto da Camuflagem', 'Acess�rio', 'Permite camuflagem natural em ambientes'),
('Po��o de For�a', 'Consum�vel', 'Aumenta temporariamente a for�a f�sica'),
('Espelho da Reflex�o', 'Acess�rio', 'Reflete ataques m�gicos de volta ao lan�ador'),
('Po��o de Resist�ncia', 'Consum�vel', 'Aumenta temporariamente a resist�ncia a status negativos');

-- Inser��o de dados na tabela local
INSERT INTO local (nome, tipo, descricao) VALUES
('Floresta das Fadas', '�rea Natural', 'Lar das fadas e criaturas m�gicas'),
('Cidade dos Goblins', '�rea Urbana', 'Centro de com�rcio goblin'),
('Montanha Flamejante', '�rea Natural', 'Reino do drag�o de fogo'),
('Vila dos Humanos', '�rea Urbana', 'Comunidade pac�fica de humanos'),
('Torre do Feiticeiro', '�rea M�stica', 'Local de aprendizado de magia arcana'),
('Plan�cie dos Elfos', '�rea Natural', 'Habitat dos elfos e seres da floresta'),
('Caverna dos Trolls', '�rea Natural', 'Terra natal dos trolls e criaturas subterr�neas'),
('Ilha dos Piratas', '�rea Costeira', 'Esconderijo de piratas e saqueadores'),
('Castelo dos Reis', '�rea Urbana', 'Resid�ncia dos reis e nobres'),
('Templo dos Deuses', '�rea Sagrada', 'Local de adora��o e rituais religiosos'),
('Deserto dos Escaravelhos', '�rea Natural', 'Regi�o des�rtica habitada por insetos gigantes'),
('Cidade dos An�es', '�rea Urbana', 'Centro de minera��o e forja an�'),
('P�ntano dos Esp�ritos', '�rea Natural', 'Lar de esp�ritos e criaturas m�sticas'),
('Colina dos Gigantes', '�rea Natural', 'Territ�rio dos gigantes e tit�s'),
('Porto dos Mercadores', '�rea Costeira', 'Local de com�rcio e trocas mar�timas'),
('Vale das Sombras', '�rea Natural', 'Regi�o assombrada por esp�ritos malignos'),
('Cidade dos Magos', '�rea Urbana', 'Academia de magia e estudos arcanos'),
('Cachoeira dos Ninfas', '�rea Natural', 'Ref�gio das ninfas e seres aqu�ticos'),
('Aldeia dos Lobisomens', '�rea Natural', 'Comunidade de lobisomens e metamorfos'),
('Ru�nas Antigas', '�rea Hist�rica', 'Vest�gios de civiliza��es antigas e rel�quias');

-- Inser��o de dados na tabela evento
INSERT INTO evento (nome, data, descricao) VALUES
('Festival Anual', '2024-07-15', 'Celebrando a paz entre as ra�as'),
('Invas�o Demon�aca', '2024-09-20', 'Hordas de dem�nios atacam a cidade'),
('Torneio de Arquearia', '2024-08-10', 'Competi��o de habilidades com arco e flecha'),
('Concerto da Sinfonia M�gica', '2024-06-25', 'Apresenta��o de m�sica m�gica'),
('Ritual da Primavera', '2024-04-05', 'Cerim�nia para trazer prosperidade � terra'),
('Baile Real', '2024-10-30', 'Evento de gala com a realeza'),
('Expedi��o � Montanha', '2024-05-12', 'Jornada para explorar a Montanha Flamejante'),
('Ca�ada ao Tesouro', '2024-11-08', 'Busca por tesouros escondidos em toda a regi�o'),
('Cerim�nia de Inicia��o', '2024-02-18', 'Ritual para novos membros da guilda'),
('Desfile de Moda', '2024-09-05', 'Apresenta��o das �ltimas tend�ncias de moda'),
('Festival das Luzes', '2024-12-20', 'Celebra��o com lanternas e fogos de artif�cio'),
('Torneio de Combate', '2024-03-10', 'Competi��o de artes marciais e combate'),
('Exposi��o de Arte', '2024-08-28', 'Mostra de obras de artistas locais'),
('Leil�o de Rel�quias', '2024-07-02', 'Venda de itens hist�ricos e m�gicos'),
('Concurso de Talentos', '2024-11-15', 'Apresenta��es variadas de habilidades e talentos'),
('Desafio dos Campe�es', '2024-06-10', 'Batalha entre os melhores guerreiros da regi�o'),
('Feira de Artesanato', '2024-04-20', 'Venda de produtos artesanais e feitos � m�o'),
('Competi��o de Cavalos', '2024-10-05', 'Corrida de cavalos e exibi��o de habilidades equestres'),
('Banquete Real', '2024-12-12', 'Banquete em honra aos her�is da cidade'),
('Festa da Colheita', '2024-09-18', 'Celebrando a abund�ncia da colheita');

-- Inser��o de dados na tabela email
INSERT INTO email (id_personagem, endereco_email) VALUES
(1, 'rimuru@tempest.com'),
(1, 'slime@slime.com'),
(2, 'shion@oni.com'),
(2, 'shionofficial@tempest.com'),
(3, 'benimaru@kijin.com'),
(3, 'beni@tempest.com'),
(4, 'shuna@kijin.com'),
(4, 'shuna@tempest.com'),
(5, 'gobta@goblin.com'),
(5, 'gobta@tempest.com'),
(6, 'milim@demons.com'),
(6, 'milim@nava.com'),
(7, 'souei@kijin.com'),
(7, 'souei@tempest.com'),
(8, 'diablo@demon.com'),
(8, 'diablo@tempest.com'),
(9, 'ranga@wolf.com'),
(9, 'ranga@tempest.com'),
(10, 'gabiru@lizardman.com'),
(10, 'gabiru@tempest.com'),
(11, 'rigurd@dwarf.com'),
(11, 'rigurd@tempest.com'),
(12, 'treyni@dryad.com'),
(12, 'treyni@tempest.com'),
(13, 'geld@orc.com'),
(13, 'geld@tempest.com'),
(14, 'clayman@unknown.com'),
(14, 'clayman@tempest.com'),
(15, 'carrera@harpy.com'),
(15, 'carrera@tempest.com'),
(16, 'grucius@ogre.com'),
(16, 'grucius@tempest.com'),
(17, 'gabil@goblin.com'),
(17, 'gabil@tempest.com'),
(18, 'hakurou@kijin.com'),
(18, 'hakurou@tempest.com'),
(19, 'souka@elf.com'),
(19, 'souka@tempest.com'),
(20, 'gale@human.com'),
(20, 'gale@tempest.com');

-- Inserindo dados na tabela possui (habilidades)
INSERT INTO possui (id_personagem, id_habilidade) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 2),
(2, 3),
(3, 1),
(3, 2),
(3, 3),
(4, 1),
(4, 2),
(4, 3),
(5, 1),
(5, 2),
(5, 3),
(6, 1),
(6, 2),
(6, 3),
(7, 1),
(7, 2),
(7, 3),
(8, 1),
(8, 2),
(8, 3),
(9, 1),
(9, 2),
(9, 3),
(10, 1),
(10, 2),
(10, 3),
(11, 1),
(11, 2),
(11, 3),
(12, 1),
(12, 2),
(12, 3),
(13, 1),
(13, 2),
(13, 3),
(14, 1),
(14, 2),
(14, 3),
(15, 1),
(15, 2),
(15, 3),
(16, 1),
(16, 2),
(16, 3),
(17, 1),
(17, 2),
(17, 3),
(18, 1),
(18, 2),
(18, 3),
(19, 1),
(19, 2),
(19, 3),
(20, 1),
(20, 2),
(20, 3);

-- Inserindo dados na tabela usa (itens)
INSERT INTO usa (id_personagem, id_item) VALUES
(1, 1),
(1, 2),
(2, 1),
(2, 2),
(3, 3),
(3, 4),
(4, 5),
(4, 6),
(5, 7),
(5, 8),
(6, 9),
(6, 10),
(7, 1),
(7, 2),
(8, 3),
(8, 4),
(9, 5),
(9, 6),
(10, 7),
(10, 8),
(11, 9),
(11, 10),
(12, 1),
(12, 2),
(13, 3),
(13, 4),
(14, 5),
(14, 6),
(15, 7),
(15, 8),
(16, 9),
(16, 10),
(17, 1),
(17, 2),
(18, 3),
(18, 4),
(19, 5),
(19, 6),
(20, 7),
(20, 8);

-- Inserindo dados na tabela esteve (locais)
INSERT INTO esteve (id_personagem, id_local) VALUES
(1, 1),
(1, 2),
(2, 2),
(2, 3),
(3, 4),
(3, 5),
(4, 6),
(4, 7),
(5, 8),
(5, 9),
(6, 10),
(6, 11),
(7, 12),
(7, 13),
(8, 14),
(8, 15),
(9, 16),
(9, 17),
(10, 18),
(10, 19),
(11, 1),
(11, 2),
(12, 3),
(12, 4),
(13, 5),
(13, 6),
(14, 7),
(14, 8),
(15, 9),
(15, 10),
(16, 11),
(16, 12),
(17, 13),
(17, 14),
(18, 15),
(18, 16),
(19, 17),
(19, 18),
(20, 19),
(20, 20);

-- Inserindo dados na tabela participa (eventos)
INSERT INTO participa (id_personagem, id_evento) VALUES
(1, 1),
(1, 2),
(2, 2),
(2, 3),
(3, 4),
(3, 5),
(4, 6),
(4, 7),
(5, 8),
(5, 9),
(6, 10),
(6, 11),
(7, 12),
(7, 13),
(8, 14),
(8, 15),
(9, 16),
(9, 17),
(10, 18),
(10, 19),
(11, 1),
(11, 2),
(12, 3),
(12, 4),
(13, 5),
(13, 6),
(14, 7),
(14, 8),
(15, 9),
(15, 10),
(16, 11),
(16, 12),
(17, 13),
(17, 14),
(18, 15),
(18, 16),
(19, 17),
(19, 18),
(20, 19),
(20, 20);


-- CRUD

-- Inserir um novo personagem
INSERT INTO personagem (nome, data_nascimento, raca, id_casa) 
VALUES ('Teste', '2000-01-01', 'Humano', 1);

-- Selecionar todos os personagens:
SELECT * FROM personagem;

-- Atualizar o nome do personagem 'Teste' para 'Novo Teste'
UPDATE personagem SET nome = 'Novo Teste' WHERE nome = 'Teste';

SELECT * FROM personagem
WHERE nome = 'Novo Teste';


-- Deletar o personagem 'Novo Teste'
DELETE FROM personagem WHERE nome = 'Novo Teste';


-- Relat�rios
--1. Consulta com Jun��o entre Personagem e Habilidade
SELECT p.nome AS Nome_Personagem, h.nome AS Habilidade
FROM personagem p
JOIN possui po ON p.id_personagem = po.id_personagem
JOIN habilidade h ON po.id_habilidade = h.id_habilidade;



-- 2. Mostrar os itens utilizados por cada personagem:
SELECT p.nome AS Nome_Personagem, i.nome AS Item
FROM personagem p
JOIN usa u ON p.id_personagem = u.id_personagem
JOIN item i ON u.id_item = i.id_item;


-- 3. Consulta com Ordena��o em Personagem e Evento
SELECT p.nome AS Nome_Personagem, e.nome AS Evento
FROM personagem p
JOIN participa pa ON p.id_personagem = pa.id_personagem
JOIN evento e ON pa.id_evento = e.id_evento
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
WHERE data_nascimento > '1993-01-01';

--6. Consulta de Habilidades com N�vel de Poder Maior que 4
SELECT nome, tipo, nivel_poder
FROM habilidade
WHERE nivel_poder > 4;

--7. Consulta de Itens com Tipo Espec�fico
SELECT nome, tipo, efeito
FROM item
WHERE tipo = 'Arma';

--8. Consulta de Personagem e Locais Visitados
SELECT l.nome AS Local, p.nome AS Personagem
FROM local l
JOIN esteve pl ON l.id_local = pl.id_local
JOIN personagem p ON pl.id_personagem = p.id_personagem;

--9. Consulta de Eventos em um Intervalo de Data
SELECT nome, data, descricao
FROM evento
WHERE data BETWEEN '2024-08-01' AND '2025-12-31';

--10. Consulta de E-mails Associados a Personagens
SELECT p.nome AS Personagem, e.endereco_email AS Email
FROM personagem p
JOIN email e ON p.id_personagem = e.id_personagem;

--11. Mostrar os personagens que vivem em uma determinada casa
SELECT p.nome AS Nome_Personagem, c.numero AS Numero_Casa, c.bairro AS Bairro
FROM personagem p
JOIN casa c ON p.id_casa = c.id_casa
WHERE c.numero = 1;

-- 12. Mostrar os personagens que possuem um certo tipo de habilidade em um determinado bairro
SELECT p.nome AS Nome_Personagem, h.nome AS Habilidade, c.bairro AS Bairro
FROM personagem p
JOIN possui po ON p.id_personagem = po.id_personagem
JOIN habilidade h ON po.id_habilidade = h.id_habilidade
JOIN casa c ON p.id_casa = c.id_casa
WHERE h.tipo = 'Passiva' AND c.bairro = 'Bairro A';



