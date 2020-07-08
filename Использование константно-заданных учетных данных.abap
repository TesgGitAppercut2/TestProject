AUTHORITY-CHECK 'Z_CUSTOM_AUTH_OBJ'
IF sy-subrc <> 0.
    IF sy-uname <> 'DEVELOPER'.
        LEAVE PROGRAM.
    ENDIF.
ENDIF.
“Doing critical things
