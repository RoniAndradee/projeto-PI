-- CRIAÇÃO E UTILIZAÇÃO DO BANCO DE DADOS PARA A APRESENTAÇÃO DA SPRINT 1
CREATE DATABASE apresentacaoSprint1;
USE apresentacaoSprint1;

-- CRIAÇÃO DA TABELA SENSOR
CREATE TABLE sensor (
	idSensor int primary key auto_increment, -- identificador único do sensor
    idSetor int not null, -- identificador único do setor que o sensor esta posicionado
    dadosCaptados varchar(9) not null, -- dados captados pelo sensor,
	constraint checkDados check (dadosCaptados in ('detectado', 'ausente'))
);

-- CRIAÇÃO DA TABELA SETOR
CREATE TABLE setor (
	idSetor int primary key auto_increment, -- identificador único do setor
    tipo varchar(40) not null, -- nome do setor
    quantidadeSensores int default 4, -- quantidade de sensores no setor
    fluxoDiario int default 0, -- quantidade de pessoas por setor por dia
    dataFluxo datetime default current_timestamp -- data da alteração do fluxo diário
);

-- CRIAÇÃO DA TABELA MERCADO
CREATE TABLE mercado (
	idMercado int primary key auto_increment, -- identificador único do mercado
    nome varchar(50) not null, -- nome do mercado
    quantidadeSetores int not null, -- quantidade de setores do mercado
    pais varchar(20) default "Brasil", -- país do mercado
    uf char(2) not null, -- sigla do estado do mercado
    cidade varchar(40) not null, -- cidade do mercado
    bairro varchar(40) not null, -- bairro do mercado
    logradouro varchar(40) not null, -- logradouro do mercado
    numero int not null, -- número do mercado
    cep char(9) not null, -- cep do mercado
    constraint checkCep check (cep like ('_____-___')) -- restricao para o cep do mercado ("5 caracteres" + "-" + "3 caracteres")
);

-- CRIAÇÃO DA TABELA RESPONSAVEL
CREATE TABLE responsavel (
	idResponsavel int primary key auto_increment, -- identificador único do responsável
    nomeResponsavel varchar(80) not null, -- nome do responsável
    nomeMercado varchar(50) not null, -- nome do mercado
	email varchar(100) unique not null, -- email do responsável
	constraint checkEmail check (email like ('%@%')), -- restrição para o email do responsável (ter @ no email)
    senha varchar(15) not null -- senha do responsável
);

-- INSERÇÃO DE DADOS NA TABELA SENSOR
INSERT INTO sensor (idSetor, dadosCaptados) VALUES
	(1, 'Ausente'),
    (2, 'Ausente'),
    (3, 'Ausente'),
    (4, 'Ausente'),
    (5, 'Ausente');
    
-- INSERÇÃO DE DADOS NA TABELA SETOR
INSERT INTO setor (tipo, quantidadeSensores, fluxoDiario) VALUES
	('doces', default, 31),
    ('limpeza', default, 14),
    ('hortifrúti', default, 17),
    ('laticínios', default, 45),
    ('congelados', default, 28);

-- INSERÇÃO DE DADOS NA TABELA MERCADO
INSERT INTO mercado (nome, quantidadeSetores, pais, uf, cidade, bairro, logradouro, numero, cep) VALUES
	('Pão de Açúcar', 25, default, 'SP', 'São Paulo', 'Cerqueira César', 'R. da Consolação', 2581, '01416-001'),
    ('Mercado Natural', 12, default, 'SP', 'São Paulo', 'Jardim Paulista', 'R. Pamplona', 1844, '01405-002'),
    ('Hortifruti Augusta Mini Mercado Ltda', 15, default, 'SP', 'São Paulo', 'Jardim Paulista', 'R. Augusta', 2118, '01412-000'),
    ('DIA Supermercado', 26, default, 'SP', 'São Paulo', 'Cerqueira César', 'R. da Consolação', 3106, '01416-000'),
    ('Minuto Pão de Açúcar', 20, default, 'SP', 'São Paulo', 'Bela Vista', 'Alameda Ribeirão Preto', 466, '01331-001');

-- INSERÇÃO DE DADOS NA TABELA RESPONSÁVEL
INSERT INTO responsavel (nomeResponsavel, nomeMercado, email, senha) VALUES
	('Ana Silva', 'Pão de Açúcar', 'ana.silva@gmail.com', 'AS1234'),
    ('Pedro Santos', 'Mercado Natural', 'pedro.santos@yahoo.com', 'PS5678'),
    ('Maria Ferreira', 'Hortifruti Augusta Mini Mercado Ltda', 'maria.ferreira@hotmail.com', 'MF9876'),
    ('Lucas Oliveira', 'DIA Supermercado', 'lucas.oliveira@gmail.com', 'LO4321'),
    ('Juliana Rodrigues', 'Minuto Pão de Açúcar', 'juliana.rodrigues@yahoo.com', 'JR7890');
    
-- EXIBIÇÃO DO ID DO SETOR E DADOS CAPTADOS NO SENSOR
SELECT idSetor AS 'Setor onde o sensor está instalado:',
	dadosCaptados AS 'Detectado ou ausente:'
    FROM sensor ORDER BY idSetor;

-- EXIBIÇÃO DO TIPO, QUANTIDADE DE SENSORES, FLUXO DIÁRIO E DATA DE ALTERAÇÃO DO FLUXO DIÁRIO NO SETOR
SELECT tipo AS 'Tipo de setor:',
	quantidadeSensores AS 'Quantidade de sensores no setor:',
    fluxoDiario AS 'Quantidade de pessoas no setor por dia:',
    date_format(dataFluxo, '%d/%m/%Y  -  %h:%i:%s  %p') AS 'Data da alteração do fluxo diário: '
    FROM setor ORDER BY fluxoDiario;

-- EXIBIÇÃO DO NOME, QUANTIDADE DE SETORES E ENDEREÇO DO MERCADO
SELECT nome AS 'Nome do mercado:',
	quantidadeSetores AS 'Quantidade de setores do mercado:',
	concat('País: ', pais, ' |Estado: ', uf, ' |Cidade: ', cidade, ' |Bairro: ', bairro, ' |Logradouro: ', logradouro, ' |Número: ', numero) AS "Endereço do mercado:"
	FROM mercado;

-- EXIBIÇÃO DO NOME, NOME DO MERCADO, EMAIL E SENHA DO RESPONSÁVEL
SELECT concat(nomeResponsavel, ' é responsável pelo mercado: ', nomeMercado) AS 'Responsável: ',
	email AS 'E-mail do responsável:',
	senha AS 'Senha do responsável:'
    FROM responsavel;