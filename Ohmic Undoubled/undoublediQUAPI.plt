set terminal epslatex color standalone size 12cm,6cm
set output "undoublediQUAPI.tex"

set xrange [0:100]
set yrange [-0.1:1.5]
set ylabel 'probability of state occupation'
set xlabel 'time'
set title 'Fitting of ohmic spectral density time evolution (E = $\frac{\hbar}{ 2} * 0.5$)'

f(x) = 0.5 - 0.5*(cos(w*x))*exp(-a*x)

w = 0.5
a = 0.002

fit f(x) "read_J_PT_iQUAPI_ohmic.out" using 1:2 via w, a

plot "read_J_PT_iQUAPI_ohmic.out" using 1:2 t 'iQUAPI data' with lines ,\
f(x) t 'Fit'
