             PGM
             DCL        VAR(&MSGRPY) TYPE(*CHAR) LEN(1)
             SNDUSRMSG  MSG('Mensaje de continuidad o no') +
                          MSGTYPE(*INQ) MSGRPY(&MSGRPY)
             IF         COND(&MSGRPY *NE 'S' *OR &MSGRPY *NE 's') +
                          THEN(GOTO CMDLBL(FINAL))

                  /* COMANDOS DE EJECUCIðN DEL PROGRAMA  */
                  /* COMANDOS DE EJECUCIðN DEL PROGRAMA  */
                  /* COMANDOS DE EJECUCIðN DEL PROGRAMA  */
FINAL:
ENDPGM
