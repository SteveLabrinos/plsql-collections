-------------------------------------------------------
------------- Associative Arrays Index-----------------
-------------------------------------------------------

----------- Where Can They Be Declared ----------------
-- In anonymous blocks
-- In stored programs units

-- The visibility is local for local declarations
-- In package specification -> Global visibility

------------------------- DEMO -------------------------
create or replace package globals is
  type items_aa is table of number index by pls_integer;
  type order_count_rec is record (item_id number, order_count number);
  type order_count_aa is table of order_count_rec index by pls_integer;

  g_items_aa items_aa;
end globals;
/


create or replace procedure set_items is
  l_cnt pls_integer := 0; cursor cur_items is
    select item_id
      from items;
begin
  <<get_items>>
  for r_item in cur_items
    loop
      l_cnt := cur_items%rowcount;
      globals.g_items_aa(l_cnt) := r_item.item_id;
    end loop get_items;
  dbms_output.put_line('Items Set count ' || l_cnt);
end;
/

create or replace function get_order_count return globals.order_count_aa is
  cursor cur_order_count(p_item_id items.item_id%type) is
    select count(*)
      from orders
     where order_item_id = p_item_id;
  l_order_count_aa globals.order_count_aa;
  l_index          number;
  l_item_id        items.item_id%type;
  l_counter        number := 0;
begin
  l_index := globals.g_items_aa.first;

  <<fil_order_count_aa>>
  while l_index is not null
    loop
      l_item_id := globals.g_items_aa(l_index);
      l_counter := l_counter + 1;
      l_order_count_aa(l_counter).item_id := l_item_id;

      open cur_order_count(p_item_id => l_item_id);
      fetch cur_order_count into l_order_count_aa(l_counter).order_count;
      close cur_order_count;

      l_index := globals.g_items_aa.next(l_index);
    end loop fil_order_count_aa;
  return l_order_count_aa;
end get_order_count;
/

-- Use the stored program units to fill the collection with the item_id number or order for each item
declare
  l_order_aa globals.order_count_aa; l_index pls_integer := 0;
begin
  -- Populate globals.g_items_aa
  set_items;
  l_order_aa := get_order_count;
  dbms_output.put_line('COUNT: ' || l_order_aa.count);

  l_index := l_order_aa.first;
  <<print_array>>
  while l_index is not null
    loop
      dbms_output.put_line('Item ID: ' || l_order_aa(l_index).item_id || ' Order Count: ' ||
                           l_order_aa(l_index).order_count);
      l_index := l_order_aa.next(l_index);
    end loop print_array;
end;
/






