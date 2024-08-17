PGM

             ENDSBS     SBS(RDOPSBSD) OPTION(*IMMED)
             MONMSG     MSGID(CPF0000)
             DLYJOB     DLY(5)

             ENDSBS     SBS(RDOISBSD) OPTION(*IMMED)
             MONMSG     MSGID(CPF0000)
             DLYJOB     DLY(5)

             ENDSBS     SBS(RDOESBSD) OPTION(*IMMED)
             MONMSG     MSGID(CPF0000)
             DLYJOB     DLY(5)

             SNDPGMMSG  MSG('DevOps Portal Finalizado Revisar +
                          ADDLIBLE RDOLIB + WRKRDO')

ENDPGM
