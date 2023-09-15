## Carregar pacotes que serão usados
pacman::p_load(dplyr, ggplot2)

# Gráfico de Caixas Univariado
iris %>% ggplot(aes(y = Sepal.Length)) + geom_boxplot()

# Gráfico de Caixas Multivariado
iris %>% ggplot(aes(y = Sepal.Length, x = Species)) + geom_boxplot()

# Histograma

iris %>% ggplot(aes(x = Sepal.Length)) + geom_histogram()

# Densidade

iris %>% ggplot(aes(x = Sepal.Length)) + geom_density()

## Leitura Dados dos jogos do Corinthians em seu estádio

pacman::p_load(
  #ETL
  data.table, dplyr, lubridate, tidyr,
  # Gráficos
  GGally, ggcorrplot, ggplot2, gt, gtExtras, gtsummary, plotly, 
  # Renderização
  kableExtra
)

planilha_corinthians <- fread('https://docs.google.com/spreadsheets/d/e/2PACX-1vQ3nISFGwr857_nWFhkppH_D8fMwQ35o3s_WxbBKRfI-6ToiT78aVVirU1VPf2ilRv8Qlh6xRBPOY1e/pub?gid=0&single=true&output=csv')


# Séries Temporais
planilha_corinthians %>% group_by(ANO) %>% summarise(Valor = sum(`GOLS PRO`)) %>% ggplot(aes(x = ANO, y = Valor)) + geom_line()

# Barras
planilha_corinthians %>% ggplot(aes(x = ANO, y = RENDA)) + geom_bar(stat = "identity")

# Dispersão
planilha_corinthians %>% ggplot(aes(x = ANO, y = PUBLICO)) + geom_point()
