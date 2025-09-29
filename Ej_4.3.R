#Ej_4.3

#Muestra de distrib continua

UniformSamples <- as.data.frame(matrix(r(Unif(Min=0, Max=1))(100000*15), ncol=15))
rownames(UniformSamples) <- paste("sample", 1:100000, sep="")
colnames(UniformSamples) <- paste("obs", 1:15, sep="")

#Recodificar para crear las x

#Larry bird

UniformSamples <- within(UniformSamples, {
  LBx1 <- Recode(LB1, 'lo:0.356=0; 0.356:hi=1', as.factor=TRUE, to.value="=", interval=":", 
  separator=";")
})
UniformSamples <- within(UniformSamples, {
  LBx2 <- Recode(LB1, 'lo:0.376=0; 0.376:hi=1', as.factor=TRUE, to.value="=", interval=":", 
  separator=";")
})
UniformSamples <- within(UniformSamples, {
  LBx3 <- Recode(LB1, 'lo:0.396=0; 0.396:hi=1', as.factor=TRUE, to.value="=", interval=":", 
  separator=";")
})
UniformSamples <- within(UniformSamples, {
  LBx4 <- Recode(LB1, 'lo:0.376=0; 0.376:hi=1', as.factor=TRUE, to.value="=", interval=":", 
  separator=";")
})
UniformSamples <- within(UniformSamples, {
  LBx5 <- Recode(LB1, 'lo:0.356=0; 0.356:hi=1', as.factor=TRUE, to.value="=", interval=":", 
  separator=";")
})

#Craig hodges

UniformSamples <- within(UniformSamples, {
  CHx1 <- Recode(CH1, 'lo:0.364=0; 0.364:hi=1', as.factor=TRUE, to.value="=", interval=":", 
  separator=";")
})
UniformSamples <- within(UniformSamples, {
  CHx2 <- Recode(CH2, 'lo:0.4=0; 0.4:hi=1', as.factor=TRUE, to.value="=", interval=":", 
  separator=";")
})
UniformSamples <- within(UniformSamples, {
  CHx3 <- Recode(CH3, 'lo:0.405=0; 0.405:hi=1', as.factor=TRUE, to.value="=", interval=":", 
  separator=";")
})
UniformSamples <- within(UniformSamples, {
  CHx4 <- Recode(CH4, 'lo:0.4=0; 0.4:hi=1', as.factor=TRUE, to.value="=", interval=":", 
  separator=";")
})
UniformSamples <- within(UniformSamples, {
  CHx5 <- Recode(CH5, 'lo:0.364=0; 0.364:hi=1', as.factor=TRUE, to.value="=", interval=":", 
  separator=";")
})

#Debin booker

UniformSamples <- within(UniformSamples, {
  DBx1 <- Recode(DB1, 'lo:0.329=0; 0.329:hi=1', as.factor=TRUE, to.value="=", interval=":", 
  separator=";")
})
UniformSamples <- within(UniformSamples, {
  DBx2 <- Recode(DB2, 'lo:0.357=0; 0.357:hi=1', as.factor=TRUE, to.value="=", interval=":", 
  separator=";")
})
UniformSamples <- within(UniformSamples, {
  DBx3 <- Recode(DB3, 'lo:0.385=0; 0.385:hi=1', as.factor=TRUE, to.value="=", interval=":", 
  separator=";")
})
UniformSamples <- within(UniformSamples, {
  DBx4 <- Recode(DB4, 'lo:0.357=0; 0.357:hi=1', as.factor=TRUE, to.value="=", interval=":", 
  separator=";")
})
UniformSamples <- within(UniformSamples, {
  DBx5 <- Recode(DB5, 'lo:0.329=0; 0.329:hi=1', as.factor=TRUE, to.value="=", interval=":", 
  separator=";")
})

#Calcular las otras variables. Ns si deberia ser con los & en la parte de las variables de los tiradores

UniformSamples$z1<-with(UniformSamples, LB1 & LB2 & LB3 & LB4 & LB5)
UniformSamples$z2<-with(UniformSamples, CH1 & CH2 & CH3 & CH4 & CH5)
UniformSamples$z3<-with(UniformSamples, DB1 & DB2 & DB3 & DB4 & DB5)

UniformSamples$z4<-with(UniformSamples, z1 | z2 | z3)