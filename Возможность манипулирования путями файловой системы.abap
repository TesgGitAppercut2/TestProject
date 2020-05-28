r_name = request->get_form_field( 'report_name' ).
CONCATENATE `C:\\reports\\users\\` r_name INTO dsn.
CL_GUI_FRONTEND_SERVICES=>DIRECTORY_DELETE(dsn).

CALL METHOD CL_GUI_FRONTEND_SERVICES=>REGISTRY_GET_VALUE
EXPORTING
ROOT         = CL_GUI_FRONTEND_SERVICES=>HKEY_CURRENT_USER
KEY          = 'Application\Config'
VALUE        = 'report_file_name'
IMPORTING
REG_VALUE   = file
EXCEPTIONS
GET_REGVALUE_FAILED  = 1
CNTL_ERROR           = 2
ERROR_NO_GUI         = 3
NOT_SUPPORTED_BY_GUI = 4
others               = 5.
OPEN DATASET file.
DO.
READ DATASET file INTO record.
IF SY-SUBRC NE 0.
EXIT.
ELSE.
WRITE: / record.
ENDIF.
ENDDO.