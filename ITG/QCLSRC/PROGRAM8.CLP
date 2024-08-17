             PGM        PARM(&PARM1)

             DCL        VAR(&PARM1) TYPE(*CHAR) LEN(5)
             DCL        VAR(&PARM2) TYPE(*DEC) LEN(5 0)

             RTVCFGSTS  CFGD(DSP28) CFGTYPE(*DEV) STSCDE(&PARM2) /* +
                          Status Pantalla 20 Vary On */

             CHGVAR     VAR(&PARM1) VALUE(&PARM2)

             ENDPGM
