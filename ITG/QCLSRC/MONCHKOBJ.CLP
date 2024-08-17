             PGM        PARM(&OBJ &LIB)
             DCL        VAR(&VALUE) TYPE(*CHAR) LEN(2)
             DCL        VAR(&OBJ) TYPE(*CHAR) LEN(10)
             DCL        VAR(&LIB) TYPE(*CHAR) LEN(10)
LOOP:
             CHKOBJ     OBJ(&LIB/&OBJ) OBJTYPE(*FILE)
             MONMSG     MSGID(CPF9801) EXEC(DO)
             CHGVAR     VAR(&VALUE) VALUE('NO')
             GOTO       CMDLBL(UPDATE)
             ENDDO
             CHGVAR     VAR(&VALUE) VALUE('SI')
UPDATE:      MONTXUPD   VALUE(&VALUE)
             MONAPWAT
             MONMSG     MSGID(MON0000) EXEC(RETURN)
             GOTO LOOP
ENDPGM
