use sprint1;

create table mercado (
idMercado int primary key auto_increment, 
tipo varchar (40) constraint chkTipo check(tipo in('pequeno', 'médio')) not null,
pais varchar(40),
estado varchar(40),
cep char(8) not null,
bairro varchar (40),
rua varchar (40),
numero int);

create table sensor (
idSensor int primary key auto_increment,
setor int not null,
qtdMovimentacao int,
dtalteracao datetime default current_timestamp);

create table responsavel (
idResponsavel int primary key auto_increment,
nomeMercado varchar (40) not null,
nome varchar (40) not null,
cargo varchar (40) not null,
email varchar(40) not null);

insert into mercado values
(null, 'pequeno', 'Brasil', 'SP', '05423382', 'atravessa do monte', 'joel rodrigues blandy', 328),
(null, 'medio', 'Peru', 'LM', '00150001', 'Juan Carlos', 'Maquiel da sombra', 4232),
(null, 'pequeno', 'Brasil', 'MG', '30110008', 'Queijo bom', 'Tonhao da sul', 12);

select * from mercado;
select  concat(pais,'  ', estado,'  ', cep,'  ', bairro,' | ','Rua:  ', rua, ' | ', numero) AS 'Endereço completo do mercado' from mercado;
select * from mercado where estado like '%SP%';
select * from mercado where estado like 'M%';

truncate table mercado;

insert into sensor values
(null, 1, 77, default),
(null, 2, 89, default),
(null, 3, 153, default);

select * from sensor;
select * from sensor order by qtdMovimentacao desc;

truncate sensor;

insert into responsavel values
(null, 'Atacadão da sul', 'Roberto Justo', 'Dono', 'robertojusto@gmail.com'),
(null, 'Extra', 'Mauricio', 'Gerente', 'mauricio@outlook.com'),
(null, 'Assai', 'Marlene', 'RH', 'marlenecosta@gmail.com');

select * from responsavel;
select nomeMercado from responsavel;