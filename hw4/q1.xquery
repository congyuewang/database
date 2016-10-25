let $t:=doc("movie.xml")
return $t/root/row[Runtime=max($t//data(Runtime))]/Title