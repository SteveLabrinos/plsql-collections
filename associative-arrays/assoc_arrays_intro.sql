-------------------------------------------------------
----------------- Associative Arrays ------------------
-------------------------------------------------------

------------ What is an Associative Array? ------------

-- PL/SQL table also known as Index-by table is the most commonly used collection type
-- Key-Value pair with string or pls_integer as key type
-- It is a PL/SQL Only datatype defined in anonymous blocks, procedures and functions
-- as a In-Memory table

-- SYNTAX
-- TYPE <type_name> IS TABLE OF <element_type> [NOT NULL]
-- INDEX BY [BINARY_INTEGER | PLS_INTEGER | VARCHAR2(size_limit)]
-- First Declare TYPE and then Declare Variable for this type
-- Example
-- type items_aa is table of varchar2(60) index by binary_integer;
-- l_items_aa     items_aa;

------------------ Assign Values ----------------------
declare
  type items_aa is table of varchar2(60 byte) index by binary_integer;
  l_items_aa items_aa; l_copy_aa items_aa;
begin
  l_items_aa(1) := 'Treadmill';
  l_items_aa(2) := 'Bike';
  l_items_aa(3) := 'Elliptical';

  -- can also copy the entire collection
  -- the collection is copied by value and not by reference
  l_copy_aa := l_items_aa;
  l_copy_aa(2) := 'Glove';

  dbms_output.put_line(l_items_aa(2));
  dbms_output.put_line(l_copy_aa(2));
end;

-- the collections can by copied to new variables as long as they have the same datatype
declare
  type items_aa is table of varchar2(60 byte) index by binary_integer;
  type dup_aa is table of varchar2(60 byte) index by binary_integer;
  l_items_aa items_aa; l_dup_aa dup_aa;
begin
  l_items_aa(1) := 'Treadmill';
  l_items_aa(2) := 'Bike';
  l_items_aa(3) := 'Elliptical';

  -- because the collections have different names (items_aa, dup_aa) they are considered different datatype
  -- the assignment below will raise an ORA-06550: expression is of wrong type ERROR
  l_dup_aa := l_items_aa;

  dbms_output.put_line(l_dup_aa(2));
end;

-- Re initializing an associative array
declare
  type items_aa is table of varchar2(60 byte) index by binary_integer;
  l_items_aa items_aa; l_empty_aa items_aa;
begin
  l_items_aa(1) := 'Treadmill';
  l_items_aa(2) := 'Bike';
  l_items_aa(3) := 'Elliptical';

  dbms_output.put_line(l_items_aa(2));
  -- If we need to clear the collection after processing it, we can copy the empty array
  l_items_aa := l_empty_aa;

  dbms_output.put_line('The size of the re-initialized collection is: ' || l_items_aa.count);
end;

---------------------- DEMO ---------------------------
declare
  type items_aa is table of varchar2(60 byte) index by binary_integer;
  l_items_aa items_aa; l_items_copy_aa items_aa; l_empty_aa items_aa;
begin
  l_items_aa(1) := 'Treadmill';
  l_items_aa(2) := 'Bike';
  l_items_aa(3) := 'Elliptical';

  dbms_output.put_line('Value at index counter 2 in l_items_aa array: ' || l_items_aa(2));
  dbms_output.put_line('Copying l_items_aa array to l_items_copy_aa array');

  l_items_copy_aa := l_items_aa;

  dbms_output.put_line('Value at index counter 2 in l_items_copy_aa array: ' || l_items_copy_aa(2));
  dbms_output.put_line('Initializing l_items_aa array to an empty array by assigning l_empty_aa to it');

  l_items_aa := l_empty_aa;
  dbms_output.put_line('The size of the re-initialized l_items_aa array is: ' || l_items_aa.count);
end;

-- Use the above example with the items table in the database
declare
  type items_aa is table of items%rowtype index by binary_integer;

  cursor cur_items is
    select *
      from items
     order by item_id; l_items_aa items_aa;
begin
  <<fil_collection>>
  for r_item in cur_items
    loop
      l_items_aa(cur_items%rowcount) := r_item;
    end loop fil_collection;

  <<print_results>>
  for i in 1..l_items_aa.count
    loop
      dbms_output.put_line('At Counter ' || i || ': Item ID is ' || l_items_aa(i).item_id || ' Item Name is ' ||
                           l_items_aa(i).item_name);
    end loop print_results;
end ;


-- Draft SQL stmts --
select *
  from items;

select *
  from accounts
         inner join customers c2 on c2.cust_id = accounts.act_cust_id;

