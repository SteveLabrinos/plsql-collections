-------------------------------------------------------
----------------- Collection Methods ------------------
-------------------------------------------------------

---------------- Trim & Extend Methods ----------------
-- These methods are only applicable to VARRAYS and NESTED TABLES and NOT for ASSOCIATIVE ARRAYS

-- TRIM method without arguments removes one element from the end of the collection
-- TRIM(n) removes n elements from the end
---- This can raise an exception subscript if the n value goes beyond count


-- EXTEND method adds one null element at the end of the collection
-- EXTEND(n) will append n null elements at the end of the collection
-- EXTEND(n, i) Adds n elements with copy of element i at the end of the collection

