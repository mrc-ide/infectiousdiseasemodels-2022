deriv(W)<-ABR * ((deltaH0 + deltaHinfinity * cHinfinity * ABR * L)/(1 + cHinfinity * ABR * L)) * L - (sigmaW + muH) * W

deriv(M)<-((1/2) * phi * F) * W - (sigmaM + muH) * M

deriv(L)<-beta * (deltaV0/(1 + cV * M)) * M - (sigmaL + muV + alphaV * M + (aH/g)) * L

initial(W) <- 10
initial(M) <- 0
initial(L) <- 0

deltaH0 <- aH*sH
aH <- 0.8
sH <- 0.2
deltaHinfinity <- 0.0032
cHinfinity <- 0.0137
ABR <- user(15000)
sigmaW <- 0.1
muH <- 0.02
phi <- 1
F <- 0.6674
sigmaM <- 0.8
beta <- h/g
h <- user(0.3)
g <- 0.0096
deltaV0 <- aV*sV0
aV <- (0.4481)
sV0 <- (0.0463)
cV <- aV*c
c <- (0.0196)
sigmaL <- user(104)
muV <- user(52)
alphaV <- aV*alpha
alpha <- (0.8653)

P <- 100 * (1 - (1 + M/(k0*M^k1))^(-k0*M^k1))

k0 <- 0.0553
k1 <- 0.491

ATP <- ABR * L

output(P) <- P
output(ATP) <- ATP

