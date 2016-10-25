/*Congyue Wang*/
select sum(View_Count),cast(substr(Upload_Date,1,4) as integer) as year,Type
from Video
group by year,Type