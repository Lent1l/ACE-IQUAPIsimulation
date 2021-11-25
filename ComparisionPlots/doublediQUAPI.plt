set terminal epslatex color standalone size 12cm,6cm
set output "doublediQUAPI.tex"

set xrange [0:100]
set yrange [-0.1:1.1]
set ylabel 'time'
set xlabel 'probablility of state occupation'
set title 'Doubled plot using iQUAPI'

f(x) = 0.5 - 0.5*(cos(w*x))*exp(-a*x)

w = 4*pi*(7.75/100)
a = 0.004

fit f(x) "read_J_PT_iQUAPI_Doubled_ohmic.out" using 1:2 via w, a

plot "read_J_PT_iQUAPI_Doubled_ohmic.out" using 1:2 with lines,\
f(x) t 'Fit',\
0.5 - 0.5*(cos(4*pi*(7.75/100)*x)) with lines
