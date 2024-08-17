/*******************************************************************/
/*  CDS AMERICAS                               16 NOVIEMBRE 2020   */
/*                                                                 */
/*  DESARROLLADO POR MIGUEL GARCIA                                 */
/*                                                                 */
/*  DESCRIPCION  ASIGNA SEGURIDAD STANDARD ALDON SOBRE LIBRERIAS   */
/*               INVENTARIO DESARROLLADOR                          */
/*                                                                 */
/*               UTILIZA *FILE LIBNAMESRT ACMSCTL SELECCIONAR LAS  */
/*               LIBRERIAS Y OBJECTOS ENV                          */
/*                                                                 */
/*               STANDARD = CHGLIB CRTAUT *ALL                     */
/*                                                                 */
/*******************************************************************/
              PGM
              DCLF       FILE(CDS/CDSPF62)

    /********************************************************/
    /* FASE 1                                               */
    /* CPYF PF LIBNAMESRT ACMSCTL A CDSPF62 SOLO DVP        */
    /********************************************************/
              DLTF       FILE(CDS/CDSPF62)
              MONMSG     MSGID(CPF2105) /* MONITOR SINO EXISTE */

              CPYF       FROMFILE(ACMSCTL/LIBNAMESRT) +
                           TOFILE(CDS/CDSPF62) CRTFILE(*YES) +
                           INCREL((*IF ENV *EQ 'DVP'))

    /********************************************************/
    /* FASE 2                                               */
    /* BUCLE PARA EJECUTAR COMANDOS SOBRE LIBRERIAS         */
    /* COMANDOS PARA = CHGLIB CRTAUT *ALL                   */
   /*                  PUBLIC *ALL                         */
   /********************************************************/

 LEE:        RCVF
             MONMSG     MSGID(CPF0864) EXEC(GOTO CMDLBL(SALIR)) /* +
                          Monitor fin de archivo */

             CHGLIB     LIB(&LIBRARY) CRTAUT(*ALL)
             MONMSG     MSGID(CPF0000)

             GRTOBJAUT  OBJ(QSYS/&LIBRARY) OBJTYPE(*LIB) +
                          USER(*PUBLIC) AUT(*ALL) REPLACE(*YES)
             MONMSG     MSGID(CPF0000)

             GRTOBJAUT  OBJ(&LIBRARY/*ALL) OBJTYPE(*ALL) +
                          USER(*PUBLIC) AUT(*ALL) REPLACE(*YES)
             MONMSG     MSGID(CPF0000)

             GOTO       CMDLBL(LEE)
 SALIR:      ENDPGM
