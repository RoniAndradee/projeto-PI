USE sprint1;

-- TABELA SETOR
CREATE TABLE setor (
	idSetor int primary key auto_increment,
    tipoSetor varchar(60) not null,
    qntSensor int default(4),
	fluxoDiario int not null
    -- chave estrangeira "mercado"
);

-- TABELA MERCADO
CREATE TABLE mercado (
	idMercado int primary key auto_increment,
    nomeMercado varchar(60) not null,
    enderecoMercado varchar(60) not null,
    cepMercado char(9) unique not null,
    tipoMercado varchar(5) not null,
    constraint checkCepMercado check (cepMercado like ('_____-___')),
	constraint checkTipoMercado check (tipoMercado in ('rede', 'unico'))
    -- chave estrangeira "cadastro"
    -- chave estrangeira "setor" 
);

-- TABELA CADASTRO
CREATE TABLE cadastro (
	idCadastro int primary key auto_increment,
    nomeUsuario varchar(80) not null,
	emailCadastro varchar(70) unique not null,
    senhaCadastro varchar(15) not null,
	constraint checkEmailCadastro check (emailCadastro like ('%@%'))
);

-- DADOS NO SETOR
INSERT INTO setor (tipoSetor, qntSensor,fluxoDiario) VALUES
	('doces', default, 31),
    ('limpeza', default, 14),
    ('hortifrúti', default, 17),
    ('carnes', default, 45),
    ('congelados', 8, 28);

-- DADOS NO MERCADO
INSERT INTO mercado (nomeMercado, enderecoMercado, cepMercado, tipoMercado) VALUES
	('Extra', 'R. da Consolação, 2581 - Cerqueira César, São Paulo - SP', '01416-001', 'rede'),
    ('Carrefour', 'R. Pamplona, 1844 - Jardim Paulista, São Paulo - SP', '01405-002', 'unico'),
    ('Hortifruti Vila Carrão', 'R. Augusta, 2118 - Jardim Paulista, São Paulo - SP', '01412-000', 'unico'),
    ('DIA Supermercado', 'R. da Consolação, 3106 - Cerqueira César, São Paulo - SP', '01416-000', 'rede');

-- DADOS NO CADASTRO
INSERT INTO cadastro (nomeUsuario, emailCadastro, senhaCadastro) VALUES
	('Ana Silva','ana.silva@gmail.com', 'AS1234'),
    ('Pedro Santos','pedro.santos@yahoo.com', 'PS5678'),
    ('Maria Ferreira','maria.ferreira@hotmail.com', 'MF9876'),
    ('Lucas Oliveira','lucas.oliveira@gmail.com', 'LO4321');
    
-- EXIBIR O ID DO SETOR, O TIPO DO SETOR E A QUANTIDADE DE PESSOAS POR DIA NO SETOR
SELECT idSetor AS 'Número do setor:' ,tipoSetor AS 'Tipo de setor:',
	fluxoDiario AS 'Quantidade de pessoas no setor por dia:' FROM setor;

-- EXIBIR NOME DO MERCADO, ENDERECO E CEP DO MERCADO E TIPO DO MERCADO (REDE OU UNICO)
SELECT nomeMercado AS 'Nome do mercado:',
	concat(cepMercado,' | ', enderecoMercado) AS "Endereço do mercado:", 
	tipoMercado AS 'Tipo do mercado:' FROM mercado;

-- EXIBIR NOME DO USUÁRIO, O SEU EMAIL E SUA SENHA
SELECT nomeUsuario AS 'Nome do usuário:' ,emailCadastro AS 'Email do cadastro:',
	senhaCadastro AS 'Senha do cadastro:' FROM cadastro;