/*Congyue Wang*/
select friend.Friend_ID
from
(select Friend_ID,count(Friend_ID)
from Friend_List
where Friend_Group='Close-family' and Friend_Agreed='YES'
group by Friend_ID
order by count(Friend_ID) desc) as friend
limit 1