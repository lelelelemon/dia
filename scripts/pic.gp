set terminal jpeg giant font "Helvetica" 16
#set size 8,8
set key invert reverse Left outside above font ", 8" 

set style histogram columns
set style fill solid
set key autotitle column
set boxwidth 0.8
set format y "    "
set tics scale 0
set title "Plot 3"
set grid y
set style data histograms
set boxwidth 
set style fill solid 1.0 border -1
set title font ", 9" "total duration"
set ytics font ", 6" 
set logscale y 10
set xrange [-0.5:9.5]
set ylabel font ", 10" "millisecond (log10 scale)"
set xtics font ", 8" rotate by 20 right
unset xtics
set ytics font ", 8" 

#set format y "10^{%L}" 
set ytics (10,100,1000,2000)
set format y "%10.0f"
set yrange [1:2000]

set style histogram clustered

# total_duration
set title "total duration"
set output '../pic/total_duration1.jpg'
plot 'total.txt' using 2  t "200" lc rgb "#ACBA9D"   ,\
'' using 3  t "2k" lc rgb "#EFB28C",\
'' using 4  t "20k" lc rgb "#E8837E"

set xrange [9.5:19.5]
set output '../pic/total_duration2.jpg'
plot 'total.txt' using 2  t "200" lc rgb "#ACBA9D"   ,\
'' using 3  t "2k" lc rgb "#EFB28C",\
'' using 4  t "20k" lc rgb "#E8837E"

set xrange [19.5:29.5]
set output '../pic/total_duration3.jpg'
plot 'total.txt' using 2  t "200" lc rgb "#ACBA9D"   ,\
'' using 3  t "2k" lc rgb "#EFB28C",\
'' using 4  t "20k" lc rgb "#E8837E"



#set ytics (10,100,1000,3000,5000,10000)

#set yrange [1:10000]
# query time
set title "query time"
set output '../pic/query_time1.jpg'
plot 'total.txt' using 5  t "200" lc rgb "#ACBA9D"   ,\
'' using 6  t "2k" lc rgb "#EFB28C",\
'' using 7  t "20k" lc rgb "#E8837E"

set xrange [9.5:19.5]
set output '../pic/query_time2.jpg'
plot 'total.txt' using 5  t "200" lc rgb "#ACBA9D"   ,\
'' using 6  t "2k" lc rgb "#EFB28C",\
'' using 7  t "20k" lc rgb "#E8837E"

set xrange [19.5:29.5]
set output '../pic/query_time3.jpg'
plot 'total.txt' using 5  t "200" lc rgb "#ACBA9D"   ,\
'' using 6  t "2k" lc rgb "#EFB28C",\
'' using 7  t "20k" lc rgb "#E8837E"



# render time 
set title "render time"
set output '../pic/render_time1.jpg'
plot 'total.txt' using 8  t "200" lc rgb "#ACBA9D"   ,\
'' using 9  t "2k" lc rgb "#EFB28C",\
'' using 10  t "20k" lc rgb "#E8837E"

set xrange [9.5:19.5]
set output '../pic/render_time2.jpg'
plot 'total.txt' using 8  t "200" lc rgb "#ACBA9D"   ,\
'' using 9  t "2k" lc rgb "#EFB28C",\
'' using 10  t "20k" lc rgb "#E8837E"

set xrange [19.5:29.5]
set output '../pic/render_time3.jpg'
plot 'total.txt' using 8  t "200" lc rgb "#ACBA9D"   ,\
'' using 9  t "2k" lc rgb "#EFB28C",\
'' using 10  t "20k" lc rgb "#E8837E"



# other app time
set title "app time"
set output '../pic/app_time1.jpg'
plot 'total.txt' using 11  t "200" lc rgb "#ACBA9D"   ,\
'' using 12  t "2k" lc rgb "#EFB28C",\
'' using 13  t "20k" lc rgb "#E8837E"

set xrange [9.5:19.5]
set output '../pic/app_time2.jpg'
plot 'total.txt' using 11  t "200" lc rgb "#ACBA9D"   ,\
'' using 12  t "2k" lc rgb "#EFB28C",\
'' using 13  t "20k" lc rgb "#E8837E"

set xrange [19.5:29.5]
set output '../pic/app_time3.jpg'
plot 'total.txt' using 11  t "200" lc rgb "#ACBA9D"   ,\
'' using 12  t "2k" lc rgb "#EFB28C",\
'' using 13  t "20k" lc rgb "#E8837E"



