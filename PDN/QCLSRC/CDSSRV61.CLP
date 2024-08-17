/*******************************************************************/
/*  CDS AMERICAS                               16 NOVIEMBRE 2020   */
/*                                                                 */
/*  DESARROLLADO POR MIGUEL GARCIA                                 */
/*                                                                 */
/*  DESCRIPCION  PROGRAMA INVOCADO POR CDSSRV60                    */
/*                                                                 */
/*               ASIGNA SEGURIDAD STANDARD ALDON SOBRE OBJETOS DE  */
/*               LA LIBRERIA INVENTARIO ALDON                      */
/*                                                                 */
/*               STANDARD = OWNER ALDONCMS  AUTL *NONE             */
/*                          PUBLIC *USE                            */
/*                                                                 */
/*******************************************************************/
             PGM        PARM(&LIBRERIA)

             DCL        VAR(&LIBRERIA) TYPE(*CHAR) LEN(10)
             DCLF       FILE(CDS/CDSPF61)

   /********************************************************/
   /* FASE 4                                               */
   /* GENERA DSPOBJD PARA OBTENER DETALLES DE LOS OBJETOS  */
   /* DE LA LIBRERIA                                       */
   /********************************************************/
             DLTF       FILE(CDS/CDSPF61)
             MONMSG     MSGID(CPF2105) /* Monitor sino existe */

             DSPOBJD    OBJ(&LIBRERIA/*ALL) OBJTYPE(*ALL) +
                          OUTPUT(*OUTFILE) OUTFILE(CDS/CDSPF61)
             MONMSG     MSGID(CPF2123)

   /********************************************************/
   /* FASE 2                                               */
   /* BUCLE PARA EJECUTAR COMANDOS SOBRE OBJETOS LIBRERIA  */
   /* COMANDOS PARA = REVOCAR AUTORIZACIONES OBJETOS       */
   /*                 ASIGNAR PROPIETARIO                  */
   /*                 ASIGNAR AUTL *NONE                   */
   /*                                                      */
   /********************************************************/

 LEE:        RCVF
             MONMSG     MSGID(CPF0864 CPF4101) EXEC(GOTO +
                          CMDLBL(SALIR)) /* Monitor fin de archivo */

             RVKOBJAUT  OBJ(&ODLBNM/&ODOBNM) OBJTYPE(&ODOBTP) +
                          USER(*ALL) AUT(*ALL)
             MONMSG     MSGID(CPF0000)

             CHGOBJOWN  OBJ(&ODLBNM/&ODOBNM) OBJTYPE(&ODOBTP) +
                          NEWOWN(ALDONCMS)
             MONMSG     MSGID(CPF0000)

             GRTOBJAUT  OBJ(&ODLBNM/&ODOBNM) OBJTYPE(&ODOBTP) +
                          AUTL(*NONE)
             MONMSG     MSGID(CPF0000)

             GRTOBJAUT  OBJ(&ODLBNM/&ODOBNM) OBJTYPE(&ODOBTP) +
                          USER(*PUBLIC) AUT(*USE) REPLACE(*YES)
             MONMSG     MSGID(CPF0000)

             GOTO       CMDLBL(LEE)

 SALIR:      DLTF       FILE(CDS/CDSPF61)
             MONMSG     MSGID(CPF2105) /* Monitor sino existe */
             ENDPGM

