load("UniformSamples.RData")

#LARRY BIRD
#var lbx -> la x indica la posicion
var_lb1 <- paste0("LB1B", 1:5)
var_lb2 <- paste0("LB2B", 1:5)
var_lb3 <- paste0("LB3B", 1:5)
var_lb4 <- paste0("LB4B", 1:5)
var_lb5 <- paste0("LB5B", 1:5)
#Son las probabilidades de acierto desde cada posicion
probs_lb <- c(0.356, 0.376, 0.369, 0.376, 0.356)

for (i in 1:5){
    UniformSamples[paste0("LBx", i, "B", 1:5)] <- mapply(
        function(v, p) ifelse(UniformSamples[[v]] <= p, 0, 1),
        v = get(paste0("var_lb", i)),
        p = probs_lb[i]
    )
}

#CRAIG HODGES
var_ch1 <- paste0("CH1B", 1:5)
var_ch2 <- paste0("CH2B", 1:5)
var_ch3 <- paste0("CH3B", 1:5)
var_ch4 <- paste0("CH4B", 1:5)
var_ch5 <- paste0("CH5B", 1:5)
probs_ch <- c(0.364, 0.4, 0.405, 0.4, 0.364)

for (i in 1:5){
    UniformSamples[paste0("CHx", i, "B", 1:5)] <- mapply(
        function(v, p) ifelse (UniformSamples[[v]] <= p, 0, 1),
        v = get(paste0("var_ch", i)),
        p = probs_ch[i]
    )
}

#DEVIN BOOKER
var_db1 <- paste0("DB1B", 1:5)
var_db2 <- paste0("DB2B", 1:5)
var_db3 <- paste0("DB3B", 1:5)
var_db4 <- paste0("DB4B", 1:5)
var_db5 <- paste0("DB5B", 1:5)
probs_db <- c(0.329, 0.357, 0.385, 0.357, 0.329)

for (i in 1:5){
    UniformSamples[paste0("DBx", i, "B", 1:5)] <- mapply(
        function(v, p) ifelse (UniformSamples[[v]] <= p, 0, 1),
        v = get(paste0("var_db", i)),
        p = probs_db[i]
    )
}

#rep con each=5 lo repite 5 veces antes de pasar al sig
cols_lb <- paste0("LBx", rep(1:5, each = 5), "B", rep(1:5, times = 5))
cols_ch <- paste0("CHx", rep(1:5, each = 5), "B", rep(1:5, times = 5))
cols_db <- paste0("DBx", rep(1:5, each = 5), "B", rep(1:5, times = 5))

UniformSamples$z1 <- rowSums(UniformSamples[cols_lb])==25
UniformSamples$z2 <- rowSums(UniformSamples[cols_ch])==25
UniformSamples$z3 <- rowSums(UniformSamples[cols_db])==25

#UniformSamples$z2 <- with(UniformSamples, CHx1B1 & CHx1B2 & CHx1B3 & CHx1B4 & CHx1B5 & CHx2B1 & CHx2B2 & CHx2B3 & CHx2B4 & CHx2B5 & CHx3B1 & CHx3B2 & CHx3B3 & CHx3B4 & CHx3B5 & CHx4B1 & CHx4B2 & CHx4B3 & CHx4B4 & CHx4B5 & CHx5B1 & CHx5B2 & CHx5B3 & CHx5B4 & CHx5B5)
#UniformSamples$z3 <- with(UniformSamples, DBx1B1 & DBx1B2 & DBx1B3 & DBx1B4 & DBx1B5 & DBx2B1 & DBx2B2 & DBx2B3 & DBx2B4 & DBx2B5 & DBx3B1 & DBx3B2 & DBx3B3 & DBx3B4 & DBx3B5 & DBx4B1 & DBx4B2 & DBx4B3 & DBx4B4 & DBx4B5 & DBx5B1 & DBx5B2 & DBx5B3 & DBx5B4 & DBx5B5)

UniformSamples$z4 <- with(UniformSamples, z1 | z2 | z3)

View(UniformSamples)