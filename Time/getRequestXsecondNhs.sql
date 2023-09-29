-- Use this with the macro addNewDateConverted

/*  New Query  */

SELECT STRCAT(TO_STRING(date, 'MM/dd/yyyy'),STRCAT('-',TO_STRING(time, 'hh:mm:ss'))) as DateTime, count(1) as hits FROM '[LOGFILEPATH]'
where cs-host = 'www.newhomesource.com'
group by DateTime
order by hits desc
