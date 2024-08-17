     H*
     H* Programa RPG SQL SCRIPTA
     H*
     H* Actualiza sueldo archivo EMPLOYEE
     H*
     H* Adiciona registro archivo SALES
     H*
     H*
      /Free
       EXEC SQL
               UPDATE SAMPLE.EMPLOYEE SET SALARY = salary+100 ;

       EXEC SQL
               INSERT INTO SAMPLE.SALES (SALES_PERSON, REGION, SALES)
               VALUES('OSWALDO CARPIO', 'BUENOS AIRES', '15') ;

        *Inlr = *On;

       /End-Free
