 let $a:=doc("movie.xml")/root/row
 let $d:=(for $t in $a/Release_Date
 let $c:=distinct-values(year-from-date($t))
 return $c)
  for $e in distinct-values($d)
  return
  <group>
  <year>{$e}</year> 
  <number_movie>{count($a[contains(Release_Date,string($e))])}</number_movie>
  </group>
  
 



