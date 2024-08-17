             PGM        PARM(&LIB)
             DCL        VAR(&LIB) TYPE(*CHAR) LEN(11)
             CRTSAVF    FILE(QGPL/&LIB)
             MONMSG     MSGID(CPF0000)
             SAVLIB     LIB(&LIB) DEV(*SAVF) SAVF(QGPL/&LIB) +
                          TGTRLS(V7R1M0)
ENDPGM
