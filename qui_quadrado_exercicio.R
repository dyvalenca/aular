## QUI-QUADRADO COM R ##
# PRIMEIRO, VAMOS CARREGAR OS PACOTES
pacman::p_load(data.table, ggplot2)

### ETL ###
instagram_unifafire <- fread('https://raw.githubusercontent.com/hugoavmedeiros/ciencia_politica_com_r/master/bases_tratadas/instagram_unifafire.csv')

# TABELA DE CONTINGÊNCIA #
instagram_unifafire_table <- table(instagram_unifafire$turno, instagram_unifafire$mes)

ggplot(instagram_unifafire) + aes(x = turno, fill = mes) + geom_bar(position = "fill")

# TESTE QUI QUADRADO #
instagram_unifafire_table_test <- chisq.test(instagram_unifafire_table)

# CORRPLOT DAS VARIÁVEIS #
corrplot(instagram_unifafire_table_test$residuals, is.cor = FALSE)
 