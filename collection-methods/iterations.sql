-------------------------------------------------------
----------------- Collection Methods ------------------
-------------------------------------------------------

------------- Iteration Over Collections --------------
-- There are 2 main ways to iterate over a collection, the FOR loop and the WHILE loop

-- FOR loop is used usually when the collection is dense and you need to access all the elements it contains
declare
  type items_aa is table of varchar2(60 char) index by binary_integer;
  l_items_aa items_aa;
begin
  l_items_aa(4) := 'Treadmill';
  l_items_aa(5) := 'Bike';
  l_items_aa(6) := 'Elliptical';

  <<print_collection>>
  for i in l_items_aa.first..l_items_aa.last
    loop
      dbms_output.put_line('Item at index: ' || i || ' has the value of: ' || l_items_aa(i));
    end loop print_collection;
end;

-- If the collection is sparse there is the need to check that the index exists in the collection
declare
  type items_aa is table of varchar2(60 char) index by binary_integer;
  l_items_aa items_aa;
begin
  l_items_aa(4) := 'Treadmill';
  l_items_aa(6) := 'Bike';
  l_items_aa(8) := 'Elliptical';

  <<print_collection>>
  for i in l_items_aa.first..l_items_aa.last
    loop
      continue print_collection when not l_items_aa.exists(i);

      dbms_output.put_line('Item at index: ' || i || ' has the value of: ' || l_items_aa(i));
    end loop print_collection;
end;


-- The better way to iterate into a sparse collection is with the WHILE loop
declare
  type items_aa is table of varchar2(60 char) index by binary_integer;
  l_items_aa items_aa; l_index binary_integer;
begin
  l_items_aa(4) := 'Treadmill';
  l_items_aa(6) := 'Bike';
  l_items_aa(8) := 'Elliptical';

  l_index := l_items_aa.first;
  <<print_collection>>
  while l_index is not null
    loop
      dbms_output.put_line('Item at index: ' || l_index || ' has the value of: ' || l_items_aa(l_index));
      l_index := l_items_aa.next(l_index);
    end loop print_collection;
end;

-- The WHILE loop can also be used to iterate in the reverse order of the collection
declare
  type items_aa is table of varchar2(60 char) index by binary_integer;
  l_items_aa items_aa; l_index binary_integer;
begin
  l_items_aa(4) := 'Treadmill';
  l_items_aa(6) := 'Bike';
  l_items_aa(8) := 'Elliptical';

  l_index := l_items_aa.last;
  <<print_collection>>
  while l_index is not null
    loop
      dbms_output.put_line('Item at index: ' || l_index || ' has the value of: ' || l_items_aa(l_index));
      l_index := l_items_aa.prior(l_index);
    end loop print_collection;
end;

-- FOR loop can also be used for reverse iteration

-- If the collection is sparse there is the need to check that the index exists in the collection
declare
  type items_aa is table of varchar2(60 char) index by binary_integer;
  l_items_aa items_aa;
begin
  l_items_aa(4) := 'Treadmill';
  l_items_aa(6) := 'Bike';
  l_items_aa(8) := 'Elliptical';

  <<print_collection>>
  for i in reverse l_items_aa.first..l_items_aa.last
    loop
      continue print_collection when not l_items_aa.exists(i);

      dbms_output.put_line('Item at index: ' || i || ' has the value of: ' || l_items_aa(i));
    end loop print_collection;
end;

