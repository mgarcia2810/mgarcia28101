             PGM        PARM(&DIAS)
             DCLF       FILE(QTEMP/JRN)
             DCL        VAR(&DIAS) TYPE(*CHAR) LEN(1)
             DCL        VAR(&SUMAD) TYPE(*DEC) LEN(1)
             DCL        VAR(&ANIOD) TYPE(*DEC) LEN(2)
             DCL        VAR(&ANIO) TYPE(*CHAR) LEN(2)
             DCL        VAR(&DIASDEC) TYPE(*DEC) LEN(1)
             DCL        VAR(&FECHA) TYPE(*CHAR) LEN(6)
             DCL        VAR(&FECHAJUL) TYPE(*CHAR) LEN(5)
             DCL        VAR(&FECHAJULJ) TYPE(*CHAR) LEN(5)
             DCL        VAR(&FECHADEC) TYPE(*DEC) LEN(5)
             DCL        VAR(&FECHADECJ) TYPE(*DEC) LEN(5)
             CHGVAR     VAR(&DIASDEC) VALUE(&DIAS)
             RTVSYSVAL  SYSVAL(QDATE) RTNVAR(&FECHA)
             CVTDAT     DATE(&FECHA) TOVAR(&FECHAJUL) FROMFMT(*MDY) +
                          TOFMT(*JUL) TOSEP(*NONE)
             IF         COND(%SST(&FECHAJUL 3 3) *LE '009') THEN(DO)
             CHGVAR     VAR(&SUMAD) VALUE(%SST(&FECHAJUL 5 1))
             CHGVAR     VAR(&ANIOD) VALUE(%SST(&FECHAJUL 1 2))
             CHGVAR     VAR(&ANIOD) VALUE(&ANIOD -1)
             CHGVAR     VAR(&ANIO) VALUE(&ANIOD)
             CHGVAR     VAR(&FECHAJUL) VALUE(&ANIO || '366')
             CHGVAR     VAR(&FECHADEC) VALUE(&FECHAJUL)
             CHGVAR     VAR(&FECHADEC) VALUE(&FECHADEC + &SUMAD - +
                          &DIASDEC)
             CHGVAR     VAR(&FECHAJUL) VALUE(&FECHADEC)
             IF         COND(%SST(&FECHAJUL 3 3) *GT '366') THEN(DO)
             CHGVAR     VAR(&FECHADEC) VALUE(&FECHADEC + 1000 - 366)
             ENDDO
             GOTO       CMDLBL(SUMAD)
             ENDDO
             CHGVAR     VAR(&FECHADEC) VALUE(&FECHAJUL)
             CHGVAR     VAR(&FECHADEC) VALUE(&FECHADEC - &DIASDEC)
 SUMAD:      DSPOBJD    OBJ(PTNSLIB07/*ALL) OBJTYPE(*JRNRCV) +
                          OUTPUT(*OUTFILE) OUTFILE(QTEMP/JRN)
             CRTSAVF    FILE(QTEMP/SAV)
LOOP:
RCVF
             MONMSG     MSGID(CPF0000) EXEC(GOTO CMDLBL(END))
             CVTDAT     DATE(&ODCDAT) TOVAR(&FECHAJULJ) +
                          FROMFMT(*MDY) TOFMT(*JUL) TOSEP(*NONE)
             CHGVAR     VAR(&FECHADECJ) VALUE(&FECHAJULJ)
             IF         COND(&FECHADEC *GT &FECHADECJ) THEN(DO)
             CLRSAVF    FILE(QTEMP/SAV)
             SAVOBJ     OBJ(&ODOBNM) LIB(&ODLBNM) DEV(*SAVF) +
                          OBJTYPE(*JRNRCV) SAVF(QTEMP/SAV)
             ENDDO
             GOTO       CMDLBL(LOOP)
END:
ENDPGM
