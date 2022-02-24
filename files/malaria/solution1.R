initial(Xh) <- 99
initial(Yh) <- 1
initial(Xv) <- 1000
initial(Yv) <- 0

deriv(Xh) = -(V / H) * a * bh * (Yv / V) * Xh+r * Yh
deriv(Yh) = (V / H) * a * bh * (Yv / V) * Xh-r * Yh
deriv(Xv) = muv * V-a * bv * (Yh / H) * Xv - muv * Xv
deriv(Yv) = a * bv * (Yh / H) * Xv - muv * Yv

H <- Xh + Yh
V <- Xv + Yv

a <- user(0.33)
bh <- user(0.2)
r <- user(0.02)
bv <- user(0.05)
muv <- user(0.1)

hostprev2 <- (100 * Yh / H)
vectorprev2 <- (100 * Yv / (Xv + Yv))
R02 <- (V / H) * (a^2) * bv * bh / (muv * r)
VC2 <- (V / H) * (a^2) * bv * bh / (muv)
EIR2 <- (V / H) * a * (Yv / (Xv + Yv)) * 365 

output(hostprev) <- hostprev2
output(vectorprev) <- vectorprev2
output(EIR) <- EIR2
output(VC) <- VC2
output(R0) <- R02