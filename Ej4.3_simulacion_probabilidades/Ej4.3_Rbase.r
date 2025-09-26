load("UniformSamples.RData")

#Hay que recodificar para crear las variables LBx1, LBx2...

#LARRY BIRD
var_lb <- c("LB1", "LB2", "LB3", "LB4", "LB5")
probs_lb <- c(0.356, 0.376, 0.369, 0.376, 0.356)

UniformSamples[paste0("LBx", 1:5)] <- mapply(
    function(v, p) ifelse(UniformSamples[[v]] <= p, 0, 1),
    v = var_lb,
    p = probs_lb
)

#CRAIG HODGES
var_ch <- c("CH1", "CH2", "CH3", "CH4", "CH5")
probs_ch <- c(0.364, 0.4, 0.405, 0.4, 0.364)

UniformSamples[paste0("CHx", 1:5)] <- mapply(
    function(v, p) ifelse(UniformSamples[[v]] <= p, 0, 1),
    v = var_ch,
    p = probs_ch
)

#DEVIN BOOKER
var_db <- c("DB1", "DB2", "DB3", "DB4", "DB5")
probs_db <- c(0.329, 0.357, 0.385, 0.357, 0.329)

UniformSamples[paste0("DBx", 1:5)] <- mapply(
    function(v, p) ifelse(UniformSamples[[v]] <= p, 0,1),
    v = var_db,
    p = probs_db
)

#Ahora las z
UniformSamples$z1 <- with(UniformSamples, LBx1 & LBx2 & LBx3 & LBx4 & LBx5)
UniformSamples$z2 <- with(UniformSamples, CHx1 & CHx2 & CHx3 & CHx4 & CHx5)
UniformSamples$z3 <- with(UniformSamples, DBx1 & DBx2 & DBx3 & DBx4 & DBx5)

UniformSamples$z4 <- with(UniformSamples, z1 | z2 | z3)

View(UniformSamples)