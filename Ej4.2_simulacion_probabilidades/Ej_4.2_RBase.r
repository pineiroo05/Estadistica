load("dataframe_ej4.2.RData")

#Aqui vendria la recodificacion para crear las variables x de cada jugador. Como en R base no hay recodificar uso una estructura ifeslse
UniformSamples$x1 <- ifelse(UniformSamples$obs1 <= 0.8, 0, 1)
UniformSamples$x2 <- ifelse(UniformSamples$obs2 <= 0.9, 0, 1)
UniformSamples$x3 <- ifelse(UniformSamples$obs3 <= 0.6, 0, 1)
UniformSamples$x4 <- ifelse(UniformSamples$obs4 <= 0.5, 0, 1)
UniformSamples$x5 <- ifelse(UniformSamples$obs5 <= 0.7, 0, 1)

#Ahora habria q crear las variables z1, z2 y z3
UniformSamples$z1 <- with(UniformSamples, x1 | x2)
UniformSamples$z2 <- with(UniformSamples, x3 | x4)
UniformSamples$z3 <- with(UniformSamples, z1 & z2)
View(UniformSamples)
