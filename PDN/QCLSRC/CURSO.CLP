PGM
             DCLF       FILE(SERGIOC/USRCURSO)
LOOP:
RCVF
             MONMSG     MSGID(CPF0864) EXEC(GOTO CMDLBL(END))
             SNDMSG     MSG('Prueba para Curso, por favor conteste +
                          el mensaje con cualquier opcion') +
                          TOMSGQ(&USR/&MSGQ) MSGTYPE(*INQ)
             SNDMSG     MSG('Prueba para Curso') TOMSGQ(&USR/&MSGQ)
             GOTO       CMDLBL(LOOP)
END:
ENDPGM
