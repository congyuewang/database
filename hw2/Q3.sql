/*Congyue Wang*/
select * from
(select Video_ID,View_Count,Artist
from Video
where Upload_Date like '2013/12%' 
order by View_Count desc)
limit 3