             PGM        PARM(&DTA &LIB)
             DCL        VAR(&VALUE) TYPE(*CHAR) LEN(2)
             DCL        VAR(&DTA) TYPE(*CHAR) LEN(10)
             DCL        VAR(&LIB) TYPE(*CHAR) LEN(10)

LOOP:        RTVDTAARA  DTAARA(&LIB/&DTA (1 2)) RTNVAR(&VALUE)
             MONTXUPD   VALUE(&VALUE)
             MONAPWAT
             MONMSG     MSGID(MON0000) EXEC(RETURN)
             GOTO LOOP
ENDPGM
