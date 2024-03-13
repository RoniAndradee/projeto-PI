-- CRIACAO DO BANCO DE DADOS PARA A SPRINT 1
CREATE DATABASE sprint1;
USE sprint1;

-- CRIACAO DA TABELA SETOR
CREATE TABLE sensor (
	idSensor int primary key auto_increment, -- identificador unico do sensor
    numeroSetor int not null, -- numero do setor
    tipoSetor varchar(40) not null, -- tipo de setor
	fluxoDiario int not null default (0), -- quantidade de pessoas por setor por dia
    dataFluxo datetime default current_timestamp -- data da alteracao do fluxo diario
);

-- CRIACAO DA TABELA MERCADO
CREATE TABLE mercado (
	idMercado int primary key auto_increment, -- identificador unico do mercado
    nomeMercado varchar(40) not null, -- nome do mercado
    enderecoMercado varchar(80) not null, -- endereco do mercado
    cepMercado char(9) unique not null, -- cep do mercado
    constraint checkCepMercado check (cepMercado like ('_____-___')), -- restricao para o cep do mercado ("5 caracteres" + "-" + "3 caracteres")
    tipoMercado varchar(5) not null, -- tipo de mercado
	constraint checkTipoMercado check (tipoMercado in ('rede', 'unico')) -- restricao para o tipo de mercado (ser rede ou unico)
    -- chave estrangeira "cadastro"
);

-- CRIACAO DA TABELA CADASTRO
CREATE TABLE cadastro (
	idCadastro int primary key auto_increment, -- identificador unico do cadastro
	emailCadastro varchar(70) unique not null, -- email do cadastro
	constraint checkEmailCadastro check (emailCadastro like ('%@%')), -- restricao para o email do cadastro (ter @ no email)
    senhaCadastro varchar(15) not null -- senha do cadastro
);

-- INSERIR DADOS NO SETOR
INSERT INTO sensor (numeroSetor, tipoSetor, fluxoDiario) VALUES
	(1, 'doces', 31),
    (2, 'limpeza', 14),
    (3, 'hortifrúti', 17),
    (4, 'laticínios', 45),
    (5, 'congelados', 28),
    (6, 'bebidas', 18),
    (7, 'carnes', 10),
    (8, 'padaria e confeitaria', 37),
    (9, 'frutos do mar', 21),
    (10, 'frios', 27);

-- INSERIR DADOS NO MERCADO
INSERT INTO mercado (nomeMercado, enderecoMercado, cepMercado, tipoMercado) VALUES
	('Pão de Açúcar', 'R. da Consolação, 2581 - Cerqueira César, São Paulo - SP', '01416-001', 'rede'),
    ('Mercado Natural', 'R. Pamplona, 1844 - Jardim Paulista, São Paulo - SP', '01405-002', 'unico'),
    ('Hortifruti Augusta Mini Mercado Ltda', 'R. Augusta, 2118 - Jardim Paulista, São Paulo - SP', '01412-000', 'unico'),
    ('DIA Supermercado', 'R. da Consolação, 3106 - Cerqueira César, São Paulo - SP', '01416-000', 'rede'),
    ('Pão de Açúcar', 'Av. Brigadeiro Luís Antônio, 2013 - Bela Vista, São Paulo - SP', '01317-001', 'rede'),
    ('Minuto Pão de Açúcar', 'Alameda Ribeirão Preto, 466 - Bela Vista, São Paulo - SP', '01331-001', 'rede'),
    ('Extra', '763/771, R. Frei Caneca, 763 - Consolação, São Paulo - SP', '01307-001', 'rede'),
    ('Mini mercado RN', 'R. Alm. Marques de Leão, 737 - Bela Vista, São Paulo - SP', '01330-010', 'unico'),
    ('Mercado Aliança', 'Av. Nove de Julho, 695 - Bela Vista, São Paulo - SP', '01313-000', 'rede'),
    ('Carrefour Express Conjunto Nacional', 'Av. Paulista, 2073 - Consolação, São Paulo - SP', '01311-300', 'rede');

-- INSERIR DADOS NO CADASTRO
INSERT INTO cadastro (emailCadastro, senhaCadastro) VALUES
	('ana.silva@gmail.com', 'AS1234'),
    ('pedro.santos@yahoo.com', 'PS5678'),
    ('maria.ferreira@hotmail.com', 'MF9876'),
    ('lucas.oliveira@gmail.com', 'LO4321'),
    ('juliana.rodrigues@yahoo.com', 'JR7890'),
    ('thiago.souza@hotmail.com', 'TS2468'),
    ('carolina.almeida@gmail.com', 'CA1357'),
    ('guilherme.costa@yahoo.com', 'GC8023'),
    ('amanda.pereira@hotmail.com', 'AP5749'),
    ('matheus.gomes@gmail.com', 'MG3690');
    
-- EXIBIR O TIPO DO SETOR E A QUANTIDADE DE PESSOAS POR DIA NO SETOR
SELECT tipoSetor AS 'Tipo de setor:',
	fluxoDiario AS 'Quantidade de pessoas no setor por dia:',
    date_format(dataFluxo, '%d/%m/%Y  -  %h:%i:%s  %p') AS 'Data da alteração do fluxo diário: '
    FROM sensor ORDER BY fluxoDiario;

-- EXIBIR NOME DO MERCADO, ENDERECO E CEP DO MERCADO E TIPO DO MERCADO (REDE OU UNICO)
SELECT nomeMercado AS 'Nome do mercado:',
	concat(cepMercado,' | ', enderecoMercado) AS "Endereço do mercado:", 
	tipoMercado AS 'Tipo do mercado:' FROM mercado;

-- EXIBIR NOME DO MERCADO, ENDERECO E CEP DO MERCADO E TIPO DO MERCADO (REDE OU UNICO)
SELECT emailCadastro AS 'Email do cadastro:',
	senhaCadastro AS 'Senha do cadastro:' FROM cadastro;