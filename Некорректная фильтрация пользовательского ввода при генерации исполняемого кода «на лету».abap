TYPES prog TYPE TABLE OF string WITH EMPTY KEY.
DATA(text) = concat_lines_of( VALUE prog(
( |PROGRAM.\n\n| )
( |FORM do_it.\n| )
( | ...\n| )
( |ENDFORM.| ) ) ).
CALL FUNCTION 'DEMO_INPUT_TEXT'
CHANGING
text_string = text
EXCEPTIONS
canceled = 4.
IF sy-subrc = 4.
LEAVE PROGRAM.
ENDIF.
SPLIT text AT |\n| INTO TABLE DATA(prog).
GENERATE SUBROUTINE POOL prog NAME DATA(pool).
IF sy-subrc = 0.
PERFORM do_it IN PROGRAM (pool).
ENDIF.

PARAMETERS P_REPID LIKE TRDIR-NAME DEFAULT 'Z*'.
<…>
CALL FUNCTION 'GUI_UPLOAD'
EXPORTING
FILENAME = <some file>
FILETYPE = 'ASC'
TABLES
DATA_TAB = REPPU.
INSERT REPORT P_REPID FROM REPPU.