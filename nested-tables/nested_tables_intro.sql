-------------------------------------------------------
------------------- Nested Tables ---------------------
-------------------------------------------------------

------------ Where can they be declared? --------------
-- In Anonymous blocks and stored units

-- Syntax
-- type <type_name> is table of <element_type> [NOT NULL];
-- Examples
declare
  type numbers_nt is table of number;
  type customer_nt is table of customers%rowtype;

  l_numbers_nt numbers_nt; l_customers_nt customer_nt := customer_nt();
begin
  l_numbers_nt := numbers_nt(1, 3, 5);
  dbms_output.put_line('The numbers nested table collection has ' || l_numbers_nt.count ||
                       ' elements, after initialization');
  dbms_output.put_line('The customers table collection has ' || l_customers_nt.count ||
                       ' elements, after initialization');
end;

-- Nested tables differ from associative arrays. When the variable is declared the collection is undefined
-- To initialize a nested table collection we use the constructor


