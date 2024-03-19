USE sprint1;

-- TABELA SETOR
CREATE TABLE setor (
	idSetor int primary key auto_increment,
    tipo varchar(60),
    qtdSensor int);
    
INSERT INTO setor VALUES
	(1, 'Doces', 2),
    (2, 'Frios', 3),
    (default, 'Pães', 4),
    (default, 'Produtos de limpeza', 2);
    
SELECT * FROM setor;

ALTER TABLE setor ADD CONSTRAINT checkSensor CHECK (qtdSensor IN (1, 2, 3, 4));

ALTER TABLE setor MODIFY COLUMN qtdSensor int not null;

ALTER TABLE setor MODIFY COLUMN tipo varchar(60) not null;

DESCRIBE setor;

-- TABELA MERCADO
CREATE TABLE mercado (
	idMercado int primary key auto_increment,
    nome varchar(45),
    donoMercado varchar(80),
    cep char(9) not null);
    
INSERT INTO mercado VALUES 
	(1, 'Da vó', 'Joaquim', '03639-070'),
    (default, 'Sonda', 'Marcos', '01234-080'),
    (default, 'Kuchos', 'Leandra', '09872-071'),
    (default, 'Poupaki', 'Carlos', '08367-028');
    
ALTER TABLE mercado ADD CONSTRAINT checkcep CHECK(cep LIKE ('_____-___'));

SELECT * FROM mercado;

-- TABELA DONOS DO MERCADO
CREATE TABLE gerentes (
	idGerente int primary key auto_increment,
    nome varchar(50),
    email varchar(45),
    telefone char(11) unique);
    
INSERT INTO gerentes VALUES 
	(1, 'Carlos Eduardo da Fonseca', 'carlos.fonseca@gmail.com', '11910990581'),
    (default, 'Juliano Farias', 'juliano.farias@hotmail.com', '11927787773'),
    (default, 'Marcos Leonardo Perereira', 'marcos.pereira@outlook.com', '11912345678'),
    (default, 'Leandra Marcia Matos', 'leandra.matos@gmail.com', '11987653897');
    
ALTER TABLE gerentes ADD CONSTRAINT checkEmail CHECK(email LIKE('%@%'));

SELECT * FROM gerentes;
    
    