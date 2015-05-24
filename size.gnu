set terminal png nocrop enhanced size 450,320 font "arial,8" 
set output 'size.png'
set boxwidth 0.75 absolute
set style fill   solid 1.00 border lt -1
set key outside right top vertical Left reverse noenhanced autotitle columnhead nobox
set key invert samplen 4 spacing 1 width 0 height 0 
set style histogram rowstacked title textcolor lt -1
set datafile missing '-'
set style data histograms
set xtics border in scale 0,0 nomirror rotate by -45  autojustify
set xtics  norangelimit
set xtics   ()
set title "Executable size in bytes" 
set yrange [ 0.00000 : 11000.00000 ] noreverse nowriteback
x = 0.0
i = 3
## Last datafile plotted: "size.dat"
plot 'size.dat' using 2:xtic(1), for [i=3:3] '' using i
