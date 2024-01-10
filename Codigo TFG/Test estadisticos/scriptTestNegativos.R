# Cargar el archivo CSV
datos <- read.csv("C:\\Users\\Usuario\\Desktop\\negativos.csv")

# Ver las primeras filas del conjunto de datos
head(datos)

# Resumen estadístico
summary(datos)

# Realizar el t-test independiente
resultado_t_test <- t.test(VALOR ~ GRUPO, data = datos)

# Ver los resultados
print(resultado_t_test)

