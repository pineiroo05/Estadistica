load("UniformSamples.RData")

#Hay que recodificar para crear las variables LBx1, LBx2...

#LARRY BIRD
#En este caso todas las columnas q genera nuevas, salen con N/A, pq el dataframe "no esta bien", es decir no tengo los LB1B1 por ej, solo tengo los LB1, LB2...
#Tendria tb q ver si me conviene mas un lapply o mapply

#var lbx -> la x indica la posicion
var_lb1 <- paste0("LB1B", 1:5)
var_lb2 <- paste0("LB2B", 1:5)
var_lb3 <- paste0("LB3B", 1:5)
var_lb4 <- paste0("LB4B", 1:5)
var_lb5 <- paste0("LB5B", 1:5)
#Son las probabilidades de acierto desde cada posicion
probs_lb <- c(0.356, 0.376, 0.369, 0.376, 0.356)

UniformSamples[paste0("LBx1B", 1:5)] <- lapply(
    var_lb1,
    function(v) ifelse(UniformSamples[[v]] <= 0.356, 0, 1)
)

UniformSamples[paste0("LBx2B", 1:5)] <- mapply(
    function(v, p) ifelse(UniformSamples[[v]] <= p, 0, 1),
    v = var_lb2,
    p = probs_lb[2]
)

UniformSamples[paste0("LBx3B", 1:5)] <- mapply(
    function(v, p) ifelse(UniformSamples[[v]] <= p, 0, 1),
    v = var_lb3,
    p = probs_lb[3]
)

UniformSamples[paste0("LBx4B", 1:5)] <- mapply(
    function(v, p) ifelse(UniformSamples[[v]] <= p, 0, 1),
    v = var_lb4,
    p = probs_lb[4]
)

UniformSamples[paste0("LBx5B", 1:5)] <- mapply(
    function(v, p) ifelse(UniformSamples[[v]] <= p, 0, 1),
    v = var_lb5,
    p = probs_lb[5]
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
#UniformSamples$z1 <- with(UniformSamples, LBx1 & LBx2 & LBx3 & LBx4 & LBx5)
#UniformSamples$z2 <- with(UniformSamples, CHx1 & CHx2 & CHx3 & CHx4 & CHx5)
#UniformSamples$z3 <- with(UniformSamples, DBx1 & DBx2 & DBx3 & DBx4 & DBx5)

#UniformSamples$GANADOR <- with(UniformSamples, z1 | z2 | z3)

View(UniformSamples)