#AULA 2 18/09
install.packages("ggplot2") #INSTALAR PACOTES
((((((((((((((((((((()))))))))))))))))))))

?mean #saber mais sobre a função, abre em help no quarto quadrante
help("mean")

??mean #os pacotes que usam a função
help.search()

vignette("ggplot2") #tutorial pacote

x = 1 #variaveis aparecem no environment (quadrante 1)
y = 2
x + y
z <- 3

c(1,2,3)

rm(variavel) #apagar variavel
ls() #mostrar todas as variaveis
rm (z)

traceback() #mostr até onde correu certo

CTRL + SHIFT + D #debugar

#CALCULADORA
a = 1
b = 2
a + b #soma
a - b #subtração
a * b #multiplicação
a / b #divisão
a ^ b #exponenciação
a %% b #resto divisão
a %/% b #divisão inteira

a == b
1 == 1 
1 != 2
2 > 1 
1 < 2
a >= b
a <= b

log(10) # Logarítimo natural/neperiana
exp(10) # Exponencial
log10(100) # Logarítimo base 10
log2(10) # Logarítimo base 2
log(100, base = 8) # Log. base 8

exp (10) #exponencial 

#radiano
sin(0) # Seno
cos(0) # Cosseno
tan(0) # Tangente
asin(0) # Arco seno
acos(0) # Arco cosseno
atan(0) # Arco tangente

pi
sqrt(10)

round(pi, digits = 2) # Arredondamento
ceiling(pi) # Teto
floor(pi) # Piso
trunc(pi) # Truncamento

(1 == 1) & (2 == 2) # E / AND
(1 == 1) | (2 == 3) # OU / OR
!(1 == 2) # NÃO / NOT

#Tipos Especiais

NA #Valores Ausentes
NaN #Not a Nunmber
Inf e -Inf #Infinito
NULL #Valor Nulo (vazio)

NA + 5

is.na(NA)
 10 + NULL

"R" == "r" # Comparação de strings
"a" < "b" # Ordem Alfanumérica
"1" < "2" # Ordem Alfanumérica
"1" < "a"
"abc" > "abcd"

#VETORES
vetor_numerico <- c(1,2,3,4,5) #nao há vetor com diferentes tipos
meu_vetor = c (1,2,3,4)
meu_vetor
vetor_char = c ("a", "b", "c")

#elementos vetor

vetor_char[1]
vetor_char[1:2]
vetor_char[4]
vetor_char[-1] #remove poosição 1
vetor_char[-c(1:2)]
vetor_char[-c(1,3)]

# Operações aritméticas com vetores
vetor1 <- c(1, 2, 3)
vetor2 <- c(4, 5, 6)

# Soma 
soma_vetores <- vetor1 + vetor2
soma_vetores
# Subtração
subtracao_vetores <- vetor1 - vetor2
subtracao_vetores
# Multiplicação
multiplicacao_vetores <- vetor1 * vetor2
multiplicacao_vetores
# Divisão
divisao_vetores <- vetor1 / vetor2
divisao_vetores
# Exponenciação 
exponenciacao_numero <- vetor1^2  
exponenciacao_numero
# Módulo resto
modulo_numero <- vetor1 %% 3 
modulo_numero

abs(-2) #módulo |-2| = 2

is.character(vetor1)
is.numeric(vetor1)
class(vetor1)

vetor3 = as.character(vetor1) #muda pra string

is.numeric(vetor3)

datas <- c("2021-01-01", "2021-01-02", "2021-01-03")
# Converte para data
datasnumeric = as.Date(datas) 

#vetor nomeado (cada elemento tem um nome)

## Podemos ter um vetor numérico com nomes
altura <- c("João" = 1.82,
            "Bianca" = 1.68,
            "Eduarda" = 1.62)
class(altura)
altura

altura[2]
altura ["Bianca"]
altura[max(altura)]

names(altura[max(altura)])
names (altura)
altura [altura > 1.7]

seq(1, 4)
seq(from = 1,
    to = 10,
    by = 2)
seq(from = 10,
    to = 1,
    by = -2)
rep(1, 4)

# Sequência de 1 a 10
seq1 <- seq(1, 10)
seq1
# Repete 1, 2 e 3, 3 vezes
rep1 <- (c(1, 2, 3), times = 3)
rep1
# Repete 1, 2 e 3, 3 vezes cada
rep2 <- rep(c(1, 2, 3), each = 3)
rep2