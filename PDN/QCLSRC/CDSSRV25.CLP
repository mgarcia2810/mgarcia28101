/************************************************/
/* CDS AMERICAS                   02 MARZO 2020 */
/*                                              */
/* DESCRIPCION: PROCEDIMIENTO PURGE ARCHIVOS    */
/*              POWERTECH COMPLIANCE MONITOR    */
/*                                              */
/************************************************/

             PGM

    /***************************************/
    /* ADICIONA LIBRERIAS DEL PRODUCTO     */
    /***************************************/

             ADDLIBLE   LIB(PTCMT3)
             MONMSG     MSGID(CPF0000 CPF2103)
             ADDLIBLE   LIB(PTCMT2)
             MONMSG     MSGID(CPF0000 CPF2103)

    /*****************************************/
    /* FINALIZA SERVICIOS COMPLIANCE MONITOR */
    /*****************************************/

             ENDPTCMCSL
             MONMSG     MSGID(CPF0000)
             DLYJOB     DLY(10)

             ENDPTCMEPT CLRREQUEST(Y)
             MONMSG     MSGID(CPF0000)
             DLYJOB     DLY(10)

    /*****************************************/
    /* CM2PURGE LIMPIEZA DE ARCHIVOS SEGUN   */
    /*          AGEING POLICIES              */
    /*****************************************/

             PTCMT2/CM2PURGE

    /*****************************************/
    /* RE INICIO DE LOS SERVICIOS COMPLIANCE */
    /* MONITOR                               */
    /*****************************************/

             STRPTCMCSL
             MONMSG     MSGID(CPF0000)
             DLYJOB     DLY(10)

             STRPTCMEPT CLRREQUEST(Y) CLRSTATUS(Y) CLRDB(Y)
             MONMSG     MSGID(CPF0000)
             DLYJOB     DLY(10)

             SNDPGMMSG  MSG('CM2PURGE Compliance Monitor Finalizado')
ENDPGM
