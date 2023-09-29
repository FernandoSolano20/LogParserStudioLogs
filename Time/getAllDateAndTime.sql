/*  New Query  */

SELECT TOP 1000 STRCAT(TO_STRING(date, 'MM/dd/yyyy'),STRCAT('-',TO_STRING(time, 'hh::mm::ss'))) FROM '[LOGFILEPATH]'