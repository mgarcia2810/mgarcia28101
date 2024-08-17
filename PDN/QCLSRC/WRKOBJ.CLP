             PGM        PARM(&OBJ &LIB &TYP)
             DCL        VAR(&OBJ) TYPE(*CHAR) LEN(11)
             DCL        VAR(&LIB) TYPE(*CHAR) LEN(11)
             DCL        VAR(&TYP) TYPE(*CHAR) LEN(7)
             DCL        VAR(&MSG) TYPE(*CHAR) LEN(100)

             DSPOBJD    OBJ(&LIB/&OBJ) OBJTYPE(&TYP)
             MONMSG     MSGID(CPF0000)
             RCVMSG     MSG(&MSG)
             SNDPGMMSG  MSG(&MSG)
ENDPGM
