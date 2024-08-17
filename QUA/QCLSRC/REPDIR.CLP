             PGM
             DCLF       FILE(QGPL/DIRE)
LOOP:
             RCVF
             MONMSG     MSGID(CPF0864) EXEC(GOTO CMDLBL(END))
             ADDDIRE    USRID(&WOSDDEN WOSDDGN) USRD(&WOSDDESC) +
                          USER(&WOSDUSRP)
             MONMSG     MSGID(CPF0000)
             GOTO       CMDLBL(LOOP)
END:
ENDPGM
