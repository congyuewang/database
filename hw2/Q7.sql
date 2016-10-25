/*Congyue Wang*/
select request.User_ID,req,agree,not_yet,ifnull(rej,0)
from 
(select User_ID,count(Friend_ID) as req
from Friend_List group by User_ID) as request join 
(select User_ID,count(agree) as agree
from
(select User_ID,Friend_ID as agree
from Friend_List 
where Friend_Agreed='YES'
order by User_ID) 
group by User_ID) as agree on request.User_ID=agree.User_ID join
(select User_ID,count(not_yet) as not_yet
from
(select User_ID,Friend_ID as not_yet
from Friend_List 
where Friend_Agreed='Not-Yet'
order by User_ID) 
group by User_ID) as not_yet on not_yet.User_ID=request.User_ID left outer join
(select User_ID,count(no) as rej
from
(select User_ID,Friend_ID as no
from Friend_List 
where Friend_Agreed='NO'
order by User_ID) 
group by User_ID) as reject on request.User_ID=reject.User_ID