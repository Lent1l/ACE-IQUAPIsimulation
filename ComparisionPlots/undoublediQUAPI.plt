set terminal epslatex color standalone size 12cm,6cm
set output "undoubledfitiQUAPI.tex"

set xrange [0:100]
set yrange [-0.1:1.1]
set ylabel 'time'
set xlabel 'probablility of state occupation'
set title 'Fitting of ohmic spectral density decoherence'

f(x) = 0.5 - 0.5*(cos(w*x))*exp(-a*x)

w = 2*pi*(7.75/100)
a = 0.002

fit f(x) "read_J_PT_iQUAPI_ohmic.out" using 1:2 via w, a

plot "read_J_PT_iQUAPI_ohmic.out" using 1:2 with lines,\
f(x) t 'Fit'
