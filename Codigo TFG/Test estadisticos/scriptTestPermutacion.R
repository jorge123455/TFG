library(R.matlab)
library(rgl)

ruta_archivo1 <- "C:\\Users\\Usuario\\Desktop\\TFG\\matlab\\Scripts\\region_ventriculo_CN_SyMNet.mat"
datos_mat1 <- readMat(ruta_archivo1)

ruta_archivo2 <- "C:\\Users\\Usuario\\Desktop\\TFG\\matlab\\Scripts\\region_ventriculo_MCI_SyMNet.mat"
datos_mat2 <- readMat(ruta_archivo2)

valoresJacCN <- datos_mat1$SyMNet.ventriculo.CN
valoresJacMCI <- datos_mat2$SyMNet.ventriculo.MCI

combinacion <- c(valoresJacCN, valoresJacMCI)

# Crear una matriz o arreglo para almacenar los valores p
p_values <- array(NA, dim = c(77, 113, 42, 99))

# Iterar a través de los voxels
for (j in 1:99) {
  permutacion <- sample(combinacion)
  
  valores_MCI <- permutacion[1:286]
  valores_CN <- permutacion[287:515]
  for (x in 1:77) {
    for (y in 1:113) {
      for (z in 1:42) {
        # Extraer los valores para el voxel actual en las imágenes sanas y enfermas
        
        valores_pixel_CN <- array(NA, dim = c(229))
        valores_pixel_MCI <- array(NA, dim = c(286))
        
        for (i in 1:229) {
          normal_values <- valores_CN[[i]]
          normal_values <- normal_values[[1]]
          imagen <- normal_values[[1]]
          valores_pixel_CN[i] <- imagen[x,y,z]
        }
        
        for (i in 1:286) {
          normal_values <- valores_MCI[[i]]
          normal_values <- normal_values[[1]]
          imagen <- normal_values[[1]]
          valores_pixel_MCI[i] <- imagen[x,y,z]
        }
        
        # Realizar la prueba t
        t_result <- t.test(valores_pixel_CN, valores_pixel_MCI)
        
        # Obtener el valor p de la prueba t
        p_value <- t_result$p.value
        
        # Almacenar el valor p en el arreglo de valores p
        p_values[x, y, z, j] <- p_value
      }
    }
  }
}


+#plot3d(p_values, type = "s", col = "blue")

writeMat("C:\\Users\\Usuario\\Desktop\\TFG\\matlab\\Scripts\\pValores_CN_MCI_ventriculo_SyMNet_exf_permutacion.mat", p_values = p_values)
