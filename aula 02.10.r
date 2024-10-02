#AULA 02/10
#DATA FRAMES (DADOS DE NATUREZAS DIFERENTES)
# Exemplo de criação de Data Frame

meu_df = data.frame(x = c(1:10),
                    y = LETTERS [1:10])
meu_df

meu_data_frame <- data.frame(
  nome = c("Alice", "Bob", "Carol", "Ana", "João", "Carlos", "Patrícia", "Leonardo"),
  idade = c(25, 30, 28, 20, 27, 50, 60, 45),
  salario = c(5000, 6000, 5500, 8000, 2000, 3500, 10000, 3800 ), 
  meio_de_transporte = c('onibus', 'bicicleta', 'onibus', 'carro', 'carro', 'onibus', 'onibus', 'bicicleta')
)
meu_data_frame

## Nomes de colunas do nosso data.frame não possuem espaço, podem ser separadas por "." ou "_".

head(meu_data_frame) #6 primeiras
tail(meu_data_frame) #6 ultimas
meu_data_frame[1:2,3:4]

meu_data_frame$nome #se comporta como vetor

str(meu_data_frame) #visão geral

class (meu_data_frame$nome)
class (meu_data_frame)
meu_data_frame[,"idade"]

#adicionando colunas
meu_data_frame$genero <- c("F", "M", "F", "F", "M", "M", "F", "M")
meu_data_frame

meu_data_frame[,-2] #remove colunas

meu_data_frame$constante = "Sim"

#subconjuntos
subconjunto_df <- meu_data_frame[meu_data_frame$idade > 28, ]  # Seleciona pessoas com idade maior que 28
subconjunto_df

# Usando a função subset(), mais fácil
subconjunto_df <- subset(meu_data_frame, idade > 28)
subconjunto_df

subconjunto_combinado <- meu_data_frame[meu_data_frame$idade > 25 & meu_data_frame$idade < 30, ]
subconjunto_combinado

subconjunto_2 = subset(meu_data_frame, idade > 28 & salario > 3500) #e
subconjunto_2
subconjunto_3 = subset(meu_data_frame, idade < 40 | salario > 3500) #ou
subconjunto_3

dim (meu_data_frame) #linha e coluna
nrow(meu_data_frame) #numero de linhas
ncol(meu_data_frame) #numero de colunas
summary(meu_data_frame) #resumo estatistico
mean(meu_data_frame$idade) #media
sd (meu_data_frame$idade) #desvio padrao
median(meu_data_frame$idade) #mediana
quantile(meu_data_frame$idade) #quartis
ordenado <- meu_data_frame[order(meu_data_frame$idade), ] #por em alguma ordem
ordenado

# Exemplo de uso da função by(). 
#A função by() é usada para aplicar uma função a subconjuntos de um Data Frame, com base em uma ou mais variáveis. 
#Ela é útil para realizar operações em grupos de dados.
resultado <- by(meu_data_frame$salario, 
               meu_data_frame$idade, mean)
resultado

#FATORES
#atores são uma estrutura de dados especial em R usada para representar variáveis categóricas
# Exemplo de criação de fator, alfanumerico
genero <- factor(c("Masculino", "Feminino", "Masculino", "Feminino"))
genero
# Exenplo com diferentes níveis
estadiamento_doenca <- factor(c("Estágio I", "Estágio II", "Estágio I", "Estágio III", "Estágio IV"), 
                              levels = c("Estágio I", "Estágio II", "Estágio III", "Estágio IV"))
estadiamento_doenca

meu_data_frame$estad_doenca = c("I", "I", "II", "IV", "II", "III", "I", "IV")
as.factor(meu_data_frame$estad_doenca,
          levels = c("IV", "III", "II", "I"))
meu_data_frame$estad_doenca
str(meu_data_frame)

summary(meu_data_frame) #mostra os niveis tbm
levels(meu_data_frame$estad_doenca)
nlevels(meu_data_frame$estad_doenca)

tabela = table (meu_data_frame$idade,
       meu_data_frame$salario)

#proporção relativa
prop.table(table(meu_data_frame$idade,
                 meu_data_frame$nome),
           margin = 2)

margin.table(tabela, 1) #linha
margin.table(tabela, 2) #coluna

chisq.test(tabela) #quiquadrado
fisher.test(tabela, alternative = "greater")

#LENDO DADOS EXTERNOS

# Lendo os dados de queimadas
Queimadas_Q1 <- read.csv("/home/est/jrs24/CE302/Fire Watch/FireWatch1.csv")
head(Queimadas_Q1)
Queimadas_Q2 <- read.csv("/home/est/jrs24/CE302/Fire Watch/FireWatch2.csv")
Queimadas_Q3 <- read.csv("/home/est/jrs24/CE302/Fire Watch/FireWatch3.csv")
head(Queimadas_Q2)
head(Queimadas_Q3)

dim(Queimadas_Q1)
summary(Queimadas_Q1)
nrow(Queimadas_Q1)

#juntas os bancos
Queimadas = rbind(Queimadas_Q1, Queimadas_Q2, Queimadas_Q3)
dim(Queimadas)
write.csv(Queimadas,"/home/est/jrs24/CE302/Fire Watch/Queimadas.csv" ) #salvar o novo banco, ordem: nome, lugar do pc

#EXERCICIOS: Para os dados de Queimadas faça o que se pede.
#1 Imprima na tela as 9 primeiras observações.
head(Queimadas, 9)

#2 Imprima as últimas 3 observações.
tail(Queimadas, 3)

#3 Quantas observações temos?


#4 Quantas variáveis temos?


#5 Apresente o sumário dos dados.
summary(Queimadas)

#6 Apresente a estrutura dos dados.


#7 Quantos biomas estão sendo afetados?


#8 Qual a média de avg_numero_dias_sem_chuva para os estados da região sul e da região norte?
mean(Queimadas$avg_numero_dias_sem_chuva, estado == "AMAZONAS")













