/************************************************/
/* CDS AMERICAS                   02 MARZO 2020 */
/*                                              */
/* DESCRIPCION: PROCEDIMIENTO CLRPFM ARCHIVOS   */
/*              POWERTECH NETWOR SECURITY EXIT P*/
/*                                              */
/************************************************/
             PGM

    /***************************************/
    /* ADICIONA LIBRERIAS DEL PRODUCTO     */
    /***************************************/
             ADDLIBLE   LIB(PTNSLIB07)
             MONMSG     MSGID(CPF0000 CPF2103)

    /*****************************************/
    /* FINALIZA SERVICIOS NETWORK SECURITY   */
    /*****************************************/
             LENDCAPSUM
             DLYJOB     DLY(15)

    /*****************************************/
    /* CM2PURGE LIMPIEZA DE ARCHIVOS         */
    /*****************************************/
             CLRPFM     FILE(PLKCAP)
             CLRPFM     FILE(PLKCAPCNT)
             CLRPFM     FILE(LNSCAP)

    /*****************************************/
    /* RE INICIO DE LOS SERVICIOS            */
    /*****************************************/

             LSTRCAPSUM

             SNDPGMMSG  MSG('Network Security Files Clear')
             ENDPGM
