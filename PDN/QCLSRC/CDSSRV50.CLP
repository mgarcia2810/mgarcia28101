/****************************************************/
/*  CDS AMERICAS                     05 MARZO 2020  */
/*                                                  */
/*  DESARROLLADO POR MIGUEL GARCIA                  */
/*                                                  */
/*  DESCRIPCION  GENERA RELACION EN DISCO DE LOS    */
/*               ARCHIVOS FISICOS PF-DTA PARA SU    */
/*               LIMPIEZA EN LA CARGA DE RELEASE    */
/*               ALDON.                             */
/*                                                  */
/*               SE RESTAURAN TODA LA LIBRERIA      */
/*               EN LA DEL INVVENTARIO ALDON SIN    */
/*               EXCEPCION PARA EJECUTAR ESTE PROCES*/
/*               PARA CADA LIBRERIA.                */
/*                                                  */
/****************************************************/
             PGM
             DCLF       FILE(QTEMP/CDSPF1)
             DCL        VAR(&LIBR) TYPE(*CHAR) LEN(10) VALUE(*BLANK)

   /***************************************/
   /* SOLICITA NOMBRE DE LIBRERIA         */
   /***************************************/
             SNDUSRMSG  MSG('INGRESE NOMBRE BIBLIOTECA') MSGRPY(&LIBR)

   /***************************************/
   /* GENERA ARCHIVO DE TRABAJO CON LA    */
   /* LIBRERIA INGRESADA                  */
   /***************************************/
             DSPFD      FILE(&LIBR/*ALL) TYPE(*BASATR) +
                          OUTPUT(*OUTFILE) OUTFILE(QTEMP/CDSPF1)

   /***************************************/
   /* CICLO CLRPFM PARA CADA ARCHIVO      */
   /* LIBRERIA SOLICITADA                 */
   /***************************************/

 LEE:        RCVF
             MONMSG     MSGID(CPF0864) EXEC(GOTO CMDLBL(SALIR))

             CLRPFM     FILE(&ATLIB/&ATFILE)
             MONMSG     MSGID(CPF0000)

             GOTO       CMDLBL(LEE)
 SALIR:      ENDPGM
