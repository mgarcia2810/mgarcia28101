/***********************************************/
/* CDS AMERICAS                                */
/*                                             */
/* DESCRIPCION: CREAR MSGQ FALTANTES POR       */
/*              MIGRACION IBMI74 A TAU SKYTAP  */
/*                                             */
/* ELABORADO:   MIGUEL GARCIA                  */
/***********************************************/
             PGM
             DCL        VAR(&UPUPRF2) TYPE(*CHAR) LEN(8)
             DCL        VAR(&SYSNAME2) TYPE(*CHAR) LEN(8)
             DCLF       FILE(QTEMP/USRMSGQ)
         /*                                               */
         /* ACTUALIZA ARCHIVO LECTURA PERFIL USUARIOS     */
         /*                                               */
             DSPUSRPRF  USRPRF(*ALL) OUTPUT(*OUTFILE) +
                          OUTFILE(QTEMP/USRMSGQ) OUTMBR(*FIRST +
                          *REPLACE)
             MONMSG     MSGID(CPF0000)

         /*                                         */
         /* LEE HASTA LLEGAR A FIN DE ARCHIVO       */
         /*                                         */
 LEE:        RCVF
             MONMSG     MSGID(CPF0864) EXEC(GOTO CMDLBL(SALIR))
         /*                                         */
         /* CREAR MSGQ Y CAMBIA PROPIETARIO         */
         /*                                         */
             CRTMSGQ    MSGQ(QUSRSYS/&UPUPRF) TEXT('USER MESSAGE +
                          QUEUE')
             MONMSG     MSGID(CPF0000)

             CHGOBJOWN OBJ(QUSRSYS/&UPUPRF) OBJTYPE(*MSGQ) NEWOWN(&UPUPRF)
             MONMSG     MSGID(CPF0000)

             GOTO       CMDLBL(LEE)

 SALIR:      ENDPGM
