load("dataframe_ej4.2.RData")

#Aqui vendria la recodificacion para crear las variables x de cada jugador. Como en R base no hay recodificar uso una estructura ifeslse
#UniformSamples$x1 <- ifelse(UniformSamples$obs1 <= 0.8, 0, 1), esta sería la primera opcion, pero queda mal pq habria que hacerlo 5 veces # nolint

var <- c("obs1", "obs2", "obs3", "obs4", "obs5")
probs <- c(0.8, 0.9, 0.6, 0.5, 0.7)

UniformSamples[paste0("x", 1:5)]<-mapply(
    function(v, p) ifelse(UniformSamples[[v]] <= p, 0, 1),
    v=var,
    p=probs
)

#Ahora habria q crear las variables z1, z2 y z3
UniformSamples$z1 <- with(UniformSamples, x1 | x2)
UniformSamples$z2 <- with(UniformSamples, x3 | x4)
UniformSamples$z3 <- with(UniformSamples, z1 & z2)
View(UniformSamples)