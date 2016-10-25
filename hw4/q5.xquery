let $t:=doc("review.xml")/root/review
let $c:=(for $b in distinct-values($t/Movie_ID)
return avg($t[Movie_ID=$b]/Rating))
let $d:= max($c)
for $b in distinct-values($t/Movie_ID)
where avg($t[Movie_ID=$b]/Rating)=$d
return
<Summary>
<Movie_ID>{$b}</Movie_ID>
<Avg_Rating>{$d}</Avg_Rating>
</Summary>



 

 
