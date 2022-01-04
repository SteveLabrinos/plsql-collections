-------------------------------------------------------
------------- Associative Arrays Index-----------------
-------------------------------------------------------

--------------------- Index Type ----------------------
-- The index can be of type String like varchar, varchar2, string, long
-- Or numeric type like pls_integer, binary_integer
-- associative arrays can be sparse. There can be a value for index -10 and then on index 10

------------------------ DEMO -------------------------
declare
  type items_aa is table of varchar2(60 byte) index by binary_integer;
  l_items_aa items_aa;
begin
  l_items_aa(-10) := 'Treadmill';
  l_items_aa(20) := 'Bike';
  dbms_output.put_line('Value at index 20 in l_items_aa array initially is: ' || l_items_aa(20));
  l_items_aa(3) := 'Elliptical';
  l_items_aa(20) := 'Elliptical';
  dbms_output.put_line('New Value at index 20 in l_items_aa array is: ' || l_items_aa(20));
end;

-- Common errors when working with associative arrays are
-- null_value error -> when we specify that the array is NOT NULL
-- value_error -> when we assign wrong datatype in the array
-- no_data_found error -> when we try to access an index with no value assigned
-- numeric overflow -> when we exceed the the range of the index type, like 2,147,483,647 in binary_index positive value

------------------------ DEMO -------------------------
-- Error PLS-00382: expression is of wrong type
declare
  type items_aa is table of varchar2(4 char) not null index by binary_integer;
  l_items_aa items_aa;
begin
  l_items_aa(1) := null;
end;

-- Error ORA-06502: PL/SQL: numeric or value error: character string buffer too small
declare
  type items_aa is table of varchar2(4 char) not null index by binary_integer;
  l_items_aa items_aa;
begin
  l_items_aa(1) := 'To large value';
end;

-- Error ORA-01403: no data found
declare
  type items_aa is table of varchar2(10 char) not null index by binary_integer;
  l_items_aa items_aa;
begin
  l_items_aa(1) := 'Treadmill';
  -- The value doesn't exist
  dbms_output.PUT_LINE(l_items_aa(2));
end;