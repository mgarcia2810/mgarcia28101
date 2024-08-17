/****************************************************/
/*  CDS AMERICAS                   03 FEBRERO 2022  */
/*                                                  */
/*  DESARROLLADO POR MIGUEL GARCIA                  */
/*                                                  */
/*  DESCRIPCION  REPORTES DE AUDITORIA DEL QAUDJRN  */
/*                                                  */
/*               DSPAUDJRNE DIARIO                  */
/*                                                  */
/*                                                  */
/****************************************************/
             PGM
             DCL        VAR(&FECHA) TYPE(*CHAR) LEN(6) VALUE(*BLANK)

   /***************************************/
   /* RECUPERA FECHA DEL QDATE WRKSYSVAL  */
   /***************************************/
             RTVSYSVAL  SYSVAL(QDATE) RTNVAR(&FECHA)

   /***************************************/
   /* GENERA REPORTE AUDITORIA QAUDJRN    */
   /***************************************/

             DSPAUDJRNE ENTTYP(DO CP PW SV) FROMTIME(&FECHA)

             MONMSG     MSGID(CPF0000)

             ENDPGM
