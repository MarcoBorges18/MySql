#Ver o que ha na tabela products
select * from customers;

#Mostrar a estrutura da tabela
describe customers;

#Contar o numero de registros em customers
select count(*) from customers;

#Ver quais dados ha na tabela products
#Qual é a estrutura da tabala products
#Quantos produtos há na tabela products

select * from products;
describe products;
select count(*) from products;

#Ver quais cidades há na tabela Customers
select distinct city from customers;

#Quais são as regiões na tabela customers
select distinct country_region from customers;

#Contar a quantidade de clientes por cidade
select city, count(*) as qtd_cutomers from customers group by city;

#Quais são as categorias na tabela products (Sem dublicatas)
#Contar quantos produtos há por categoria
select distinct category from products;
select category as Categoria, count(*) as Qtd_Categorias from products group by category order by Categoria;

#Mostrar o preço médio dos produtos por categoria
select category, avg(list_price) as preco_medio from products group by category;

#Quais produtos cada cliente comprou?
#Estrutura da tabela orders
describe orders;

#Mostrar os dados da venda id = 31
select * from orders where id = 31;

#Quais produtos foram vendidos na venda (orders) id = 31;
select 
	orders.id, 
    orders.employee_id, 
    orders.customer_id, 
    customers.first_name,
    employees.first_name,
    orders.order_date,
    order_details.product_id,
    products.product_name,
    order_details.quantity,
    order_details.unit_price,
    order_details.discount
from orders
inner join order_details on orders.id = order_details.order_id
inner join products on order_details.product_id = products.id
inner join customers on orders.customer_id = customers.id
inner join employees on orders.employee_id = employees.id
where orders.id = 31;