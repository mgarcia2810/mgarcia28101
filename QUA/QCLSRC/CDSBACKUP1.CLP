/****************************************************/
/*  CDS AMERICAS                     05 JULIO 2020  */
/*                                                  */
/*  DESARROLLADO POR MIGUEL GARCIA                  */
/*                                                  */
/*  DESCRIPCION  INICIALIZA UNIVDAD VIRTUAL TAP     */
/*               TAPVRT01                           */
/*                                                  */
/****************************************************/
             PGM

             LODIMGCLG  IMGCLG(TAPVRT01) OPTION(*LOAD) DEV(TAPVRT01)
             MONMSG     MSGID(CPF0000)

             INZTAP     DEV(TAPVRT01) NEWVOL(IBMIRD) CHECK(*NO)
             MONMSG     MSGID(CPF0000)

             ENDPGM
