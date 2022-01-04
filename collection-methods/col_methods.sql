-------------------------------------------------------
----------------- Collection Methods ------------------
-------------------------------------------------------

----------- Last, exists, delete & prior ---------------
-- Syntax: <collection_variable>.<collection_method>

-- LAST method, returns the last index in the collection
declare
  type items_aa is table of varchar2(60 char) index by binary_integer;
  l_items_aa items_aa; l_last_index binary_integer;
begin
  l_items_aa(-10) := 'Treadmill';
  l_items_aa(20) := 'Bike';
  l_items_aa(3) := 'Elliptical';

  l_last_index := l_items_aa.last;
  dbms_output.put_line('Last index of the collection is : ' || l_last_index); -- 20
end;

-- EXISTS(n) method takes parameter n and checks for existence of index counter and returns a boolean
-- Useful to iterate over a sparse collection
declare
  type items_aa is table of varchar2(60 char) index by binary_integer;
  l_items_aa items_aa;
begin
  l_items_aa(-10) := 'Treadmill';
  l_items_aa(20) := 'Bike';
  l_items_aa(3) := 'Elliptical';

  if l_items_aa.exists(1) then
    dbms_output.put_line('Item exists for Counter 1 and the value is: ' || l_items_aa(1));
  else
    dbms_output.put_line('Item does not exist for Counter 1');
  end if;
end;

-- COUNT method returns the number of elements stored in the collection
declare
  type items_aa is table of varchar2(60 char) index by binary_integer;
  l_items_aa items_aa;
begin
  l_items_aa(-10) := 'Treadmill';
  l_items_aa(20) := 'Bike';
  l_items_aa(3) := 'Elliptical';

  dbms_output.put_line('Number of elements: ' || l_items_aa.count); -- 3

  dbms_output.put_line('Last index number: ' || l_items_aa.last); -- 20

end ;

-- DELETE method removes all elements in a collection if it is called without parameters
-- In Varrays is the only type of method that can be called
declare
  type items_aa is table of varchar2(60 char) index by binary_integer;
  l_items_aa items_aa;
begin
  l_items_aa(-10) := 'Treadmill';
  l_items_aa(20) := 'Bike';
  l_items_aa(3) := 'Elliptical';

  l_items_aa.delete;
  dbms_output.put_line('Number of elements: ' || l_items_aa.count); -- 3
end ;

-- DELETE(n) method removes the element in the position on the index n and if the value is null it does nothing
declare
  type items_aa is table of varchar2(60 char) index by binary_integer;
  l_items_aa items_aa;
begin
  l_items_aa(-10) := 'Treadmill';
  l_items_aa(20) := 'Bike';
  l_items_aa(3) := 'Elliptical';

  l_items_aa.delete(20);

  if l_items_aa.exists(20) then
    dbms_output.put_line('Item exists for Counter 20 and the value is: ' || l_items_aa(20));
  else
    dbms_output.put_line('Item does not exist for Counter 20');
  end if;
end ;


-- DELETE(n, m) method removes all the elements from n to m index inclusive
declare
  type items_aa is table of varchar2(60 char) index by binary_integer;
  l_items_aa items_aa;
begin
  l_items_aa(-10) := 'Treadmill';
  l_items_aa(20) := 'Bike';
  l_items_aa(3) := 'Elliptical';

  l_items_aa.delete(3, 20);

  dbms_output.put_line('Number of elements: ' || l_items_aa.count); -- 1

  if l_items_aa.exists(20) then
    dbms_output.put_line('Item exists for Counter 20 and the value is: ' || l_items_aa(20));
  else
    dbms_output.put_line('Item does not exist for Counter 20');
  end if;
end ;

-- PRIOR(n) method gets the prior index in the collection from the specified index n of the parameter
-- DELETE(n, m) method removes all the elements from n to m index inclusive
declare
  type items_aa is table of varchar2(60 char) index by binary_integer;
  l_items_aa items_aa; l_prior_index binary_integer;
begin
  l_items_aa(-10) := 'Treadmill';
  l_items_aa(20) := 'Bike';
  l_items_aa(25) := 'Elliptical';
  l_items_aa(27) := 'Weights';

  l_prior_index := l_items_aa.prior(25);

  dbms_output.put_line('Item exists for Counter ' || l_prior_index || ' prior to 25 and the value is: ' ||
                       l_items_aa(l_prior_index));
end ;



