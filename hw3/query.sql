--Q1
select s.STUDENT_ID from students s
where SDO_inside(s.COORDINATE,
            SDO_GEOMETRY(2003, NULL, NULL,
              SDO_ELEM_INFO_ARRAY(1,1003,3),
              SDO_ORDINATE_ARRAY(200,200, 300,300))
            ) = 'TRUE';
--Q2
SELECT b.building_ID
FROM building b
WHERE
SDO_WITHIN_DISTANCE(b.shape, SDO_GEOMETRY(2001,NULL,SDO_POINT_TYPE(220, 112, NULL),NULL,NULL),
'distance = 300') = 'TRUE'
union
SELECT t.station_ID
FROM tramstops t
WHERE
SDO_WITHIN_DISTANCE(t.coordinate, SDO_GEOMETRY(2001,NULL,SDO_POINT_TYPE(220, 112, NULL),NULL,NULL),
'distance = 300') = 'TRUE';
--Q3
SELECT b.building_ID
FROM building b
WHERE
SDO_WITHIN_DISTANCE(b.shape, 
(select t.coordinate from tramstops t where t.station_ID='t2ohe'),
'distance = 300') = 'TRUE'
union
SELECT b.building_ID
FROM building b
WHERE
SDO_WITHIN_DISTANCE(b.shape, 
(select t.coordinate from tramstops t where t.station_ID='t5vhe'),
'distance = 300') = 'TRUE'
union
SELECT b.building_ID
FROM building b
WHERE
SDO_WITHIN_DISTANCE(b.shape, 
(select t.coordinate from tramstops t where t.station_ID='t6ssl'),
'distance = 300') = 'TRUE'
union
SELECT s.student_ID
FROM students s
WHERE
SDO_WITHIN_DISTANCE(s.COORDINATE, 
(select t.coordinate from tramstops t where t.station_ID='t2ohe'),
'distance = 300') = 'TRUE'
union
SELECT s.student_ID
FROM students s
WHERE
SDO_WITHIN_DISTANCE(s.COORDINATE, 
(select t.coordinate from tramstops t where t.station_ID='t5vhe'),
'distance = 300') = 'TRUE'
union
SELECT s.student_ID
FROM students s
WHERE
SDO_WITHIN_DISTANCE(s.COORDINATE, 
(select t.coordinate from tramstops t where t.station_ID='t6ssl'),
'distance = 300') = 'TRUE';
--Q4
select s.student_ID
from students s
where SDO_NN(s.coordinate,SDO_GEOMETRY(2001,NULL,SDO_POINT_TYPE(136, 409, NULL),NULL,NULL)
)='TRUE' and rownum<=5 and not s.student_ID='p12';
--Q5

select * from (select count(*) from
(select b.building_ID,s.student_ID
from building b,students s
 where
SDO_NN(b.shape,s.coordinate,'sdo_num_res=1')='TRUE')
group by building_ID order by count(*) desc) where rownum<=2  ;
--Q6
select s.student_ID,b.building_ID from

 table(SDO_join('students','coordinate',
                      'building','shape',
             'mask=inside')) w,students s,building b
             where w.rowid1=b.rowid and w.rowid1=s.rowid;
             

 

















