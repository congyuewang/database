for $t in doc("movie.xml")/root/row
for $c in $t/data(Writer)
where $c="Christopher Nolan"
order by $t/Release_Date 
return $t[contains(Director,"Christopher Nolan")]/Title
