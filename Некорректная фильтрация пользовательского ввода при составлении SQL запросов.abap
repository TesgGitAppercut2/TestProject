DATA: itm TYPE c.
DATA: user TYPE c.
...
itm = request->get_form_field( 'itm' ).
user = request->get_form_field( 'user' ).
CONCATENATE `user = '` user `'` INTO cl_where.
CONCATENATE cl_where ` AND itm = '` itm `'` INTO cl_where.
SELECT *
FROM items
INTO CORRESPONDING FIELDS OF TABLE itab_items
WHERE (cl_where).
ENDSELECT.