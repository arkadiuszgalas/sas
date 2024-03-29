/* Macro checkIfEmpty verifies if table passed as parameter has no rows  */
/* Parameters:                                                           */
/* input - table name                                                    */
/* Output:                                                               */
/* Global variable dsIsEmpty                                             */
/*   dsIsEmpty = 1 input table name has no rows                          */
/*   dsIsEmpty = 0 input table has rows                                  */

%macro checkIfEmpty(input);
   %global dsIsEmpty;
   %local nobs;
   
   proc sql noprint;
      select count(*) into: nobs from &input. ;
   quit;
   
   %if &nobs. eq 0 %then %do;
     %let dsIsEmpty = 1;
   %end;
   %else %do;
     %let dsIsEmpty = 0;
   %end;
%mend checkIfEmpty;