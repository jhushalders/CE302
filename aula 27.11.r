#AULA 27/11
require(tidyverse)
require(magrittr)
Files = list.files("filmes")

#juntando os bancos de dados
Files = list()
for (i in 1:length(files)) {
 Files[[i]] = data.table::fread(paste0("filmes/", files[i])) %>%
   mutate(year = as.numeric(year)) %>%
   mutate(tipo = stringr::str_remove(files[i], ".csv"))
}

Files %<>% bind_rows()

#Gráfico de dispersão  

Files %>% # Carregar o banco
  ggplot() + ## Chamar o ggplot
  aes( x = year, 
       y = `gross(in $)`,
       color = tipo,
       size = year) + ## aplicar a estética, isto é, quais são as variáveis e o que elas significam, x e y, neste caso
  geom_point(alpha = 0.2) +# Fazer o scatterplot
  scale_size_continuous(range = c(0,2)) +
  theme_minimal () + 
  facet_wrap(vars(tipo), scales = "free_y")


Files %>% # Carregar o banco
  filter(tipo%in%"thriller") %>%
  ggplot() + ## Chamar o ggplot
  aes( x = year, 
       y = `gross(in $)`,
       color = tipo,
       size = year) + ## aplicar a estética, isto é, quais são as variáveis e o que elas significam, x e y, neste caso
  geom_point(alpha = 0.2) +# Fazer o scatterplot
  geom_smooth(method = "loess")+
  scale_size_continuous(range = c(0,2)) +
  theme_minimal () + 
  labs(x="Ano", y = "Faturamento", size = "Ano", color = "filme") + 
  theme(legend.position = "bottom",
        text = element_text(size=15))

#Gráfico de barras

Files %>% 
  group_by(year, tipo) %>% 
  summarise(Valor_Gasto_Medio = mean(`gross(in $)`, na.rm = TRUE)) %>%
  ggplot() +
  aes( x = year, 
       y = Valor_Gasto_Medio, 
       color = tipo,
       size = year) + 
  geom_line(alpha=0.2) + 
  geom_point()
  facet_wrap(vars(tipo)) + 
  theme_minimal()
  
#COMUNICAÇÃO

  


  
  
  
  
  
  
  
  
  
  
  
  
  
