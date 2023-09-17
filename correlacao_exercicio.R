## CORRELAÇÃO COM R ##
# PRIMEIRO, VAMOS CARREGAR OS PACOTES
pacman::p_load(corrplot, dplyr, ggplot2)

### ETL ###
instagram_unifafire <- fread('https://raw.githubusercontent.com/hugoavmedeiros/ciencia_politica_com_r/master/bases_tratadas/instagram_unifafire.csv')

# Ver estrutura dos dados
# str(instagram_unifafire)

instagram_unifafire2 <- instagram_unifafire %>% select(c(Curtidas,Comentários))

str(instagram_unifafire2)

# TABELA DE CORRELAÇÃO COM TODAS AS VARIÁVEIS #
cor(instagram_unifafire2)

# GRÁFICOS DE DISPERSÃO PAREADOS DAS VARIÁVEIS #
pairs(instagram_unifafire2)

# CORRPLOT DAS VARIÁVEIS #
# Tabela de correlação
instagram_unifafireCor <- cor(instagram_unifafire2)

#  
corrplot(instagram_unifafireCor, method = "number", order = 'alphabet')

#
corrplot(instagram_unifafireCor, method = "square", order = 'AOE')


#
corrplot(instagram_unifafireCor, order = 'alphabet') 
