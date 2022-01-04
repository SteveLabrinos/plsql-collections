create table customers
(
  cust_id       number        not null primary key,
  cust_name     varchar2(100) not null,
  cust_location varchar2(2)   not null
);

create table accounts
(
  act_id      number not null primary key,
  act_cust_id number not null,
  act_bal     number(10, 2),
  constraint fk_act_cust_custid foreign key (act_cust_id) references
    customers(cust_id)
);

create table items
(
  item_id    number       not null primary key,
  item_name  varchar2(60) not null,
  item_value number(5, 2) not null
);

create table orders
(
  order_id      number not null primary key,
  order_item_id number not null,
  order_act_id  number not null,
  constraint fk_order_item_itemid foreign key (order_item_id) references
    items(item_id),
  constraint fk_order_act_actid foreign key (order_act_id) references
    accounts(act_id)
);

create sequence orders_seq start with 1 increment by 1;
