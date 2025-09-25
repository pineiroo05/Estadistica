load("UniformSamples.RData")

#Hay que recodificar para crear las variables LBx1, LBx2...

#LARRY BIRD
UniformSamples$LBx1 <- ifelse(UniformSamples$LB1 <= 0.356, 0, 1)
UniformSamples$LBx2 <- ifelse(UniformSamples$LB2 <= 0.376, 0, 1)
UniformSamples$LBx3 <- ifelse(UniformSamples$LB3 <= 0.369, 0, 1)
UniformSamples$LBx4 <- ifelse(UniformSamples$LB4 <= 0.376, 0 ,1)
UniformSamples$LBx5 <- ifelse(UniformSamples$LB5 <= 0.356, 0, 1)

#CRAIG HODGES
UniformSamples$CHx1 <- ifelse(UniformSamples$CH1 <= 0.364, 0, 1)
UniformSamples$CHx2 <- ifelse(UniformSamples$CH2 <= 0.4, 0, 1)
UniformSamples$CHx3 <- ifelse(UniformSamples$CH3 <= 0.405, 0, 1)
UniformSamples$CHx4 <- ifelse(UniformSamples$CH4 <= 0.4, 0, 1)
UniformSamples$CHx5 <- ifelse(UniformSamples$CH5 <= 0.364, 0, 1)

#DEVIN BOOKER
UniformSamples$DBx1 <- ifelse(UniformSamples$DB1 <= 0.329, 0, 1)
UniformSamples$DBx2 <- ifelse(UniformSamples$DB2 <= 0.357, 0, 1)
UniformSamples$DBx3 <- ifelse(UniformSamples$DB3 <= 0.385, 0, 1)
UniformSamples$DBx4 <- ifelse(UniformSamples$DB4 <= 0.357, 0, 1)
UniformSamples$DBx5 <- ifelse(UniformSamples$DB5 <= 0.329, 0, 1)

#Ahora las z
UniformSamples$z1 <- with(UniformSamples, LBx1 & LBx2 & LBx3 & LBx4 & LBx5)
UniformSamples$z2 <- with(UniformSamples, CHx1 & CHx2 & CHx3 & CHx4 & CHx5)
UniformSamples$z3 <- with(UniformSamples, DBx1 & DBx2 & DBx3 & DBx4 & DBx5)

UniformSamples$z4 <- with(UniformSamples, z1 | z2 | z3)

View(UniformSamples)