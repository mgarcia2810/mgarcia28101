/***************************************************************/
/*  Aldon Computer Group makes no warranty, express or         */
/*  implied, with regard to this material, including fitness   */
/*  for use.  Additionally, Aldon is not responsible for       */
/*  maintaining compatibility of this information with future  */
/*  releases.  Aldon provides this as an example only.         */
/*  Customers using this information do so at their own risk.  */
/***************************************************************/
/*                                                             */
/*  This is the program to process the custom create command.  */
/*  It is used to compile programs that require a work file in */
/*  QTEMP for compilation.  This program assumes that the      */
/*  source for the work files is stored in QDDSSRC in the      */
/*  library list.                                              */
/***************************************************************/

             PGM        PARM(&OBJNAM &OBJLIB &SRCFIL &SRCLIB &SRCMBR)

             DCL        VAR(&OBJNAM) TYPE(*CHAR) LEN(10)
             DCL        VAR(&OBJLIB) TYPE(*CHAR) LEN(10)
             DCL        VAR(&SRCFIL) TYPE(*CHAR) LEN(10)
             DCL        VAR(&SRCLIB) TYPE(*CHAR) LEN(10)
             DCL        VAR(&SRCMBR) TYPE(*CHAR) LEN(10)

/*  Create required work file for Program A                    */

             IF         COND(&OBJNAM *EQ 'PGMA      ') THEN(DO)
             CRTPF      FILE(QTEMP/WRKFIL)
             GOTO       CMDLBL(COMPILE)
             ENDDO

/*  Create required work file for Program B                    */

             IF         COND(&OBJNAM *EQ 'PGMB      ') THEN(DO)
             CRTPF      FILE(QTEMP/WRKFI2)
             GOTO       CMDLBL(COMPILE)
             ENDDO

/*  Create the RPG program                                     */

COMPILE:     CRTRPGPGM  PGM(&OBJLIB/&OBJNAM) +
                          SRCFILE(&SRCLIB/&SRCFIL) SRCMBR(&SRCMBR)

             ENDPGM
