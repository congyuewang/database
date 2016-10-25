let $a:=doc("review.xml")/root
let $b:=doc("movie.xml")/root/row[Title="Goodfellas"]/data(Movie_ID)
let $d:=doc("movie.xml")/root/row[Title="Inception"]/data(Movie_ID)

return
<Summary>
<Title>Goodfellas</Title>
{
for $c in $a/review[Movie_ID=$b]/data(Reviewer_ID)
return doc("reviewer.xml")/root/row[Reviewer_ID=$c]/Reviewer_Name
}
<Title>Inception</Title>
{
for $e in $a/review[Movie_ID=$d]/data(Reviewer_ID)
return doc("reviewer.xml")/root/row[Reviewer_ID=$e]/Reviewer_Name
}
</Summary>