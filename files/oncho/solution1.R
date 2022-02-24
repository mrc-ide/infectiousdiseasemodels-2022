initial(W) <- 10
initial(M) <- 0
initial(L1) <- 0
initial(L2) <- 0
initial(L3) <- 0

deriv(W) <- ((deltaH0 + deltaHinfinity * CH * ABR * L3)/(1 + CH * ABR * L3)) * ABR * L3 - (sigmaW + muH) * W

deriv(L1) <- (deltaV)/(1 + Cv * M) * beta * M - (nu1 +  muV + alphaV * M) * L1
deriv(L2) <- nu1 * L1 - (nu2 + muV) * L2
deriv(L3) <- nu2 * L2 - (muV + sigmaL + (aH/g)) * L3

deriv(M) <- ((1/2) * phi * F) * W - (sigmaM + muH) * M

LTotal <- L1 + L2 + L3
output(total_L) <- LTotal

deltaHinfinity  <-  0.00299
CH  <-  0.00586
deltaH0  <-  aH*sH
aH <- 0.8
sH <- 0.089


muH  <-  user(0.02)
sigmaW  <-  0.1
sigmaM  <-  0.8
sigmaL  <-  52
phi  <-  1
F  <-  0.6674

deltaV <- 0.0166
Cv <- 0.0205
alphaV <- 0.5968

ABR  <-  user(15000)
beta <- h/g
h <- user(0.7)
g  <-  0.0096
muV  <-  52

nu1 <- 75
nu2 <- 117