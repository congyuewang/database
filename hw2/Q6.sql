/*Congyue Wang*/
select *
from User_Profile as U
where U.User_ID='U-2' and 'U-2'in (select Friend_ID
from friend_List
where User_ID='U-17' and Friend_Agreed='YES'
union
select Friend_ID
from friend_List
where User_ID='U-2' and Friend_Agreed='YES')