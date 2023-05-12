#Nome: Marco Antonio Borges
#RGM: 30157439
#Data: 24/11/2022

# 1 -
create database prova2b;
use prova2b;
# -------------------------------


# 2 -
create table clientes(
CPF char(11) primary key,
Nome varchar(255),
Email varchar(255)
);

create table vendedores(
codvendedor char(3) primary key,
nome varchar(255)
);

create table produtos(
codproduto char(3) primary key,
produto varchar(255),
preco double
);

insert into clientes (CPF, Nome, Email)
	values ('888', 'Pedro de Lara', 'plara@gmail.com'),
    ('999', 'Araci de Almeica', 'aalmeida@gmail.com');
    
insert into vendedores (codvendedor,nome)
	values ('v01', 'Joana Santos'),
	('v02', 'Paulo Silva');
    
insert into produtos (codproduto, produto, preco)
	values ('p01', 'Notbook', 3000),
    ('p02', 'Mouse', 20),
    ('p03', 'Monitor', 800);
# -------------------------------  
  
  
# 3 -
create table vendas(
id int primary key auto_increment,
datavenda date,
cpf_cliente char(11),
foreign key (cpf_cliente) references clientes(CPF),
id_codvendedor char(3),
foreign key (id_codvendedor) references vendedores(codvendedor),
id_produto char(3),
foreign key (id_produto) references produtos(codproduto),
qntd_vendida int
);

    
insert into vendas (datavenda,cpf_cliente,id_codvendedor,id_produto,qntd_vendida)
	values ('2022-03-01', '888', 'v01', 'p01', 1),
	('2022-06-05', '999', 'v02', 'p03', 1),
    ('2022-06-08', '999', 'v01', 'p02', 3);
# ------------------------------- 
 
 
# 4 -    
select 
	produtos.codproduto,
    produtos.produto,
    vendas.qntd_vendida,
    sum(produtos.preco * vendas.qntd_vendida) as TotalVendido
from vendas
join produtos on vendas.id_produto = produtos.codproduto
group by produtos.codproduto, produtos.produto;
# -------------------------------


# 5 -
select
	vendedores.nome,
    sum(produtos.preco * vendas.qntd_vendida) as TotalVendido
from vendas
join vendedores on vendas.id_codvendedor = vendedores.codvendedor
join produtos on vendas.id_produto = produtos.codproduto
group by vendedores.nome;
# -------------------------------

# 6 -
create user 'prova'@'localhost'
identified by 'teste';
GRANT SELECT, INSERT, UPDATE ON prova2b.* TO 'prova'@'localhost';