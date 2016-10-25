let $a:=doc("movie.xml")/root/row
return
<Summary>
<Genre>Action</Genre>
{
for $b in $a[contains(Genre,"Action")]/Movie_ID
return $b
}
<Genre>Crime</Genre>
{
for $c in $a[contains(Genre,"Crime")]/Movie_ID
return $c
}
<Genre>Sci-Fi</Genre>
{
for $d in $a[contains(Genre,"Sci-Fi")]/Movie_ID
return $d
}
</Summary>