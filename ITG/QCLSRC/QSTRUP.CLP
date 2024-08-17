/********************************************************************/
/*   QSTRUP MODIFICADO PARA LEVANTAR SEVICIOS                       */
/* ALDON                                                            */
/********************************************************************/
     PGM
     DCL VAR(&STRWTRS) TYPE(*CHAR) LEN(1)
     DCL VAR(&CTLSBSD) TYPE(*CHAR) LEN(20)
     DCL VAR(&CPYR) TYPE(*CHAR) LEN(90) VALUE('5770-SS1 (C) COPYRIGHT-
 IBM CORP 1980, 2015. LICENSED MATERIAL - PROGRAM PROPERTY OF IBM')
     QSYS/STRSBS SBSD(QSERVER)
     MONMSG MSGID(CPF0000)
     QSYS/STRSBS SBSD(QUSRWRK)
     MONMSG MSGID(CPF0000)
     QSYS/RLSJOBQ JOBQ(QGPL/QS36MRT)
     MONMSG MSGID(CPF0000)
     QSYS/RLSJOBQ JOBQ(QGPL/QS36EVOKE)
     MONMSG MSGID(CPF0000)
     QSYS/STRCLNUP
     MONMSG MSGID(CPF0000)
     QSYS/RTVSYSVAL SYSVAL(QCTLSBSD) RTNVAR(&CTLSBSD)
     IF COND((&CTLSBSD *NE 'QCTL      QSYS      ') *AND (&CTLSBSD *NE-
 'QCTL      QGPL      ')) THEN(GOTO CMDLBL(DONE))
     QSYS/STRSBS SBSD(QINTER)
     MONMSG MSGID(CPF0000)
     QSYS/STRSBS SBSD(QBATCH)
     MONMSG MSGID(CPF0000)
     QSYS/STRSBS SBSD(QCMN)
     MONMSG MSGID(CPF0000)
     QSYS/STRSBS SBSD(QSNADS)
     MONMSG MSGID(CPF0000)

     DLYJOB     DLY(60)

/********************************************************************/
/*   LEVANTAR IASP'S                                               */
/********************************************************************/

/* NO HAY IASP DISPONIBLES */

/********************************************************************/
/*   SUBSISTEMAS DE MIMIX                                           */
/********************************************************************/
     STRSBS SBSD(MIMIXQGPL/MIMIXSBS)
     MONMSG     MSGID(CPF0000)
   /*VSI001LIB/STRVSISVR   */
     MONMSG     MSGID(CPF0000)

/********************************************************************/
/*   SUBSISTEMAS DE ALDON LME LMI                                   */
/********************************************************************/
     ADDLIBLE LIB(AFFTLIB)
     MONMSG MSGID(CPF0000)
     STRSBS SBSD(ACMSCTL/ALDONDMI)
     MONMSG MSGID(CPF0000)
     DLYJOB DLY(30)
     STRSBS SBSD(ACMSCTL/ALDONLMI)
     MONMSG MSGID(CPF0000)
     DLYJOB DLY(30)
     ALSCLIB/STRALSC
     MONMSG MSGID(CPF0000)
     DLYJOB DLY(120)
     AFFTLIB/AFFSTRLM
     MONMSG MSGID(CPF0000)
     DLYJOB DLY(30)
     STRSBS SBSD(AFFTCTL/ALDONDM)
     MONMSG MSGID(CPF0000)

/********************************************************************/
/*   SUBSISTEMAS DE OPSPORTAL - SERA REEMPLAZADO POR DEVOPS PORTAL  */
/********************************************************************/
/*   STRSBS SBSD(LMWPCTL/OPSPORTAL)    */
/*   MONMSG MSGID(CPF0000)             */
/*   DLYJOB DLY(30)                    */

/********************************************************************/
/*   ROCKET ALDON DEVOPS PORTAL                                     */
/********************************************************************/
     STRSBS RDOCTL/RDOPSBSD
     MONMSG MSGID(CPF0000)

     STRSBS RDOCTL/RDOISBSD
     MONMSG MSGID(CPF0000)

     STRSBS RDOCTL/RDOESBSD
     MONMSG MSGID(CPF0000)

     STRTCPSVR SERVER(*SSHD)
     MONMSG MSGID(CPF0000)

 /***************************************************************/
 /*   SUBSISTEMAS DE ALDON RDO TESTING                          */
 /***************************************************************/
     STRSBS RDOCTL/RDOP
     MONMSG MSGID(CPF0000)
     DLYJOB DLY(3)

     STRSBS RDOCTL/RDOIAPI
     MONMSG MSGID(CPF0000)
     DLYJOB DLY(3)

     STRSBS RDOCTL/RDOEAPI
     MONMSG MSGID(CPF0000)
     DLYJOB DLY(3)

     STRSBS RDOCTL/RDOTAPI
     MONMSG MSGID(CPF0000)
     DLYJOB DLY(3)

     STRSBS RDOCTL/RDOTMGR
     MONMSG MSGID(CPF0000)
     DLYJOB DLY(3)

     STRSBS RDOCTL/RDOTAGT
     MONMSG MSGID(CPF0000)
     DLYJOB DLY(3)

     STRSBS RDOCTL/RDOTMQ
     MONMSG MSGID(CPF0000)
     DLYJOB DLY(3)

     STRSBS RDOCTL/RTEWEB
     MONMSG MSGID(CPF0000)
     DLYJOB DLY(3)

/********************************************************************/
/*   SUBSISTEMAS DE POWERTECH                                       */
/********************************************************************/
     STRSBS SBSD(PTWRKMGT/PTWRKMGT)
     MONMSG MSGID(CPF0000)
     DLYJOB DLY(30)
     PTCMT2/STRPCM2MON
     MONMSG MSGID(CPF0000)
     DLYJOB DLY(30)
     PTCMT2/STRPTCMCSL
     MONMSG MSGID(CPF0000)
     DLYJOB DLY(30)
     PTCMT3/STRPTCMEPT CLRREQUEST(Y) CLRSTATUS(Y) CLRDB(Y)
     MONMSG MSGID(CPF0000)
     DLYJOB DLY(30)
     PTNSLIB07/LSTRCAPSUM
     MONMSG MSGID(CPF0000)

     STRSBS     SBSD(ESEND/EFWD)
     MONMSG MSGID(CPF0000)

/********************************************************************/
/*   SUBSISTEMAS DE POWERTECH DATATHREAD DATABASE MONITOR           */
/********************************************************************/
             STRSBS     SBSD(*LIBL/DATATHREAD)

/********************************************************************/
/*   SUBSISTEMAS DE ROBOT MONITOR Y SCHEDULER                       */
/********************************************************************/
     ADDLIBLE LIB(MSM)
     MONMSG MSGID(CPF0000)
     MSM/MONSTRTCP JOBQ(QSYSNOMAX) STRSBS(*YES)
     MONMSG MSGID(CPF0000)
     ADDLIBLE LIB(ROBOTLIB)
     MONMSG MSGID(CPF0000)
     CALL PGM(ROBOTLIB/RBT103)
     MONMSG MSGID(CPF0000)

/********************************************************************/
/*   SUBSISTEMAS DE MONITOREO                                       */
/********************************************************************/
     STRSBS     SBSD(CDSLIB/QZCDS)
     MONMSG     MSGID(CPF0000)

/********************************************************************/
/*   SUBSISTEMAS DE ESEND  HELP SYSTEMS                             */
/********************************************************************/
             STRSBS     SBSD(ESEND/EFWD)
             MONMSG     MSGID(CPF0000)

/********************************************************************/
/*   HTTP SERVER Y OTROS SERVICIOS TCP IP                           */
/********************************************************************/
             STRTCPSVR  SERVER(*HTTP) HTTPSVR(*ADMIN)
             MONMSG     MSGID(CPF0000)

             STRTCPSVR  SERVER(*IAS) HTTPSVR(ADMIN1)
             MONMSG     MSGID(CPF0000)

             STRTCPSVR  SERVER(*SMTP)
             MONMSG     MSGID(CPF0000)

             STRTCPSVR  SERVER(*POP)
             MONMSG     MSGID(CPF0000)

             STRTCPSVR  SERVER(*FTP)
             MONMSG     MSGID(CPF0000)

             STRTCPSVR  SERVER(*POP)
             MONMSG     MSGID(CPF0000)

             STRTCPSVR  SERVER(*INETD)
             MONMSG     MSGID(CPF0000)

             STRTCPSVR  SERVER(*DDM)
             MONMSG     MSGID(CPF0000)

             STRMSF
             MONMSG     MSGID(CPF0000)
/********************************************************************/
/*   SUBSISTEMAS ICC CLOUD BRMS WEB                                 */
/********************************************************************/
             STRTCPSVR SERVER(*HTTP) HTTPSVR(QICCQXML)
             MONMSG     MSGID(CPF0000)

             STRSBS SBSD(QICC/QICCSBS)
             MONMSG     MSGID(CPF0000)

             STRSBS SBSD(QICC/QICCGUISBS)
             MONMSG     MSGID(CPF0000)

/********************************************************************/
/*   SUBSISTEMAS COMPLIANCE MONITOR POWERTECH                       */
/********************************************************************/

     /* INICIAR COMPLIANCE MONITOR CONSOLIDATOR                     */
     PTCMT2/STRPTCMCSL
     MONMSG MSGID(CPF0000)
     DLYJOB DLY(30)

     /* INICIAR COMPLIANCE MONITOR ENDPOINT                         */
     PTCMT3/STRPTCMEPT CLRREQUEST(Y) CLRSTATUS(Y) CLRDB(Y)
     MONMSG MSGID(CPF0000)
     DLYJOB DLY(30)

/********************************************************************/
/*   SUBSISTEMAS EXIT POINT CAPUTRE Y COLLECTOR INSITE DASHBOARD    */
/********************************************************************/
     /* INICIAR EXIT POINT MANAGER CAPTURE                          */
     PTNSLIB07/LSTRCAPSUM
     MONMSG MSGID(CPF0000)
     DLYJOB DLY(30)

     /* INICIAR INSITE COUNT DASHBOARD                              */
     PTNSLIB07/PNSSTRDASH

/********************************************************************/
/*   SUBSISTEMAS MFA MULTIFACTOR AUTHENTICATION                     */
/********************************************************************/

             PTMALIB/PMASTRMON
             MONMSG     MSGID(CPF0000)

/********************************************************************/
/*   SUBSISTEMAS ICC INTERFACE GRAFICA PUERTO 8085                  */
/********************************************************************/
     STRTCPSVR SERVER(*HTTP) HTTPSVR(QICCQXML)
     MONMSG MSGID(CPF0000)

     STRSBS SBSD(QICC/QICCSBS)
     MONMSG MSGID(CPF0000)

     STRSBS SBSD(QICC/QICCGUISBS)
     MONMSG MSGID(CPF0000)

DONE:
     QSYS/STRSBS SBSD(QSPL)
     MONMSG MSGID(CPF0000)
     QSYS/RTVSYSVAL SYSVAL(QSTRPRTWTR) RTNVAR(&STRWTRS)
     IF COND(&STRWTRS = '0') THEN(GOTO CMDLBL(NOWTRS))
     CALL PGM(QSYS/QWCSWTRS)
     MONMSG MSGID(CPF0000)
NOWTRS:
     RETURN
     CHGVAR VAR(&CPYR) VALUE(&CPYR)
     ENDPGM
