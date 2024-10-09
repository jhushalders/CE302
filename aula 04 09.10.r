#AULA 4 9/10
library(tidyverse)
dplyr::filter() #chamando uma função
dplyr:::filter() #funções escondidas

dados <- readr::read_csv("/home/est/jrs24/CE302/AULA 04/Mental Health Dataset.csv") #chamando dados

class(dados)
head(dados)
glimpse(dados) #resumo dados
Poland = subset(dados, Country =="Poland") #filtrar dados
Poland
dados [, c("Country", "Gender")] #escolhendo colunas

#OPERADOR PIPE
x <- c(1:10)
y = sqrt (x)
z = log (y)
z
#OU
log(cos(log(sqrt(x))))
#OU OPERADOR PIPE |>
x %>%
  sqrt()%>%
  log()%>%
  cos()

require(magrittr) #carrega o pipe
set.seed(123)

rnorm(10)    %>%
  multiply_by(5) %>%
  add(5)  

#pode usar as operações entre ''
set.seed(123)

rnorm(10) %>%
  `*`(5) %>%
  `+`(5)


require(dplyr)
## Atribuição explicita %<>%
meu_data_frame <- data.frame(
  nome = c("Alice", "Bob", "Carol", "Ana", "João", "Carlos", "Patrícia", "Leonardo"),
  idade = c(25, 30, 28, 20, 27, 50, 60, 45),
  salario = c(5000, 6000, 5500, 8000, 2000, 3500, 10000, 3800 ), 
  meio_de_transporte = c('onibus', 'bicicleta', 'onibus', 'carro', 'carro', 'onibus', 'onibus', 'bicicleta'))

meu_data_frame = meu_data_frame %>% 
  mutate(idade_25 = idade > 25)

glimpse(meu_data_frame)

## Atribuição implicita
meu_data_frame %<>% #recebe os mesmos dados 
  mutate(idade_50 = idade > 50)
glimpse(meu_data_frame)


#MANIPULAÇÃO DE DADOS
require(data.table)
require(dplyr)
require(tidyr)
installed.packages()
car_crash = fread("/home/est/jrs24/CE302/AULA 04/Brazil Total highway crashes 2010 - 2023.csv") # Dados extraídos de https://www.kaggle.com/datasets/liamarguedas/brazil-total-highway-crashes-2010-2023

glimpse(car_crash)


#mostrar algumas colunas
car_crash %>% 
  select(data, tipo_de_acidente) %>% 
  head()
#por posição
car_crash%>%
  select(c(1:4, 9))
#tirar coluna
car_cras%>%
  select (-onibus)
car_crash%>%
  select(-c(onibus, moto))

#coluna que começa com certa palavra
car_crash %>% 
  select(starts_with("tra")) %>% 
  head()

#coluna que termina com certa palavra
car_crash %>% 
  select(ends_with("feridos")) %>% 
  head()

#coluna que contem certa palavra
car_crash %>% 
  select(contains("mente")) %>% 
  head()

#Selecionar apenas variáveis numéricas
car_crash %>% 
  select(where(is.numeric)) %>% 
  glimpse()
#characters
car_crash %>% 
  select(where(is.character)) %>% 
  glimpse()

#variavel logica
car_crash %>% 
  select(where(is.logical)) %>% 
  glimpse()

#seleção por criterio
vars_interesse = c("automovel", "bicicleta", "onibus") #tem que estar do banco de dados
car_crash %>% 
  select(all_of(vars_interesse)) %>% 
  glimpse()

vars_interesse2 = c("automovel", "bicicleta", "onibus", "trator") #nao precisa ter no banco
car_crash %>% 
  select(any_of(vars_interesse2)) %>% 
  glimpse()

#filtrar dados com operadores
dados_filtrados <- car_crash %>%
  filter(automovel >= 3)
dados_filtrados
 #&END |OR
dados_filtrados <- car_crash %>%
  filter(automovel >= 3 & caminhao > 2) #& poder ser escondido, colocar , no lugar
dados_filtrados

dados_filtrados2 <- car_crash %>%
  filter(automovel >= 3 | caminhao > 2)
dados_filtrados2

#dados entre certos valores
dados_filtrados <- car_crash %>%
  filter(between(moto, lower = 4, upper = 8, incbounds = TRUE)) 
dados_filtrados

#A função %in% é usada para filtrar valores que correspondem a um conjunto de valores.
autopistas = c("Autopista Regis Bittencourt", "Autopista Litoral Sul", "Via Sul")

dados_filtrados <- car_crash %>%
  filter(lugar_acidente %in% autopistas) 
dados_filtrados

#Podemos estar interessados nas autopistas que não são operadas pelas mesmas operadoras
`%ni%` <- Negate(`%in%`)

dados_filtrados <- car_crash %>%
  filter(lugar_acidente %ni% autopistas) 
dados_filtrados
#OU
car_crash %>%
  filter(!(lugar_acidente %in% autopistas))

#podemos utilizar o operador %like% que busca padrões
car_crash %>% 
  filter(tipo_de_ocorrencia %like% "com vítima")

#PADRÕES DE TEXTO
car_crash %>% 
  filter(grepl("ilesa|fatal", tipo_de_ocorrencia))


















