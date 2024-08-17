PGM
             DCL        VAR(&RPY) TYPE(*CHAR) LEN(4)

             SNDUSRMSG  MSG('Continuamos?') TOMSGQ(SERGIO) +
                                        MSGRPY(&RPY)
             SNDUSRMSG  MSG('Esta seguro???') TOMSGQ(SERGIO) +
                          MSGRPY(&RPY)
ENDPGM
