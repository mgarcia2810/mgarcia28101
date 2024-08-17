             PGM        PARM(&ENTRADA &SESION)
             DCLF       FILE(QTEMP/LIBLIST) OPNID(A1)
             DCLF       FILE(QTEMP/QFTPSRC) OPNID(A2)
             DCL        VAR(&ENTRADA) TYPE(*CHAR) LEN(10)
             DCL        VAR(&QFTPSRC) TYPE(*CHAR) LEN(8)
             DCL        VAR(&SESION) TYPE(*CHAR) LEN(1)
             DCL        VAR(&ENVIO) TYPE(*CHAR) LEN(8)
             DCL        VAR(&NUM) TYPE(*DEC) LEN(2)
             DCL        VAR(&NUMCHAR) TYPE(*CHAR) LEN(2)
             DCL        VAR(&MSGRPY) TYPE(*CHAR) LEN(1)
             DCL        VAR(&MSG) TYPE(*CHAR) LEN(150)
             CPYF       FROMFILE(SERGIOC/&ENTRADA) +
                          TOFILE(QTEMP/LIBLIST) MBROPT(*ADD) +
                          CRTFILE(*YES)
             CHGVAR     VAR(&QFTPSRC) VALUE('QFTPSRC' || &SESION)
             CPYF       FROMFILE(SERGIOC/&QFTPSRC) +
                          TOFILE(QTEMP/QFTPSRC) FROMMBR(*ALL) +
                          TOMBR(*FROMMBR) MBROPT(*ADD) CRTFILE(*YES)

             OVRDBF FILE(INPUT) TOFILE(QTEMP/QFTPSRC) MBR(FTPPARMS)
             OVRDBF FILE(OUTPUT) TOFILE(QTEMP/QFTPSRC) MBR(FTPLOG)
LOOP:
             RCVF       OPNID(A1)
             MONMSG     MSGID(CPF0864) EXEC(GOTO CMDLBL(END))
             CHGVAR     VAR(&NUM) VALUE(&NUM + 1)
             CHGVAR     VAR(&NUMCHAR) VALUE(&NUM)
             CHGVAR     VAR(&ENVIO) VALUE('ENVIO' || &SESION || +
                          &NUMCHAR)
             CRTSAVF    FILE(SERGIOC/&ENVIO)
             CLRPFM FILE(QTEMP/QFTPSRC) MBR(FTPLOG)
             SAVLIB     LIB(&A1_LIBLIST) DEV(*SAVF) +
                          SAVF(SERGIOC/&ENVIO) SAVACT(*SYNCLIB) +
                          ACCPTH(*YES) DTACPR(*HIGH) OUTPUT(*PRINT)
FTP:         STRTCPFTP  RMTSYS(IBMINUBE)
             /* CHEQUEO DE TRANSMISION */
LOOP2:
             RCVF       OPNID(A2)
             MONMSG     MSGID(CPF0864) EXEC(GOTO CMDLBL(FINMAL))
             IF         COND(%SST(&A2_SRCDTA 1 40) *EQ '226 File +
                          transfer completed successfully') THEN(DO)
             DLTOBJ     OBJ(SERGIOC/&ENVIO) OBJTYPE(*FILE)
             CLOSE      OPNID(A2)
             GOTO       CMDLBL(LOOP)
             ENDDO
             GOTO       CMDLBL(LOOP2)
FINMAL:
             CLOSE      OPNID(A2)
             CHGVAR     VAR(&MSG) VALUE('Fall¢ el FTP para la +
                          libreria: ' || &A1_LIBLIST *TCAT ' Si +
                          quiere reintentar presione S, si quiere +
                          terminar el programa N')
             SNDUSRMSG  MSG(&MSG) VALUES(S S N N) MSGTYPE(*INQ) +
                          TOMSGQ(*SYSOPR) MSGRPY(&MSG)
             IF         COND(&MSG *EQ 'S' *OR &MSGRPY *EQ 's') +
                          THEN(GOTO CMDLBL(FTP))
             CHGVAR     VAR(&MSG) VALUE('Fall¢ el FTP para la +
                          libreria: ' || &A1_LIBLIST *TCAT ' de la +
                          sesion ' || &SESION || ' de la lista ' || +
                          &ENTRADA || ' proceso canccelado')
             SNDUSRMSG  MSG(&MSG) MSGTYPE(*INQ) TOMSGQ(*SYSOPR)
             GOTO       CMDLBL(CANCEL)
END:
             CHGVAR     VAR(&MSG) VALUE('Finaliz¢ satisfactoriamente +
                          el FTP de la sesion ' || &SESION || ' de +
                          la lista ' || &ENTRADA)
             SNDUSRMSG  MSG(&MSG) MSGTYPE(*INQ) TOMSGQ(*SYSOPR)
CANCEL:
ENDPGM
