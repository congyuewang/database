/*Congyue Wang*/
select Channel_ID
from (SELECT User_ID, min(julianday()-julianday(birth_date)) as minage
from (select User_ID, substr(DoB,1,4)||'-'||substr(DoB,6,2)||'-'||substr(DoB,9,2) as birth_date from User_Profile)) as user_age,Channels as c
Where c.Owner_ID=user_age.User_ID