deriv(W) <- ((deltaH0 + deltaHinfinity * cHinfinity * mbeta * L) / (1 + cHinfinity * mbeta * L)) * mbeta * L - (rhoW * W) 

deriv(L) <- beta * theta0 - (rhoL * L)

theta0 <- (deltaV0 / c) * ( 1 - (1 + W/(2*kv))^(-kv) + (1 + (W * (2 - exp(-c * aV * zi))) / (2*kv) )^(-kv) - (1 + (W * (1 - exp(- c * aV * zi))) / (2*kv)) ^(-kv) )

zi <- epsilon / rhoM
rhoW <- sigmaW + muH
rhoM <- sigmaM + muH
rhoL <- sigmaL + muV + aH/g
beta <- h / g

initial(W) <- 10
initial(L) <- 0

deltaHinfinity <- 0.0032
cHinfinity <- 0.0137
deltaH0 <- aH*sH
aH <- 0.8
sH <- 0.2
muH <- 0.02
sigmaW <- 0.1
sigmaM <- 0.8
epsilon <- 0.667

deltaV0 <- 0.043
c <- 0.026
g <- 0.0096
aV <- 0.4481

h <- user (0.3)
sigmaL <- user(104)
muV <- user (52)
kv <- user(0.5)
mbeta <- user (15000)

ATP <- mbeta * L
output(ATP) <- ATP

