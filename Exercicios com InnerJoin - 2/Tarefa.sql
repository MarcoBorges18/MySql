###########################################
#Tarefa 20/10
# Marco Antonio Borges
# RGM: 30157439
# 20/10/2022

# 1a - 
select
	employees.first_name as Nome_Funcionario,
    products.product_name as Nome_Produto,
    order_details.quantity as Quantidade,
    order_details.unit_price as Preco_Unitario,
    order_details.discount as Desconto,
    ((order_details.quantity * order_details.unit_price) - order_details.discount) as Valor_Total
    from orders
    inner join order_details on orders.id = order_details.order_id
	inner join products on order_details.product_id = products.id
	inner join employees on orders.employee_id = employees.id
    order by Valor_total;
    
# 1b - 
select
	employees.first_name as Nome_Funcionario,
    products.product_name as Nome_Produto,
    customers.first_name as Nome_cliente,
    order_details.quantity as Quantidade,
    order_details.unit_price as Preco_Unitario,
    order_details.discount as Desconto,
    ((order_details.quantity * order_details.unit_price) - order_details.discount) as Valor_Total
    from orders
    inner join order_details on orders.id = order_details.order_id
	inner join products on order_details.product_id = products.id
	inner join employees on orders.employee_id = employees.id
    inner join customers on orders.customer_id = customers.id
    order by employees.first_name;
    
# 2a -

select
	products.product_name as Nome_Produto,
    purchase_order_details.quantity as Quantidade,
    purchase_order_details.unit_cost as Valor_Pago,
    (purchase_order_details.quantity * purchase_order_details.unit_cost) as Valor_Total,
    purchase_order_details.date_received as Data_Recebimento
	from purchase_order_details
	inner join products on purchase_order_details.product_id = products.id
	inner join purchase_orders on purchase_order_details.purchase_order_id = purchase_orders.id;
    
# 2b - 

select
	suppliers.company as Empresa,
	products.product_name as Nome_Produto,
    purchase_order_details.quantity as Quantidade,
    purchase_order_details.unit_cost as Valor_Pago,
    (purchase_order_details.quantity * purchase_order_details.unit_cost) as Valor_Total,
    purchase_order_details.date_received as Data_Recebimento
	from purchase_order_details
	inner join products on purchase_order_details.product_id = products.id
	inner join purchase_orders on purchase_order_details.purchase_order_id = purchase_orders.id
    inner join suppliers on purchase_orders.supplier_id = suppliers.id
    order by suppliers.company;
    
# 3a - 

select
	employees.first_name as Nome_Vendedor,
	sum(order_details.unit_price * order_details.quantity) as Valor_total_Vendido
    from orders
    inner join order_details on orders.id = order_details.order_id
    inner join employees on orders.employee_id = employees.id
    group by employees.first_name
    order by employees.first_name;
    
# 3b - 

select
	employees.first_name as Nome_Vendedor,
	avg(order_details.unit_price * order_details.quantity) as Valor_total_Vendido
    from orders
    inner join order_details on orders.id = order_details.order_id
    inner join employees on orders.employee_id = employees.id
    group by employees.first_name
    order by employees.first_name;
    
# 3c - 

select
	customers.first_name as Nome_Cliente,
	sum(order_details.unit_price * order_details.quantity) as Valor_total_Comprado
    from orders
    inner join order_details on orders.id = order_details.order_id
    inner join customers on orders.customer_id = customers.id
	group by customers.first_name
	order by customers.first_name;
    
# 3e -

select
	suppliers.company,
    sum(purchase_order_details.quantity * purchase_order_details.unit_cost) as Total_Gasto
	from purchase_order_details
	inner join products on purchase_order_details.product_id = products.id
	inner join purchase_orders on purchase_order_details.purchase_order_id = purchase_orders.id
    inner join suppliers on purchase_orders.supplier_id = suppliers.id
    group by suppliers.company
    order by suppliers.company;
