TABLES t100.
PARAMETERS p TYPE c LENGTH 4 DEFAULT '100T'.
t100-sprsl = 'E'.
t100-arbgb = 'BC'.
t100-msgnr = '010'.
READ TABLE t100 SEARCH FKEQ VERSION p.
IF sy-subrc = 0.
    ...
ENDIF.