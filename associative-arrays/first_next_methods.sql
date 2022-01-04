-------------------------------------------------------
------------- Associative Arrays Index-----------------
-------------------------------------------------------

----------------- First and Next ----------------------
-- SYNTAX <collection_variable>.<collection_method>

-- FIRST -> The first index counter in the collection
-- NEXT  -> The next index counter in the collection
-- The above methods return the index counter and not the value assigned in the collection

-- Associative array Sorting happens automatically based on the index


---------------------- DEMO ---------------------------
declare
  type items_aa is table of varchar2(60 char) index by binary_integer;
  l_items_aa items_aa; l_index binary_integer; l_value varchar2(60 char);
begin
  l_items_aa(-10) := 'Treadmill';
  l_items_aa(20) := 'Bike';
  l_items_aa(3) := 'Weights';

  l_index := l_items_aa.first;
  <<print_collection>>
  while l_index is not null
    loop
      l_value := l_items_aa(l_index);
      dbms_output.put_line('Index counter: ' || l_index || ' Value: ' || l_value);
      l_index := l_items_aa.next(l_index);
    end loop print_collection;
end;


declare
  type days_aa is table of pls_integer index by varchar2(20 char);
  l_days_aa days_aa; l_index varchar2(20 char);
begin
  l_days_aa('Sunday') := 1;
  l_days_aa('Monday') := 2;
  l_days_aa('Tuesday') := 3;

  l_index := l_days_aa.first;
  <<print_collection>>
  while l_index is not null
    loop
      dbms_output.put_line('Index counter: ' || l_index || ' Value: ' || l_days_aa(l_index));
      l_index := l_days_aa.next(l_index);
    end loop print_collection;
end;

