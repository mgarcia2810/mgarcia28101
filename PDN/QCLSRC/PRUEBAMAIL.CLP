PGM
             DCL        VAR(&ASP) TYPE(*CHAR) LEN(3) VALUE(' 97')
             SNDDST     TYPE(*LMSG) +
                          TOINTNET((SERGIO.COSTENARO@CDSAMERICAS.COM)+
                          ) DSTD('Monitor - IBM i') LONGMSG('Revise +
                          los valores de ASP del SISTEMA. Valor +
                          actual =' *BCAT &ASP) DOCD(*DSTD)


ENDPGM
