#Tarefa dia 15/09
Create database Empresa;
Use empresa;

create table clientes
(
CPF char(11) primary key,
Nome varchar(255),
Email varchar(255)
);

create table telefone_clientes
(
CPF_Cliente char(11),
FOREIGN KEY (CPF_Cliente) REFERENCES clientes(CPF),
DDD int2,
Numero char(10)
);

create table vendedores
(
Matricula varchar(11) primary key,
CPF char(11),
Nome varchar(255),
Setor varchar(100),
Email varchar(255)
);

create table Produtos
(
Codigo char(11) primary key,
Produto varchar(255),
Descricao varchar(255),
Preco double
);

#################################################

insert into 
	clientes(cpf, nome, email) 
    values ('123456', 'Joao da Silva', 'jsilva@email.com');
    
insert into 
	telefone_clientes(CPF_Cliente, DDD, Numero)
    values ('123456', '41', '890045454');
    
insert into 
	clientes(cpf, nome, email) 
    values ('321654', 'Maria dos Santos', 'msantos@gmail.com');
    
insert into 
	telefone_clientes(CPF_Cliente, DDD, Numero)
    values ('321654', '41', '34569087');
    
insert into 
	telefone_clientes(CPF_Cliente, DDD, Numero)
    values ('321654', '41', '987651234');

insert into 
	vendedores(Matricula, CPF, Nome, Setor, Email)
    values ('A123', '234', 'Pedro Pedreira', 'Computadores', 'pedreira@empresa.com.br');
    
insert into 
	vendedores(Matricula, CPF, Nome, Setor, Email)
    values ('A321', '987', 'Ana de Assis', 'Automóveis', 'assis@empresa.com.br');    

insert into 
	vendedores(Matricula, CPF, Nome, Setor, Email)
    values ('B876', '9879', 'Patrícia Albuquerque', 'Aeronaves', 'paty@empresa.com.br');
    
insert into 
	Produtos(Codigo, Produto, Descricao, Preco)
    values ('0001', 'Tesla S3', 'Tesla S3 sposter', '3500000');
    
insert into 
	Produtos(Codigo, Produto, Descricao, Preco)
    values ('0002', 'Mac Pro', 'Notebook Mac Pro', '12000');
    
insert into 
	Produtos(Codigo, Produto, Descricao, Preco)
    values ('0003', 'MV Agusta', 'Helicóptero Agusta MV', '2000000');

#################################################
#a
select * from clientes;
#b
select * from clientes order by nome;
#c
select * from clientes where nome like 'p%';
#d
select * from vendedores order by nome desc;
#e
select nome, email from vendedores;
#f
select nome, cpf from vendedores where setor='Automóveis';
#g
select * from produtos order by preco desc;
#h
select produto, preco from produtos;
#i
select * from produtos where preco > 1000000;
#j
select * from produtos where preco between 10000 AND 50000;
#k
update clientes set nome = 'Jorge da Silva' where cpf = '123456';
#l
update produtos set preco = '15000' where codigo = '0002';
#m
update produtos set preco = preco + (preco * 0.15) where codigo = '0003';
