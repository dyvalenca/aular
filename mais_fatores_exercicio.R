# Importando Bibliotecas
library(ade4)
library(arules)
library(forcats)

# Importando Base
base_facebook <- read.table("https://raw.githubusercontent.com/hugoavmedeiros/ciencia_politica_com_r/master/bases_originais/dataset_Facebook.csv", 
  sep=";", 
  header = T)

mean(base_facebook$like, na.rm = TRUE)
median(base_facebook$like, na.rm = TRUE)
boxplot(base_facebook$like)
summary(base_facebook$like)

# conversão em fatores
for(i in 2:7) {
  base_facebook[,i] <- as.factor(base_facebook[,i]) } 

BasefactorsFacebook <- unlist(lapply(base_facebook, is.factor))  
BasefacebookFactor <- facebook[ , BasefactorsFacebook]

facebookDummy <- acm.disjonctif(BasefacebookFactor)

# Unindo as duas ''tabelas'' como se fosse um join.
facebook2 = cbind(
  base_facebook,
  facebookDummy
)

# Analise usando plot
plot(base_facebook$Lifetime.Post.Total.Reach, base_facebook$Paid.1)

# Discretização
BaseinteirosFacebook <- unlist(lapply(base_facebook, is.integer))  
BaseinteirosFacebook <- base_facebook[, BaseinteirosFacebook]

BaseinteirosFacebook$Page.total.likes.Disc <- discretize(BaseinteirosFacebook$Page.total.likes, method = "interval", breaks = 3, labels = c("poucos", 'médio', 'muitos'))

fct_count(BasefacebookFactor$Type) # conta os fatores

fct_anon(BasefacebookFactor$Type) # anonimiza os fatores

fct_lump(BasefacebookFactor$Type, n = 1) 