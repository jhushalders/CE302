#AULA 25/09
#criando vetores com numeros aleatorios

runif(9, min = 0, max = 1000)

set.seed(123)
runif(10)

rnorm(10, mean = 0, sd = 1)

rpois(10, lambda = 2)

x = c("Thiago", "Alex","Lucas" )

sample (x) #ordem aleatoria

sample (x, size = 2) #mostra sortido
sample(x, size = 10, replace = TRUE)

y = rnorm(100)
sample (y, size = 5)


# Comparação entre vetores
vetor1 <- c(1, 2, 3, 4)
vetor2 <- c(4, 5, 6, 7)

# Igualdade
vetores_iguais <- vetor1 == vetor2  
vetores_iguais
# Diferença
vetores_diferentes <- vetor1 != vetor2
vetores_diferentes
# Maior que
vetores_maior_que <- vetor1 > vetor2
vetores_maior_que
# Menor que
vetores_menor_que <- vetor1 < vetor2
vetores_menor_que
# Menor ou igual
vetores_menor_ou_igual_a <- vetor1 <= vetor2
vetores_menor_ou_igual_a
# Maior ou igual
vetores_maior_ou_igual_a <- vetor1 >= vetor2
vetores_maior_ou_igual_a


#Seleção Posicional
alturas <- c("João" = 1.82, 
             "Bianca" = 1.68,
             "Carlos" = 1.75, 
             "Ana" = 1.70)

# Seleciona o primeiro elemento
alturas[1]
# Seleciona até o terceiro elemento
alturas[1:3]
# Seleciona elementos 1, 3 e 4
alturas[c(1, 3, 4)]
# remove o segundo elemento
alturas[-2]

# Seleciona alturas maiores que 1.70
mascara_logica <- alturas > 1.70
mascara_logica 
alturas[mascara_logica]
alturas[alturas > 1.70]

# Seleciona a altura de João
alturas["João"]
# Seleciona a altura de João e Ana
alturas[c("João", "Ana")]


# Modifica a altura de João
alturas["João"] <- 1.85
alturas


# Atribui altura desconhecida a Bianca
alturas["Bianca"] <- NA
alturas

# Remove a altura de Carlos
alturas = alturas[-3]
alturas

# Adiciona a altura de Ivete
append(alturas, 
       value = c("Ivete" = 1.60))
alturas = append(alturas, 
                 value = c("Ivete"= 1.60))
alturas
# Adiciona a altura de Anderson no inicio
# Adiciona a altura de Anderson no inicio
append(alturas,
       value = c("Anderson"= 1.75), 
       after = 0)
alturas = append(alturas,
         value = c("Anderson"= 1.75), 
         after = 0)
alturas
# concatena alturas
alturas2 <- c("Alana" = 1.70, 
              "Rafael" = 1.80)
alturas <- c(alturas, alturas2)
alturas

#ordem alfabetica
nomes = names(alturas)
nomes [order(nomes)]
alturas[order(nomes)]

#ordem de execução

b = 5
b

invisible (b+3)


print (b)
sum(vetor1) #soma
prod(vetor1) #produto
mean(vetor1) #media
sd(vetor1) #desviopadrao
var(vetor1) #variancia
median (vetor1) #mediana
max(vetor1)
min(vetor1)
fivenum(vetor1)
sqrt(vetor1) #raiz quadrada
order(vetor1)
rev(vetor1) #ordem reversa
abs(vetor1) #modulo
quantile(vetor1) #quartis
quatile(vetor1, probs = 0.03)
table(vetor1) #quantidade
prop.table(table)
length(vetor1)


vetor4 = c(1:100)
vetor5 = sqrt(vetor4)

plot(x = vetor4, 
     y = vetor5, 
     las = 1, 
     pch = seq(1,20),
     col = seq(1,45)
)

plot(x = vetor4, 
     y = vetor5, 
     las = 1, 
     pch = 20,
     col = "#B23A48"
)

#criar vetor color e cada valor fica com cor diferente
plot(x = vetor4, 
     y = vetor5, 
     las = 1, 
     pch = 20,
     col = color
)
#las = numero eixo y de pé
#pch = como é os pontos


hist (vetor4)

x <- c(1, 2, 3, 4, 5)
y <- c(2, 4, 6, 8, 10)
plot(x, y, type = "b")  # Cria um gráfico de linhas e pontos


#Strings
nomes = c("Maria", "Ana", "Rafaela")

paste(nomes[1], "e", nomes[2], "são minhas amigas.", sep = "_")
#sep = separador

paste0(nomes[1], "e", nomes[2])#sem espaço

paste(nomes, collapse = "|")
toupper (nomes)
tolower(nomes)
substr(x = nomes[1], start = 1,stop = 3)

gsub(pattern = "G", 
     replacement = "R",
     x = "Gato")

#Informações sobre Diretórios e Arquivos em R
getwd()
setwd("caminhonovo")
list.files()


reas.ssv()
read.table()
ls()

write.csv("nome do objeto", "caminho.csv")
write.table()

# Importar dados de um arquivo CSV
dados <- read.csv("dados.csv")

# Exportar um dataframe para um arquivo CSV
write.csv(dados, "dados_novos.csv")

# Listar conjuntos de dados integrados disponíveis no R
data()

# Carregar o conjunto de dados "iris" (conjunto de dados de flores iris)
data(iris)

# Exibir as primeiras linhas do conjunto de dados "iris"
head(iris)
head(iris, n = 2)

# Exibir as últimas linhas do conjunto de dados "iris"
tail(iris)

# Exibir um resumo estatístico do conjunto de dados "iris"
summary(iris)

str(iris)

View(iris)

summary(iris)

#MATRIZES
vetor_a = c(1,2,3,4)
vetor_b = c(5,6,7,8)

matriz_linha = rbind(vetor_a, 
                     vetor_b)
matriz_linha

matriz_coluna = cbind (vetor_a, vetor_b)

matriz_coluna

class(matriz_linha)
class(vetor_a)
is.matrix(matriz_coluna)
dim(matriz_coluna)

matriz_a = matrix (seq (1:9),
                   ncol = 3,
                   nrow = 3,
                   byrow = T)

matriz_a

A <- matrix(c(1:9), 
            ncol = 3,
            byrow = F)
A


matriz_a [1,2]
matriz_a [1,]
matriz_a [ ,3]

B <- matrix(c(1:9), 
            ncol = 3, 
            byrow = FALSE)
B
elementos_maior_que_3 <- B[which(B > 3)]
elementos_maior_que_3

## Exemplo 2: Seleção de Elementos Ímpares
elementos_impares <- B[which(B %% 2 != 0)]
elementos_impares


A_sem_terceira_coluna <- A[, -3]  # Remove a terceira coluna da matriz
A_sem_terceira_coluna

A[, -c(1,2)]


#operções entre matrizes
A <- matrix(c(4, -3, 7, 
              10, 1, 1, 
              -5, 2, 3), 
            ncol = 3, 
            byrow = TRUE)
A
B <- matrix(c(2, -1, 3,
              1, 4, 1, 
              5, -2, 7), 
            ncol = 3, 
            byrow = TRUE)
B

dim (A) == dim (B)

A + A
A - B

rowSums(A) #soma dos valor das linhas da matriz
colSums(A) #soma dos valor das colunas da matriz

rowMeans(A)
colMeans(A)

k = 2

A * k

A * B

produto_matricial = A %*% B
produto_matricial

#transposta
t (A)

det (A) #determinante

solve (A) #inversa

#A função diag(A) retorna os elementos da diagonal principal da matriz A.
diag(A)

#A função eigen() retorna uma lista contendo os autovalores e autovetores de A.
eigen (A)

AUTOVALORES_AUTOVETORES = eigen (A)

AUTOVALORES_AUTOVETORES$vectors
AUTOVALORES_AUTOVETORES$values


produto_transposto <- crossprod(A, B)
produto_transposto


#
produto_transposto_t <- tcrossprod(A, B)
produto_transposto_t

A
colnames(A) = c("Coluna1", "Coluna2", "Coluna3")
rownames(A) = c("Linha1", "Linha2", "Linha3")
A

#A função upper.tri() retorna uma matriz de elementos lógicos que indica quais elementos de uma matriz estão acima da diagonal principal. Os elementos TRUE indicam que o elemento correspondente está acima da diagonal, enquanto os elementos FALSE indicam que o elemento está na diagonal ou abaixo dela
A <- matrix(1:9, nrow = 3)
upper_elements <- upper.tri(A)
upper_elements

A[upper_elements] = 24

lower_elements <- lower.tri(A)
lower_elements

A[lower_elements] = 24
A


# Criando um array 2x3x4 (3 dimensões)
arr <- array(1:24, dim = c(2, 3, 4))
arr


elemento <- arr[2, 3, 4]
elemento

arr[, , 1] #todos da mesma dimensão

# Criando dois arrays
arr1 <- array(1:12, dim = c(3, 2, 2))
arr2 <- array(13:24, dim = c(3, 2, 2))

# Soma de arrays
soma <- arr1 + arr2
soma
# Produto element-wise
produto <- arr1 * arr2
produto
# Média ao longo da terceira dimensão
media <- mean(arr1, dim = 3)
media










