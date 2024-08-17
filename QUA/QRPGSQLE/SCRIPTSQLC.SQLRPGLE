     H
      /Free
       EXEC SQL
               INSERT INTO CDSLIB1/CDSORD (ORORD, ORCUST) VALUES('111111',
               '2222222222');

       EXEC SQL
               INSERT INTO CDSLIB1/CDSORD (ORORD, ORCUST) VALUES('222222',
               '3333333333');

       EXEC SQL
               UPDATE CDSLIB1/CDSORD SET ORORD = '777777' WHERE ORORD =
               '111111';
       EXEC SQL
               ALTER TABLE CDSLIB1/CDSORD ALTER COLUMN ORNAME DROP NOT NULL;

       *Inlr = *On;

      /End-Free
