#Marco Antonio Borges

#1 -----------------------------------------
create database prova;

use prova;

#2 -----------------------------------------
create table clientes
(
CPF char(11) primary key,
Nome varchar(255),
Email varchar(255)
);

create table servicos_prestados
(
Cod char(10) primary key,
Servico varchar(100),
preco double
);

create table Prestadores
(
matricula char(10) primary key,
Nome varchar(100),
Email varchar(255)
);

insert into 
	Clientes(CPF, Nome, Email) 
    values ('888', 'Maria da Silva', 'maria@mail.com'), 
    ('999', 'Emerson Santos', 'emerson@mail.com'),
    ('111', 'Antonia Aparecida', 'antonia@mail.com'),
    ('222', 'Ana Clara de Souza', 'ana@mail.com'),
    ('333', 'Jorge Netto', 'jorge@mail.com'),
    ('444', 'Paulo Afonso Almeida', 'paulo@mail.com'),
    ('555', 'Andrea da Costa', 'andrea@mail.com');
    
insert into 
	servicos_prestados(Cod, Servico, preco) 
	values ('1', 'Jardinagem', 80),
    ('2', 'Limpeza geral', 250),
    ('3', 'Manutenção Hidráulica', 200),
    ('4', 'Manutenção Elétrica', 350);
    
insert into 
	prestadores(matricula, Nome, Email) 
    values ('A1', 'Carlos de Almeida', 'carlos@coisas.com.br'),
    ('A2', 'Ana Maria Pontes', 'ana@coisas.com.br'),
    ('A3', 'Joel Silveira', 'joel@coisas.com.br');

#3 -----------------------------------------
create table Operacao
(
DataOperacao Date,
Cliente char(11),
FOREIGN KEY (Cliente) REFERENCES clientes(CPF),
ServicoPrestado char(10),
FOREIGN KEY (ServicoPrestado) REFERENCES servicos_prestados(Cod),
Prestador char(10),
FOREIGN KEY (Prestador) REFERENCES prestadores(matricula)
);

insert into 
	Operacao(DataOperacao, Cliente, ServicoPrestado, Prestador)
    values ('2022/03/01', '888', '1', 'A1'),
    ('2022/06/05', '222', '2', 'A3');
    
#4 -------------------------------------------------
select CPF,Nome,Email from clientes order by nome;

#5 -------------------------------------------------
select Cod, Servico, preco from servicos_prestados where preco < 100;

#6 -------------------------------------------------
update servicos_prestados set preco = 120 where Cod = '1';

#7 -------------------------------------------------
delete from servicos_prestados where Cod = '4';

#8 -------------------------------------------------
update clientes set Email = 'netto@mail.com' where CPF = '333';

