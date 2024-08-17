/*******************************************************************/
/*  CDS AMERICAS                               16 NOVIEMBRE 2020   */
/*                                                                 */
/*  DESARROLLADO POR MIGUEL GARCIA                                 */
/*                                                                 */
/*  DESCRIPCION  ASIGNA SEGURIDAD STANDARD ALDON SOBRE LIBRERIAS   */
/*               INVENTARIO ALDON                                  */
/*                                                                 */
/*               UTILIZA *FILE LIBNAMESRT ACMSCTL SELECCIONAR LAS  */
/*               LIBRERIAS Y OBJECTOS EXCLUYENDO DVP DESARROLLADOR */
/*               CAMPO ENV                                         */
/*                                                                 */
/*               STANDARD = OWNER ALDONCMS  AUTL *NONE             */
/*                          PUBLIC *USE                            */
/*                                                                 */
/*               PROGRAMA CALL CDSSR61 PARA APLICAR SEGURIDAD A    */
/*               LOS OBJETOS DE CADA LIBRERIA                      */
/*                                                                 */
/*******************************************************************/
             PGM
             DCL        VAR(&LIBRERIA) TYPE(*CHAR) LEN(10)
             DCLF       FILE(CDS/CDSPF60)

   /********************************************************/
   /* FASE 1                                               */
   /* CPYF PF LIBNAMESRT ACMSCTL A CDSPF60 EXCLUYENDO DVP  */
   /********************************************************/
             DLTF       FILE(CDS/CDSPF60)
             MONMSG     MSGID(CPF2105) /* Monitor sino existe */

             CPYF       FROMFILE(ACMSCTL/LIBNAMESRT) +
                          TOFILE(CDS/CDSPF60) CRTFILE(*YES) +
                          INCREL((*IF ENV *NE 'DVP'))

   /********************************************************/
   /* FASE 2                                               */
   /* BUCLE PARA EJECUTAR COMANDOS SOBRE LIBRERIAS         */
   /* COMANDOS PARA = REVOCAR AUTORIZACIONES LIBRERIA      */
   /*                 ASIGNAR PROPIETARIO                  */
   /*                 ASIGNAR AUTL *NONE                   */
   /*                                                      */
   /********************************************************/

 LEE:        RCVF
             MONMSG     MSGID(CPF0864) EXEC(GOTO CMDLBL(SALIR)) /* +
                          Monitor fin de archivo */

             RVKOBJAUT  OBJ(QSYS/&LIBRARY) OBJTYPE(*LIB) USER(*ALL) +
                          AUT(*ALL)
             MONMSG     MSGID(CPF0000)

             CHGOBJOWN  OBJ(QSYS/&LIBRARY) OBJTYPE(*LIB) +
                          NEWOWN(ALDONCMS)
             MONMSG     MSGID(CPF0000)

             GRTOBJAUT  OBJ(QSYS/&LIBRARY) OBJTYPE(*LIB) AUTL(*NONE)
             MONMSG     MSGID(CPF0000)

             GRTOBJAUT  OBJ(QSYS/&LIBRARY) OBJTYPE(*LIB) +
                          USER(*PUBLIC) AUT(*USE) REPLACE(*YES)
             MONMSG     MSGID(CPF0000)

   /********************************************************/
   /* FASE 3                                               */
   /* CALL CDSSRV61 PASANDO NOMBRE LIBRERIA PARA ASIGNAR   */
   /* STANDARD SEGURIDAD OBJETOS DE LA LIBRERIA.           */
   /*                                                      */
   /* BUCLE PARA EJECUTAR COMANDOS SOBRE LIBRERIAS         */
   /* COMANDOS PARA = REVOCAR AUTORIZACIONES LIBRERIA      */
   /*                 ASIGNAR PROPIETARIO                  */
   /*                 ASIGNAR AUTL *NONE                   */
   /*                                                      */
   /********************************************************/

             CHGVAR     VAR(&LIBRERIA) VALUE(&LIBRARY)
             CALL       PGM(CDSLIB1/CDSSRV61) PARM(&LIBRERIA)

             GOTO       CMDLBL(LEE)
 SALIR:      ENDPGM

