#AULA 13/11 REPETIÇÃO
#WHILE
while (condicao) {
  # Código a ser repetido enquanto a condição for verdadeira
}


i <- 1 # sempre definimos o critério de parada fora do loop

while (i < 6) {
  print(i)
  i <- i + 1 # Sempre alteramos o critério 
  # de parada, senão caímos em um loop infinito
}

#podemos parar o nosso loop caso nosso i == 4 BREAK
i <- 1
while (i < 6) {
  print(i)
  i <- i + 1
  if (i == 4) {
    break
  }
}

contador = 0
i = 0
while (i<10){
  i = sample(1:100, size = 1)
  contador = contador + 1
  print (contador)
  print (i)
  if (contador == 4){
    break
  }
}

#podemos pular uma interação sem encerrar o loop NEXT
i <- 0
while (i < 6) {
  i <- i + 1
  if (i == 3) {
    next
  }
  print(i)
}

#Exercicio
#Suponha o lançamento de um dado não viesado, com seis faces. 
#Quantas vezes devo lançar o dado para obter a face 5?
set.seed(1234)

dado <- seq(1:6)
n_lancamento = 0
sorteio = 0
df = list()
while (sorteio != 5) {
  sorteio =  sample(dado, 1)
  n_lancamento = n_lancamento + 1
  df[[n_lancamento]] = data.frame(n_sorteado = sorteio, 
                  n_lancamento = n_lancamento)
  
  cat(paste0("\n\nLançamento: ", n_lancamento, "\nValor Sorteado: ", sorteio))
}
df %<>% dplyr::bind_rows()
df

#FOR
for (variavel in sequencia) {
  # Código a ser executado para cada valor da sequência
}
#nao precisa definir a variavel antes
for(i in 1:10) {
  x1 <- i^2
  print(x1)
}

require(dplyr)
require(magrittr)

#Além disso, podemos ter for aninhados.
#Suponha agora um experimento que consiste no lançamento de dois dados não viesados de seis faces, 
#e definimos uma variável aleatória como o quadrado da soma das faces superiores dos dois dados. 
#Queremos guardar o valor dos dois dados, a soma das faces superiores e o quadrado da soma

dado = c(1:6)
soma_dois_dados = function(dado1, dado2){
  soma = dado1 + dado2
  return(soma)
}

quadrado_soma = function(soma){
  soma2 = soma^2
  return(soma2)
}

resultado = list()
k = 0 
for(i in dado){
  for(j in dado){
    k = k + 1
    soma = soma_dois_dados(dado[i], dado[j])
    somaqd = quadrado_soma(soma)
    
    resultado[[k]] = data.frame(dado1 = dado[i], 
                                dado2 = dado[j], 
                                soma = soma, 
                                soma2 = somaqd)
  }
}
#resultado em lista transformado em df
resultado %<>%
  bind_rows()
resultado

#Apply - Aplica uma função qualquer a uma matriz, array ou data.frame ao longo de margens específicas 
#(linhas 1 ou colunas 2). O output de um apply() é um vetor.
matriz1 <- matrix(1:6, nrow = 2)
soma_linhas <- apply(matriz1, 1, median)
soma_colunas <- apply(matriz1, 2, sum)

#lapply(): Aplica uma função a cada elemento de uma lista e retorna uma lista com os resultados.
minha_lista <- list(a = c(1, 2, 3), b = c(4, 5, 6))
resultados <- lapply(minha_lista, mean)
resultados

#sapply(): A função sapply() é semelhante ao lapply(), 
#mas tenta simplificar o resultado em um vetor ou matriz sempre que possível. 
#Se todos os resultados forem do mesmo comprimento, será retornado um vetor. 
#Caso contrário, será retornada uma matriz.
minha_lista <- list(a = c(1, 2, 3), b = c(4, 5, 6), c=c(7,6,8))
resultados <- sapply(minha_lista, mean)
resultados

#mapply(): Aplica uma função a vários argumentos. 
#Ele oferece uma maneira eficiente de realizar essas operações de forma flexível e controlada.
resultado <- mapply(soma_dois_dados, 
                    dado, 
                    dado)

print(resultado)

#E se eu quisesse somar todas as combinações como no for aninhado? 
#Para isso podemos expandir o grid de busca, utilizando o expand.grid.
#todas as combinações possiveis
dois_dados = expand.grid(dado, dado)
dois_dados

resultado <- mapply(soma_dois_dados, 
                    dois_dados$Var1, 
                    dois_dados$Var2)

print(resultado)


#Funções

nome_da_funcao <- function(argumentos) {
  # Corpo da função
  # Instruções para realizar a tarefa
  return(resultado) # Resultado da função
}

#exemplo
data("iris")

minha_media <- function(vetor_de_dados, digitos = 2){ #usuario coloca o numero de digitos, caso nao coleque, default é 2
  media = sum(vetor_de_dados, na.rm = T)/length(vetor_de_dados, na.rm = T)
  media = round(media, digitos) #media = round(media, 2) duas casas decimais
  return(media)
}

minha_media(iris$Sepal.Length,6) #6 define o numero de decimais, se nao colocar = default
mean()

meu_desvio_padrao_amostral <- function(vetor) {
  media <- minha_media(vetor) 
  diferenca <- vetor - media  # Calcula as diferenças em relação à média
  quadrados <- diferenca^2  # Calcula os quadrados das diferenças
  variancia <- sum(quadrados) / (length(vetor) - 1)  # Calcula a variância
  desvio_padrao <- sqrt(variancia)  # Calcula o desvio padrão
  out = data.frame(media = media,
                   desvio = desvio_padrao) #return com mais de um argumento
  return(out)
}

meu_desvio_padrao_amostral(iris$Sepal.Length)

#MENSAGENS

x <- -5
if (x < 0) {
  message("O valor de x é negativo.") #vermelho
}

x <- -5
if (x < 0) {
  cat("O valor de x é negativo.") #branco
}

x <- -5
if (x < 0) {
  warning("O valor de x é negativo.") #mensagem de aviso
}

x <- -5
if (x < 0) {
  stop("O v.alor de x é negativo") #erro
}

#IF E ELSE
if (condicao) {
  # Código a ser executado se a condição for verdadeira
} else {
  # Código a ser executado se a condição for falsa
}

idade <- 25

if (idade >= 18) {
  cat("Você é maior de idade.\n")
} else {
  cat("Você é menor de idade.\n")
}

#IF ALINHADOS
pontuacao = 90

if (pontuacao >= 90) {
  nota = "A"
} else {
  if (pontuacao >= 80) {
    nota = "B"
  } else {
    if (pontuacao >= 70) {
      nota = "C"
    } else {
      nota = "D"
    }
  }
}

nota

#Podemos estar interessado em criar uma função para determinarmos o Quadrante de um Ponto no Plano Cartesiano, 
#essa função recebe como entrada dois valores, as coordenadas (x, y).
quadrante <- function(x, y) {
  if (x > 0) {
    if (y > 0) {
      quadrante = "Quadrante 1"
      
      cat(paste0("O ponto (", x, ", ", y, ") pertence ao ",  quadrante))
      return(quadrante)
    } else {
      quadrante = "Quadrante 4"
      
      cat(paste0("O ponto (", x, ", ", y, ") pertence ao ",  quadrante))
    }
  } else {
    if (y > 0) {
      quadrante = "Quadrante 2"
      
      cat(paste0("O ponto (", x, ", ", y, ") pertence ao ",  quadrante))
    } else {
      quadrante = "Quadrante 3"
      
      cat(paste0("O ponto (", x, ", ", y, ") pertence ao ",  quadrante))
    }
  }
}

quadrante(1, 1)

#If_else e ifelse
iris %<>% 
  mutate(cat_petal.len = ifelse(Petal.Length > mean(Petal.Length), "Longa", "Curta"))

iris %<>% 
  mutate(cat_petal.len2 = if_else(Petal.Length > mean(Petal.Length), "Longa", "Curta"))

#switch
dia_da_semana <- "segunda"

mensagem <- switch(dia_da_semana,
                   "segunda" = "Hoje é segunda-feira.",
                   "terca" = "Hoje é terça-feira.",
                   "quarta" = "Hoje é quarta-feira.",
                   "quinta" = "Hoje é quinta-feira.",
                   "sexta" = "Hoje é sexta-feira.",
                   "sabado" = "Hoje é sábado.",
                   "domingo" = "Hoje é domingo.",
                   "Outro" = "Dia não reconhecido."
)

cat(mensagem)

#case_when 
iris$cat_sepal = 
  case_when((iris$Sepal.Length < mean(iris$Sepal.Length) - sd(iris$Sepal.Length)) ~ "X < media - 1 sd", 
            (iris$Sepal.Length < mean(iris$Sepal.Length) + sd(iris$Sepal.Length)) ~ "X < media + 1 sd", 
            .default = "X > media + 1 sd")























