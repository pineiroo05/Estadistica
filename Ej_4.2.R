#Ejercicio 4.2
 
#Muestra de distrib uniforme

UniformSamples <- as.data.frame(matrix(r(Unif(Min=0, Max=1))(200*5), ncol=5))
rownames(UniformSamples) <- paste("sample", 1:200, sep="")
colnames(UniformSamples) <- paste("obs", 1:5, sep="")

#Creamos las x1, x2, x3, x4 y x5 en recodificar

UniformSamples <- within(UniformSamples, {
  x1 <- Recode(obs1, 'lo:0.8 = 0; 0.8:hi = 1', as.factor=FALSE, to.value="=", interval=":", separator=";")
})
UniformSamples <- within(UniformSamples, {
  x2 <- Recode(obs2, 'lo:0.9 = 0; 0.9:hi = 1;', as.factor=FALSE, to.value="=", interval=":", separator=";")
})
UniformSamples <- within(UniformSamples, {
  x3 <- Recode(obs3, 'lo:0.6 = 0; 0.6:hi = 1', as.factor=FALSE, to.value="=", interval=":", separator=";")
})
UniformSamples <- within(UniformSamples, {
  x4 <- Recode(obs4, 'lo:0.5 = 0; 0.5:hi = 1;', as.factor=FALSE, to.value="=", interval=":", separator=";")
})
UniformSamples <- within(UniformSamples, {
  x5 <- Recode(obs4, 'lo:0.7 = 0; 0.7:hi = 1;', as.factor=FALSE, to.value="=", interval=":", separator=";")
})

#Creamos las z1, z2, z3 con calcular nueva variable

UniformSamples$z1 <- with(UniformSamples, x1 | x2)
UniformSamples$z2 <- with(UniformSamples, x3 | x4)
UniformSamples$z3 <- with(UniformSamples, z1 & z2)
UniformSamples$z3 <- with(UniformSamples, z1 & z2)

#El resultado

calcular_frecuencia(df.nominal=UniformSamples[,c("z1", "z2", "z3")], ordenado.frec=FALSE, df.ordinal=NULL, cuantil.p=0.5, 
  iprint = TRUE)

