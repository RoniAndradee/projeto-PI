create database projeto;
use projeto;

create table mercado(
idMercado int primary key auto_increment not null ,
nomeMercado varchar(50) not null,
cepMercado char(9),
constraint chkCep check (cepMercado like ('_____-___')),
qtdSetores int not null,
gerente varchar(50)
);

create table setor(
	idSetor int primary key auto_increment not null,
    nome varchar(40),
    qtdSensores int default 4,
    fluxoDiario int
);

create table sensor(
 idSensor int primary key auto_increment not null,
 setorPosicionado varchar(50) not null,
 dadosCaptados varchar(9),
 constraint chkDados check (dadosCaptados in ('detectado', 'ausente'))
);

create table gerente(
 idGerente int primary key auto_increment not null,
 nome varchar(45),
 email varchar(50),
 senha varchar(30)
);

insert into mercado values
(default, 'Mercadinho Nova Heitor', '03554-541', 6, 'Eduardo'),
(default, 'Alpha Ofertas', '40243-251', 7, 'Maria Luisa'),
(default, 'Seu zé mercadinho', '45415-895', 10, 'Jassir'),
(default, 'Mercadinho Uno', '88762-587', 12, 'Ronaldo');

insert into setor values
(default, 'Farinha', default, 19),
(default, 'Frios', default, 39),
(default, 'Padaria', default, 25),
(default, 'Açougue', default, 37);

insert into sensor values
(default, 'Farinha', 'ausente'),
(default, 'Frios', 'detectado'),
(default, 'Padaria', 'detectado'),
(default, 'Açougue', 'ausente');

insert into gerente values
(default, 'Eduardo Silva', 'eduardo.gerente@gmail.com', 'eduzinho59'), 
(default, 'Maria Luisa', 'maria.luisa@gmail.com', 'terezinha26'), 
(default, 'Jassir Gomes', 'jassirtrabalhador@gmail.com', 'trabalhoevida'), 
(default, 'Ronaldo Fenomeno', 'ronaldoFen@gmail.com', 'fenomeno'); 

select * from mercado;

select * from setor;

select * from sensor;

select * from gerente;

select concat('Nome do Mercado: ', nomeMercado, ' | Quantidade de setores:', qtdSetores) as 'Sensores do mercado' from mercado;

select * from setor where fluxoDiario >= 20;

select * from sensor where dadosCaptados = 'ausente';

select nome, email from gerente where email like '%lu%';

