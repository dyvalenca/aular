### CARREGAR PACOTES
pacman::p_load(ccaPP, lsa, minerva, Rfast)

### CRIAR FUNÇÃO PARA RODAR VÁRIAS ASSOCIAÇÕES
multi.cor <- function(x, y) {
  c(
    cor = cor(x, y), # Correlação
    MIC = mine (x, y) #  Maximal Information Coefficient
  )
}

### ETL ###
instagram_unifafire <- fread('https://raw.githubusercontent.com/hugoavmedeiros/ciencia_politica_com_r/master/bases_tratadas/instagram_unifafire.csv')

multi.cor(instagram_unifafire$Curtidas, instagram_unifafire$Comentários)



#plot(instagram_unifafire$Curtidas , instagram_unifafire$Comentários) # Plotar o gráfico

