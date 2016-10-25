/*Congyue Wang*/
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
where new.Owner_ID=User_ID ) as Video_User on user_age.User_ID= Video_User.User_ID