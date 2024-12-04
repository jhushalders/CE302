#Q1
Notas
##     Violino       Viola  Violoncelo Contrabaixo 
##          34          40          52          96 
##      Flauta   Clarinete        Oboé    Trompete 
##          92          34          38          63 
##    Trombone   Percussão 
##          46          53

notas = c(34, 40, 52, 96, 92, 34, 38, 63, 46, 53)

LimiteVolume

##     Violino       Viola  Violoncelo Contrabaixo 
##       FALSE       FALSE       FALSE        TRUE 
##      Flauta   Clarinete        Oboé    Trompete 
##        TRUE       FALSE       FALSE        TRUE 
##    Trombone   Percussão 
##       FALSE       FALSE

LimiteVolume = c(F, F, F, T, T, F, F, T, F, F)

MediaNotas = mean(notas)
RaizQuadradra = sqrt(MediaNotas)
RaizQuadradra

NotasLimite = c (96, 92, 63)
summary(NotasLimite)
sd (NotasLimite)

ajustes = notas >= 40 & notas <= 69
ajustes

#Q2
X
##       Ativo_1 Ativo_2 Ativo_3 Ativo_4 Ativo_5 Ativo_6
## Mês_1    -2.8     4.3    -1.7     0.4    -2.5    -1.2
## Mês_2    -3.9    -4.9     1.6     1.3     0.0     1.0
## Mês_3    -0.8     0.4     0.3     1.4     4.5     0.2
## Mês_4     3.6     1.5    -3.4    -4.8    -2.7     3.8
## Mês_5     2.8     3.7     3.0    -3.2    -0.2     3.3
##       Ativo_7 Ativo_8 Ativo_9 Ativo_10
## Mês_1     4.0     0.9    -0.6     -1.3
## Mês_2     1.8     3.5    -2.9      2.7
## Mês_3    -0.2    -3.5     5.0     -4.1
## Mês_4    -2.4     0.5    -3.2     -4.1
## Mês_5     4.1    -4.7     0.2     -0.2

mes1 = c (-2.8, 4.3, -1.7, 0.4, -2.5, -1.2, 4, 0.9, -0.6, -1.3)
mes2 = c (-3.9, -4.9, 1.6, 1.3, 0, 1, 1.8, 3.5, -2.9, 2.7)
mes3 = c (-0.8, 0.4, 0.3, 1.4, 4.5, 0.2, -0.2, -3.5, 5, -4.1)
mes4 = c (3.6, 1.5, -3.4, -4.8, -2.7, 3.8, -2.4, 0.5, -3.2, -4.1)
mes5 = c (2.8, 3.7, 3, -3.2, -0.2, 3.3, 4.1, -4.7, 0.2, -0.2)

matrizX = rbind(mes1, mes2, mes3, mes4, mes5)
mediacolx = colMeans(matrizX)
max (mediacol)

Y
##       Ativo_1 Ativo_2 Ativo_3 Ativo_4 Ativo_5 Ativo_6
## Mês_1    -2.0    -1.9    -4.1    -4.2    -4.1    -4.0
## Mês_2    -1.6    -3.6    -1.7     1.3    -0.3     2.9
## Mês_3     3.3    -0.2     4.8     4.2     0.1     1.8
## Mês_4     2.2     1.0    -1.1    -3.4     4.2    -4.5
## Mês_5     1.6    -0.1    -2.4     0.1     1.1    -4.2
##       Ativo_7 Ativo_8 Ativo_9 Ativo_10
## Mês_1    -2.7     0.3    -2.9     -4.8
## Mês_2    -2.1     3.3     3.5      2.2
## Mês_3    -4.1    -4.9    -0.8     -0.4
## Mês_4    -3.7    -3.0     2.0      0.1
## Mês_5     0.1     1.4    -1.3     -1.5

mes_1 = c (-2, -1.9, -4.1, -4.2, -4.1, -4, -2.7, 0.3, -2.9, -4.8)
mes_2 = c (-1.6, -3.6, -1.7, 1.3, -0.3, 2.9, -2.1, 3.3, 3.5, 2.2)
mes_3 = c (3.3, -0.2, 4.8, 4.2, 0.1, 1.8, -4.1, -4.9, -0.8, -0.4)
mes_4 = c (2.2, 1, -1.1, -3.4, 4.2, -4.5, -3.7, -3, 2, 0.1)
mes_5 = c (1.6, -0.1, -2.4, 0.1, 1.1, -4.2, 0.1, 1.4, -1.3, -1.5)

matrizY = rbind(mes_1, mes_2, mes_3, mes_4, mes_5)
matrizY
transposta_Y = t(matrizY)
transposta_Y
novaY = matrizY  %*% transposta_Y
novaY
soma = novaY [1,1] + novaY [2,2] + novaY [3,3] + novaY [4,4] + novaY [5,5]
soma

mediacolx = colMeans(matrizX)
mediacoly = colMeans(matrizY)
mediacolx
mediacoly
alteracao = mediacolx - mediacoly
max (alteracao)

maiores5 = matrixX [, 1] + matrixX [, 2] + matrixX [, 3] + matrixX [, 6] + matrixX [, 7]
maiores5


mes1maiores = c (-2.8, 4.3, -1.7, -1.2, 4)
mes2maiores = c (-3.9, -4.9, 1.6, 1, 1.8)
mes3maiores = c (-0.8, 0.4, 0.3, 0.2, -0.2)
mes4maiores = c (3.6, 1.5, -3.4, 3.8, -2.4)
mes5maiores = c (2.8, 3.7, 3, 3.3, 4.1)

matrizmaiores = rbind(mes1maiores, mes2maiores, mes3maiores, mes4maiores, mes5maiores)  
determinante = det (matrizmaiores)
determinante