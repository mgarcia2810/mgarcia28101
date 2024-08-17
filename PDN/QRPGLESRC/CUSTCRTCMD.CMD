/***************************************************************/
/*  Aldon Computer Group makes no warranty, express or         */
/*  implied, with regard to this material, including fitness   */
/*  for use.  Additionally, Aldon is not responsible for       */
/*  maintaining compatibility of this information with future  */
/*  releases.  Aldon provides this as an example only.         */
/*  Customers using this information do so at their own risk.  */
/***************************************************************/
/*                                                             */
/*  This command accepts parameters passed from Aldon/CMS.     */
/*  The parameters contain pre-defined variable data relating  */
/*  to each object being processed by Aldon/CMS.  Additional   */
/*  parameters can be specified which are passed from the      */
/*  command default screen.                                    */
/***************************************************************/

             CMD        PROMPT('CUSTOM CREATE COMMAND')
             PARM       KWD(OBJNAM) TYPE(*CHAR) LEN(10)
             PARM       KWD(OBJLIB) TYPE(*CHAR) LEN(10)
             PARM       KWD(SRCFIL) TYPE(*CHAR) LEN(10)
             PARM       KWD(SRCLIB) TYPE(*CHAR) LEN(10)
             PARM       KWD(SRCMBR) TYPE(*CHAR) LEN(10)
