datos = read.csv("C:\\Users\\Usuario\\Downloads\\test.csv")

#independencia superviviente, sexo
tabla_sup_sexo = table(datos$grupo, datos$genero)

print(tabla_sup_sexo)

chi_sup_sexo = chisq.test(tabla_sup_sexo)
print(chi_sup_sexo$observed)
print(chi_sup_sexo$expected)
print(chi_sup_sexo)
