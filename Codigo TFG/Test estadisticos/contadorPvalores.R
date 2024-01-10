library(R.matlab)
library(rgl)

ruta_archivo1 <- "C:\\Users\\Usuario\\Desktop\\TFG\\matlab\\Scripts\\pValores_CN_MCI_hipocampo_SyMNet_exf.mat"
datos_mat1 <- readMat(ruta_archivo1)

ruta_archivo2 <- "C:\\Users\\Usuario\\Desktop\\TFG\\matlab\\Scripts\\pValores_CN_MCI_hipocampo_SyMNet_exf_permutacion.mat"
datos_mat2 <- readMat(ruta_archivo2)

pValor <- datos_mat1$p.values
pValores <- datos_mat2$p.values

#print(pValor)

contador <- sum(!is.na(pValor) & pValor < 0.05)
print(contador)

mi_array_vacio <- array(data = NA, dim = c(99))

for (i in 1:99) {
  valor <- pValores[ , , , i]
  elemento <- sum(!is.na(valor) & valor < 0.05)
  mi_array_vacio[i] <- elemento
}

print(mi_array_vacio)

mayores <- sum(mi_array_vacio > contador)
menores <- sum(mi_array_vacio < contador)

print(mayores)
print(menores)
