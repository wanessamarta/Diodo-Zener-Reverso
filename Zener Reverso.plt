reset
set terminal wxt enhanced

#Exibe um titulo acima do grafico (opcional)
set title 'Diodo Zener(Reverso e Direto)'
#Define a legenda do eixo x
set xlabel 'V (v)'
#Define a legenda do eixo y
set ylabel 'i(mA)'
#Define os intervalos enumerados no eixo x
set xtics 2
#Divide os intervalos enumerados no eixo x em 5 (ou qualquer outro valor inteiro) partes
set mxtics 5
#O mesmo que set xtics mas para o eixo y
set ytics 10
#O mesmo que set mxtics mas para o eixo y
set mytics 10
#Posiciona a legenda interna e coloca uma caixa ao redor dela
set key box right bottom

#Define uma funcao com as constantes de ajuste
i(x)= Is*(e**(k*x)-1)
#Aos dados das colunas 1 (x) e 2 (y) do arquivo salvo com nome 'dados.txt' para obter a, b e c.
fit i(x) 'zenerreverso_data.dat' u 1:2 via Is,k,e

# Salva um log toda vez que o script é executado
set fit logfile "zenerreverso.log"

#Produz o grafico com a curva ajustada e os dados das colunas 1 (x) e 2 (y)
plot i(x) lc 'red' title 'Ajuste', 'zenerreverso_data.dat' u 1:2 pt 7 lc 'black' title 'Dados' with linespoint

# Gera uma imagem com o resultado do gráfico no formato PNG
set terminal pngcairo
set output 'Resultado.png'
replot
unset output

quit
