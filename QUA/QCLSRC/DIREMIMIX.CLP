             PGM        PARM(&RSYS)
             DCL        VAR(&RSYS) TYPE(*CHAR) LEN(8)

             DSPDIRE    OUTPUT(*OUTFILE) OUTFILE(QTEMP/WRKDIRE) +
                          DETAIL(*FULL)
             MIMIX/SYNCOBJ OBJ((QTEMP/WRKDIRE *ALL *ALL *ALL +
                          *INCLUDE QGPL/DIRE)) SYS2(&RSYS) +
                          BATCH(*NO)
             MIMIX/RUNCMD CMD(CALL PGM(QGPL/REPDIR)) +
                          PROTOCOL(*SYSDFN) SYSDFN(&RSYS) +
                          USER(MIMIXOWN)
ENDPGM
