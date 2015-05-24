set terminal png nocrop enhanced size 900,640 font "arial,14" 
set output 'analysis.png'
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
set title "CPU usage in seconds" 
set yrange [ 0.00000 : 200.00000 ] noreverse nowriteback
x = 0.0
i = 11

do for [i=1:11] {
    set style line i linecolor rgb hsv2rgb(0.11*(i-1), 1, 1)
}

plot 'analysis.dat'   using 2:xtic(1), for [i=3:11] '' using i ls i

