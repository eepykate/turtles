i=0; for y in 0 100 200 300 400; do
	for x in 0 100 200 300 400; do
		i=$(( i+1 )) j=0000$i
		inkscape --export-area=$x:$y:$((x+100)):$((y+100)) -o "EXPORT-${j#${j%???}}.png" -w 128 -h 128 longk.svg
	done
done

for i in EXPORT-*; do
	a=
	printf "[%s] " "$i"
	feh -Z. -g 1000x700 "$i" &
	read -r a
	[ "$a" ] &&
		mv "$i" "longk-$a.png"
	pkill feh
done

rm EXPORT-*
