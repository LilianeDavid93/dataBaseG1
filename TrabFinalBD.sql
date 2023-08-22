-- criação do banco de dados

create database tecnohub;

-- tecnohub, uma loja de periféricos eletrônicos para todos os gostos!

-- criação das tabelas

create table endereco(
	end_cd_id serial primary key not null,
	end_tx_rua varchar(45) not null,
	end_tx_bairro varchar(45) not null,
	end_tx_numero varchar(45) not null,
	end_tx_cidade varchar(45) not null,
	end_tx_estado varchar(45) not null
);

create table usuario(
	usu_cd_id serial primary key not null,
	usu_tx_nome varchar(45) not null,
	usu_tx_nome_usuário varchar(45) not null,
	usu_tx_email varchar(45) not null,
	usu_tx_CPF varchar(45) not null,
	usu_dt_data_Nascimento date not null,
	end_int_id int not null,
	foreign key (end_int_id) references endereco (end_cd_int)
);

create table pedido(
	ped_cd_id serial primary key not null,
	ped_dt_data_pedido timestamp not null,
	usu_int_id int not null,
	foreign key (usu_int_id) references usuario(usu_cd_id)
);

create table categoria(
	cat_cd_id serial primary key not null,
	cat_tx_nome varchar(45) not null,
	cat_tx_descricao varchar(45) not null
);

create table funcionario(
	func_cd_id serial primary key not null,
	func_tx_nome varchar(45) not null,
	fun_tx_cpf varchar(45) not null
);

create table produto(
	prod_cd_id serial primary key not null,
	prod_tx_nome varchar(45) not null,
	prod_tx_descricao varchar(45) not null,
	prod_int_estoque int not null,
	prod_dt_data_fabricacao date not null,
	prod_nm_valor float not null,
	cat_int_id int not null,
	func_int_id int not null,
	foreign key (cat_int_id) references categoria(cat_cd_id),
	foreign key (func_int_id) references funcionario(func_cd_id)
);

create table pedido_produto(
	pedPro_cd_id serial primary key not null,
	prod_int_id int not null,
	ped_int_id int not null,
	foreign key (prod_int_id) references produto(prod_cd_id),
	foreign key (ped_int_id) references pedido(ped_cd_id)
);

-- criação da view nota_fiscal

/*create view nota_fiscal as
select
	u.usu_tx_nome,
	u.usu_tx_cpf,
	p.ped_dt_data_pedido,
	p2.prod_tx_nome,
	p2.prod_nm_valor,
	f.func_tx_nome
from usuario u
inner join pedido p on
	u.usu_cd_id = p.usu_int_id
inner join pedido_produto pp on
	p.ped_cd_id = pp.ped_int_id 
inner join produto p2 on
	pp.prod_int_id = p2.prod_cd_id 
inner join funcionario f on
	p2.func_int_id = f.func_cd_id;*/

drop view nota_fiscal;

-- insert da tabela endereco

insert into endereco(end_tx_rua, end_tx_bairro, end_tx_numero, end_tx_cidade, end_tx_estado)
values 
	('Autumn Leaf','Plaza','29','Long Beach','California'),
	('Stephen','Street','071','San Jose','Columbia'),
	('Gale','Plaza','396','Pasadena','Coimbra'),
	('Washington','Crossing','1779','Algarvia','Ilha de São Miguel'),
	('Stone Corner','Circle','53242','Lamarosa','Ilha do Pico');


--Alteração do tipo para texto para caber mais caracteres
alter table categoria 
alter column cat_tx_descricao type text;

--Insert da tabela categoria
insert into categoria (cat_tx_nome, cat_tx_descricao)
values
('Monitores', 'Nesta categoria temos uma variedade de monitores para computadores'),
('Mouses', 'Nesta categoria temos todos os tipos de mouse'),
('Teclados', 'Nesta categoria temos desde teclados gamer para computadores, até teclados que podem ser usados em celulares'),
('CPU', 'Nesta categoria temos desde de CPU gamer, até as mais simples'),
('GPU', 'As GPUs são as peças responsáveis pelo processamento de imagem nos nossos computadores. Nesta categoria temos GPU de diferentes capacidades gráficas');

select * from categoria;

select * from usuario;


INSERT INTO USUARIO  (USU_TX_NOME, USU_TX_NOME_USUARIO, USU_TX_EMAIL, USU_TX_CPF, USU_DT_DATA_NASCIMENTO, END_INT_ID)
VALUES('Roze Simonnot','Roze', 'rozesimonnot@yahoo.com', '12365478965', '1975-12-25',1),
('Ferdinanda Narducci','Ferdinanda', 'ferdinandanarducci@yahoo.com', '15478965482', '1987-05-20', 2),
('Aloysia Di Napoli','Aloysia','aloysianapoli@yahoo.com', '25031247802', '1875-09-05', 3),
('Angelica Duthy', 'Angelica','angelicaduthy@gmail.com', '00254896314', '1991-03-09',4),
('Filip Bayston','Filip', 'filipbayston@hotmail.com','54112569874', '1975-6-22',5);

insert into PEDIDO (ped_dt_data_pedido, usu_int_id)
values('21-08-2023 17:53:00',1),
('18-02-2023 17:00:00',2),
('01-01-2023 09:00:00',3),
('23-03-2023 10:03:00',4),
('12-07-2023 14:36:00',5)
;

select * from pedido;

delete from pedido where ped_cd_id = 6;

-- Insert tabela do funcionário
insert into funcionario (func_tx_nome, func_tx_cpf)
values ('Junior','01234567899' ),
('Sthefany','22233344456'),
('Luiz', '55566677789'),
('Josi','11122233345'),
('Sophia','77788899911');

select func_tx_cpf
from funcionario;


alter table funcionario 
rename column fun_tx_cpf to func_tx_cpf;






