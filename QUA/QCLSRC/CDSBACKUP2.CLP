/****************************************************/
/*  CDS AMERICAS                     05 JULIO 2020  */
/*                                                  */
/*  DESARROLLADO POR MIGUEL GARCIA                  */
/*                                                  */
/*  DESCRIPCION  EJECUCION BACKUP COPIANDO EN DIR   */
/*               COMPARTIDO CON NOMENCLATURA DE     */
/*               NOMBRE CON FECHA Y HORA            */
/*                                                  */
/****************************************************/
             PGM

             DCL        VAR(&DATE1) TYPE(*CHAR) LEN(20)
             DCL        VAR(&DESTI) TYPE(*CHAR) LEN(40)

             RTVSYSVAL  SYSVAL(QDATETIME) RTNVAR(&DATE1)

             CHGVAR     VAR(&DESTI) VALUE('/BACKUP/' *CAT +
                          &DATE1 *CAT '.BIN')

             MKDIR      DIR('/BACKUP') DTAAUT(*RWX) OBJAUT(*ALL)
             MONMSG MSGID(CPF0000)

             SAVLIB     LIB(CDSLIB1 MGARCIA28) DEV(TAPVRT01) +
                          ENDOPT(*LEAVE) USEOPTBLK(*NO) DTACPR(*YES)
             MONMSG MSGID(CPF0000)

             CPY        OBJ('/RESPALDO/TAPBACKUP.BIN') +
                          TOOBJ(&DESTI) TOCCSID(*CALC) REPLACE(*YES)
             MONMSG     MSGID(CPF0000)

             ENDPGM
