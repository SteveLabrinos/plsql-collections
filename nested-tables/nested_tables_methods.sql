-------------------------------------------------------
--------------- Nested Tables Methods -----------------
-------------------------------------------------------

------------------- Adding Elements -------------------
-- It has an Integer index that starts with the value of 1

-- To add elements into the collection you use the EXTEND method and then apply a value to LAST element
declare
  type items_nt is table of varchar2(60 byte);
  l_items_nt items_nt := items_nt();
begin
  l_items_nt.extend;
  l_items_nt(l_items_nt.last) := 'Bike';

  l_items_nt.extend;
  l_items_nt(l_items_nt.last) := 'Treadmill';

  dbms_output.put_line('The total items of the nested table is ' || l_items_nt.count);
end;

-- Adding elements to more complex type table
declare
  type items_rec is record (item_name items.item_name%type, count pls_integer);
  type items_nt is table of items_rec;
  l_items_nt items_nt := items_nt();
begin
  l_items_nt.extend;
  l_items_nt(l_items_nt.last).item_name := 'Bike';
  l_items_nt(l_items_nt.last).count := 1;

  l_items_nt.extend;
  l_items_nt(l_items_nt.last).item_name := 'Treadmill';
  l_items_nt(l_items_nt.last).count := 2;
  dbms_output.put_line('The first element of the nested table is ' || l_items_nt(1).item_name);
end;

-- Using a cursor to populate a nested table
declare
  type items_nt is table of varchar2(60);
  l_items_nt items_nt := items_nt(); cursor cur_items is
  select *
    from items;
begin
  for r_item in cur_items
    loop
      l_items_nt.extend;
      l_items_nt(l_items_nt.last) := r_item.item_name;
    end loop;
  dbms_output.put_line('The nested table has a total of ' || l_items_nt.count || ' elements');
end;

-- There is also the extend method with a parameter of how many elements to extend
declare
  type items_nt is table of varchar2(60);
  l_items_nt items_nt := items_nt();
begin
  l_items_nt.extend(2);
  l_items_nt(1) := 'Bike';
  l_items_nt(2) := 'Treadmill';

  dbms_output.put_line('The nested table has a total of ' || l_items_nt.count || ' elements');
end;

-- The last method of extend has tow parameters, the first showing the number of elements to add
-- and the second the index of which the items will be copied to the new element spots
declare
  type items_nt is table of varchar2(60);
  l_items_nt items_nt := items_nt();
begin
  l_items_nt.extend(2);
  l_items_nt(1) := 'Bike';
  l_items_nt(2) := 'Treadmill';

  l_items_nt.extend(2, 1);

  dbms_output.put_line('The nested table has a total of ' || l_items_nt.count || ' elements');
  for i in l_items_nt.first..l_items_nt.last loop
    dbms_output.put_line('The element in position '|| i || ' is ' || l_items_nt(i));
    end loop;
end;


------------------- Removing Elements -------------------
-- Nested tables can be sparse like associative arrays
-- The delete method is used with no arguments to remove all elements, or with a parameter
-- to specify the index of the element to be deleted
declare
  type items_nt is table of varchar2(60);
  l_items_nt items_nt := items_nt();
begin
  l_items_nt.extend(3);
  l_items_nt(1) := 'Bike';
  l_items_nt(2) := 'Treadmill';
  l_items_nt(3) := 'Elliptical';

  l_items_nt.delete(2);
  dbms_output.put_line('The nested table has a total of ' || l_items_nt.count || ' elements');
  l_items_nt.delete;
  dbms_output.put_line('The nested table has a total of ' || l_items_nt.count || ' elements');
end;


------------------- Table Assignments -------------------
-- Assigning Another Nested Table if they are of the same type
declare
  type items_nt is table of varchar2(60);
  l_items_nt items_nt := items_nt();
  l_copy_nt items_nt;
begin
  l_items_nt.extend(3);
  l_items_nt(1) := 'Bike';
  l_items_nt(2) := 'Treadmill';
  l_items_nt(3) := 'Elliptical';

  l_copy_nt := l_items_nt;

  dbms_output.put_line('The copied nested table has ' || l_copy_nt.count || ' elements');
end;