#AULA 5 23/10
require(dplyr)
require(tidyr)
require(data.table)
car_crash = fread ("/home/est/jrs24/CE302/AULA 04/Brazil Total highway crashes 2010 - 2023.csv")

glimpse(car_crash)

car_crash %>%
  select(moto) #coluna

car_crash %>%
  select(moto, automovel, data) %>%
  filter(moto > 2 | automovel == 2)

#tabela
car_crash %>% 
  group_by (tipo_de_ocorrencia) %>%
  summarise(media = mean(automovel, 
                         na.rm = T), #removendo nas
            n = n()) %>%  View #ver quantidade

car_crash %>%
  filter(tipo_de_ocorrencia %in% c("sem vítima", "com vítima")) %>%
  group_by(tipo_de_ocorrencia) %>%
  summarise (media_carros = mean (automovel, na.rm = T),
            medis_motos = mean (moto, na.rm = T),
            mediana_carros = median (automovel, na.rm = T),
            quantil_25 = quantile(automovel, probs = 0.25, na.rm = T),
             n = n()) %>% 
#View
arrange(desc(n))

car_crash %>%
  filter(tipo_de_ocorrencia %in% c("sem vítima", "com vítima") &
           tipo_de_acidente %in% c("Colisão Traseira", "Saida de Pista")) %>%
  group_by (tipo_de_ocorrencia, tipo_de_acidente) %>%
  summarise (media_carros = mean (automovel, na.rm = T),
             medis_motos = mean (moto, na.rm = T),
             mediana_carros = median (automovel, na.rm = T),
             quantil_25 = quantile(automovel, probs = 0.25, na.rm = T),
             n = n()) %>%
  arrange(desc(n))


#EXERCICIOS - Utilizando o banco de dados car_crash, faça o que se pede:
  
#Selecione as variáveis data, tipo_de_ocorrencia, automovel, bicicleta, onibus, caminhao, moto, trator, outros e total.
car_crash = fread ("/home/est/jrs24/CE302/AULA 04/Brazil Total highway crashes 2010 - 2023.csv")
car_crash %>%
  select(data, tipo_de_ocorrencia, automovel, bicicleta, onibus, caminhao, moto, trator, outros, total) %>%
View  
  
#Selecione todas as variáveis que contenham a palavra feridos.
car_crash %>% 
  select(contains("feridos")) %>% 
View

#Selecione todas as variáveis numéricas.
car_crash %>% 
  select(where(is.numeric)) %>%
  View
  
#Selecione todas as variáveis lógicas.
car_crash %>% 
  select(where(is.logical)) %>%
  View

#Selecione todas as variáveis que terminem com a letra o.
car_crash %>% 
  select(ends_with("o")) %>% 
  View
  
#Selecione todas as variáveis que iniciem com a letra t.
car_crash %>% 
  select(starts_with("t")) %>%
  View

#Filtre as observações com pelo menos 5 carros E 3 motos envolvidos no acidente.

#Filtre as observações com pelo menos 5 carros OU 3 motos envolvidos no acidente.

#Filtre as observações com vítimas.

#Filtre as observações com pelo menos 5 carros OU 3 motos envolvidos no acidente E que ocorreram em alguma das seguintes operadoras: “Autopista Regis Bittencourt”, “Autopista Litoral Sul”, “Via Sul”.



#Utilizando o banco de dados starwars faça o que se pede:
starwars
  
#Qual é o número total de espécies únicas presentes? Qual a frequência de indivíduos por espécie?
  
#Calcule a altura média de personagens masculinos e femininos.

#Qual é a média de idade dos personagens de cada espécie para personagens masculinos?
  
#Para cada espécie presente na base de dados, identifique o personagem mais velho e sua idade correspondente.
starwars%>%
  select(name, birth_year, species) %>%
  group_by (species) %>%
  mutate(primeiro_da_especie = min(birth_year, na.rm = T)) %>%
  filter(primeiro_da_especie == birth_year)


#Transformando Strings em Datas
# String representando uma data
data_string <- "2024-10-23"

# Transformando a string em data
data <- as.Date(data_string)

# Exibindo a data
print(data)

#data em formato diferente
data_string <- "23/10/2024"

data <- as.Date(data_string, 
                format = "%d/%m/%Y")
print(data)

#adição e subtração de datas
data <- as.Date("2023-08-21")
data2 <- data + 7  # Adicionando 7 dias
data3 <- data - 1  # Subtraindo 1 dia

#comparação de datas
data1 <- as.Date("2023-08-21")
data2 <- as.Date("2023-08-15")
data1 > data2  # Verifica se data1 é posterior a data2

#Formatação de datas para strings
data <- as.Date("2023-08-21")
data_formatada <- format(data, "%d/%m/%Y")

#Extração de componentes de data (ano, mês, dia), tudo string
data <- as.Date("2023-08-21")
ano <- format(data, "%Y")
mes <- format(data, "%m")
dia <- format(data, "%d")

#Cálculo de diferenças entre datas
data1 <- as.Date("2023-08-21")
data2 <- as.Date("2023-08-15")
diferenca <- difftime(data1, data2, units = "days")  # Diferença em dias
diferenca
diferenca <- difftime(data1, data2, units = "auto", "secs", "mins", "hours", "days", "weeks") #um de cada vez
diferenca

#usando lubridate
require(lubridate)
data_ymd <- ymd("2023-08-21")
data_mdy <- mdy("08-21-2023")
data_dmy <- dmy("21-08-2023")
print(data_ymd)

#operação
data <- ymd("2023-08-21")
data_nova <- data + days(7)  # Adiciona 7 dias
data_anterior <- data - months(2)  # Subtrai 2 meses
print(data_nova)

#Extraindo Informações de Datas
data <- ymd_hms("2023-08-21 15:30:45")
ano <- year(data)
mes <- month(data)
dia <- day(data)
hora <- hour(data)
minuto <- minute(data)
segundo <- second(data)
print(ano)

#Funções de Resumo de Datas
data1 <- ymd("2023-08-21")
data2 <- ymd("2023-08-15")
diferenca_em_dias <- as.numeric(data2 - data1)
diferenca_em_semanas <- as.numeric(weeks(data2 - data1))
print(diferenca_em_dias)

#Fuso horário
# Data original no fuso horário de Nova Iorque
data_ny <- ymd_hms("2023-08-21 12:00:00", tz = "America/New_York")

# Converter para o fuso horário de Londres
data_london <- with_tz(data_ny, tz = "Europe/London")

print(data_ny)
print(data_london)

#Calcular a Diferença de Tempo entre Datas em Fusos Horários Diferentes
# Duas datas em fusos horários diferentes
data_ny <- ymd_hms("2023-08-21 12:00:00", tz = "America/New_York")
data_london <- ymd_hms("2023-08-21 17:00:00", tz = "Europe/London")

# Calcular a diferença de tempo em horas
diferenca_horas <- as.numeric(data_london - data_ny)

print(diferenca_horas)

#Trabalhar com Fusos Horários em Data Frames:
dados <- data.frame(
  nome = c("Evento 1", "Evento 2"),
  data = c(
    ymd_hms("2023-08-21 12:00:00", tz = "America/New_York"),
    ymd_hms("2023-08-21 17:00:00", tz = "Europe/London")
  )
)

# Converter todas as datas para um fuso horário comum, por exemplo, UTC
dados$data_utc <- with_tz(dados$data, tz = "UTC")

print(dados)


car_crash = fread ("/home/est/jrs24/CE302/AULA 04/Brazil Total highway crashes 2010 - 2023.csv")
#Utilizando o banco de dados car_crash formate a coluna data em uma data (dd-mm-yyyy);
car_crash2 = car_crash %>%
  mutate(nova_data= as.data(data, format = "%d/%m/%Y")) %>%
  mutate(novo_horario = hms(horario)) %>%
  mutate(mes = month(nova_data),
         anos = year(nova_data),
         hora = hour(novo_horario))

#Utilizando o banco de dados car_crash formate a coluna horario para o horário do acidente (hh:mm:ss)

#Qual o mês com maior quantidade de acidentes?
car_crash2 %>%
  group_by(mes) %>%
  summarise(total_mes = n()) %>%
  filter(total_mes == max (total_mes))


#Qual ano ocorreram mais acidentes?
  
#Qual horário acontecem menos acidentes?

#Qual a média, desvio padrão, mediana, Q1 e Q3 para a quantidade de indivíduos classificados como levemente feridos por mês/ano?
  
#Quantos acidentes com vítimas fatais aconteceram, por mês/ano, em mediana entre as 6:00am e 11:59am.


#JUNÇÃO DE DADOS
require(nycflights13)
airlines
airports
planes
weather

#chaves primárias, cpf
planes %>% 
  count(tailnum) %>%
  filter(n > 1)

weather %>%
  count(time_hour, origin) %>%
  filter(n > 1)

#criando nova base de dados
flights2 <- flights %>% 
  filter(distance > 2000) %>% 
  select(year, time_hour, origin, dest, tailnum, carrier)
flights2

#LEFT JOIN
#nao dei a cheve, junta pelo o que tem em comum
flights2_airlines = 
  flights2  %>% #base da esquerda
  left_join(., airlines) #base da direita

flights2_airlines = 
  flights2  %>% 
  left_join(., airlines, 
            by = "carrier") #falando minha chave

flights2_airlines = 
  flights2  %>% 
  left_join(., airlines, 
            by = "carrier", "carrier")  #se os nomes são diferentes Ex: cpf, CPF

#RIGHT JOIN
planes_flights = flights2 %>% 
  right_join(planes, by = "tailnum")
View(planes_flights)

#INNER JOIN
origin_flights = flights2 %>% 
  inner_join(airports, by = c("origin"= "faa"))
origin_flights 

origin_flights = flights2 %>% 
  inner_join(airports, join_by(origin == faa))

#FULL JOIN
dest_flights = flights2 %>% 
  full_join(airports, by = c("dest"= "faa"))

dest_flights = flights2 %>% 
  full_join(airports, join_by(dest == faa))

#Junções de Filtragem
airports %>% 
  semi_join(flights2, join_by(faa == origin))

flights %>%
  anti_join(airports, join_by(dest == faa)) %>% 
  distinct(dest)


#Para vôos com atraso superior a 24 horas em flights, verifique as condições climáticas em weather. Há algum padrão? Quais os meses do ano em que você encontra os maiores atrasos?
  
#Encontre os 20 destinos mais comuns e identifique seu aeroporto. Qual a temperatura média (mensal) em Celcius desses lugares? E a precipiração média, em cm?
  
#Inclua uma coluna com a cia aérea na tabela planes. Quantas companhias áreas voaram cada avião naquele ano?
  
#Inclua a latitude e longitude de cada origem destino na tabela flights.















            
            







