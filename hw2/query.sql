/*Congyue Wang*/
select User_ID
from User_Profile
where Date_Membered like '2012/05/%';

select cast(avg(age) as int) 
from
(SELECT User_ID, (strftime('%Y', 'now') - strftime('%Y', birth_date)) - (strftime('%m-%d', 'now') < strftime('%m-%d', birth_date)) as age
from (select User_ID, substr(DoB,1,4)||'-'||substr(DoB,6,2)||'-'||substr(DoB,9,2) as birth_date from User_Profile)) as user_age join
(select User_ID,Video_IDs
from User_Profile,
(select Owner_ID,Video_IDs
from Channels as c
where c.Channel_Type='Public-Channel'
and (length(Video_IDs) - length(replace(Video_IDs, ',', '')) +1) >4) as new
where new.Owner_ID=User_ID ) as Video_User on user_age.User_ID= Video_User.User_ID;

select * from
(select Video_ID,View_Count,Artist
from Video
where Upload_Date like '2013/12%' 
order by View_Count desc)
limit 3;

select sum(View_Count),cast(substr(Upload_Date,1,4) as integer) as year,Type
from Video
group by year,Type;

select Channel_ID
from (SELECT User_ID, min(julianday()-julianday(birth_date)) as minage
from (select User_ID, substr(DoB,1,4)||'-'||substr(DoB,6,2)||'-'||substr(DoB,9,2) as birth_date from User_Profile)) as user_age,Channels as c
Where c.Owner_ID=user_age.User_ID;

select *
from User_Profile as U
where U.User_ID='U-2' and 'U-2'in (select Friend_ID
from friend_List
where User_ID='U-17' and Friend_Agreed='YES'
union
select Friend_ID
from friend_List
where User_ID='U-2' and Friend_Agreed='YES');

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
group by User_ID) as reject on request.User_ID=reject.User_ID;

select friend.Friend_ID
from
(select Friend_ID,count(Friend_ID)
from Friend_List
where Friend_Group='Close-family' and Friend_Agreed='YES'
group by Friend_ID
order by count(Friend_ID) desc) as friend
limit 1;