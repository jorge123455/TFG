datos = read.csv("C:\\Users\\Usuario\\Desktop\\TFG\\mediasEdad\\edadesYgrupos.csv")

smk.aov = aov(AGE~prediction, data = datos)
summary(smk.aov)
