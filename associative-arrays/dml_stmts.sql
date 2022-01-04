-- Insert into customers table
insert into customers(cust_id, cust_name, cust_location)
values (1, 'John', 'WA');

insert into customers(cust_id, cust_name, cust_location)
values (2, 'Jack', 'CA');

insert into customers(cust_id, cust_name, cust_location)
values (3, 'Jill', 'CA');

-- Insert into accounts table
insert into accounts(act_id, act_cust_id, act_bal)
values (1, 1, 1000);

insert into accounts(act_id, act_cust_id, act_bal)
values (2, 2, 1000);

insert into accounts(act_id, act_cust_id, act_bal)
values (3, 3, 1000);

-- Insert into items table
insert into items(item_id, item_name, item_value)
values (1, 'Treadmill', 600);

insert into items(item_id, item_name, item_value)
values (2, 'Elliptical', 600);

insert into items(item_id, item_name, item_value)
values (3, 'Bike', 600);

insert into orders(order_id, order_item_id, order_act_id)
values (orders_seq.nextval, 1, 1);

insert into orders(order_id, order_item_id, order_act_id)
values (orders_seq.nextval, 2, 1);

insert into orders(order_id, order_item_id, order_act_id)
values (orders_seq.nextval, 2, 2);

insert into orders(order_id, order_item_id, order_act_id)
values (orders_seq.nextval, 3, 1);

insert into orders(order_id, order_item_id, order_act_id)
values (orders_seq.nextval, 3, 2);

insert into orders(order_id, order_item_id, order_act_id)
values (orders_seq.nextval, 3, 3);

commit;