/*  New Query  */

SELECT STRCAT(EXTRACT_PREFIX(EXTRACT_TOKEN(TO_STRING(time, 'hh::mm'), 0, '::'), 0, '::'), 
STRCAT(':', STRCAT(EXTRACT_PREFIX(EXTRACT_TOKEN(TO_STRING(time, 'hh::mm'), 1, '::'), 0, '::'), 
STRCAT(':', EXTRACT_PREFIX(EXTRACT_TOKEN(TO_STRING(time, 'hh::mm::ss'), 2, '::'), 0, '::'))))) as hour, count(1) as hits FROM '[LOGFILEPATH]'
group by hour
order by hits desc
