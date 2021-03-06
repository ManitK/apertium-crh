echo ""
for i in `cat crh_CYRL2LAT.twol | grep '!!' | sed 's/ /_/g' | grep -v '^$'`; do 
	w=`echo $i | sed 's/_/ /g' | sed 's/!! //g' | sed 's/ //g'`; 
	echo "=== "$w" ========================================"
	z=`echo $w | cut -f1 -d':' | hfst-strings2fst | hfst-compose-intersect -2 crh_CYRL2LAT.hfst | hfst-fst2strings`; 
	if [[ $w != $z ]]; then
		echo "$z != $w";
	fi
done
echo ""
for i in `cat crh_CYRL2LAT.twol | grep '!@' | sed 's/ /_/g' | grep -v '^$'`; do
	w=`echo $i | sed 's/!@_//g' | sed 's/_/ /g'`;
	echo "=== "$w" ========================================"
	echo $w | sed 's/^ *//g' | sed 's/ *$//g' | hfst-pair-test crh_CYRL2LAT.twol.hfst;
done
