#!/bin/bash


sqlite3 temperature.db <query_max_temp.sql >query_max_temp.out

TODAY=`date +"%Y-%m-%d"`
BEGDATE=`head -n 1 query_max_temp.out | awk -F, '{print($1)}'`


gnuplot <<EOF
set title "Controller Temperature"
set timefmt "%Y-%m-%d"
set xdata time
set xrange ["${BEGDATE}":"${TODAY}"]
set yrange [0:100]
set xlabel "Date"
set ylabel "Temperature"
set grid
set datafile separator ","
set key left box
set terminal dumb
set xtics out nomirror
plot "query_max_temp.out" using 1:2 title 'Temp(C)' with lines
set terminal png size 600,400
set output "query_max_temp.png"
replot
EOF


