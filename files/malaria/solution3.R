initial(Xh) <- 99
initial(Yh) <- 1
initial(Xv) <- 1000
initial(Yv) <- 0
initial(Iv) <- 0

deriv(Xh) <- -(V / H) * a * bh * (Yv / V) * Xh + r * Yh
deriv(Yh) <- (V / H) * a * bh * (Yv / V) * Xh - r * Yh
deriv(Xv) <- uv * V - a * bv * (Yh / H) * Xv - uv * Xv
deriv(Iv) <- a * bv * (Yh / H) * Xv - a * bv * (Y_delay) * (X_delay) * exp(-uv * tau) - uv * Iv
deriv(Yv) <- a * bv * (Y_delay) * (X_delay) * exp(-uv * tau)-uv * Yv

H <- Xh + Yh
V <- Xv + Iv + Yv

Ro <- (V / H) * (a^2) * bv * bh * (1 / r) * (1 / uv) * (p^tau)
C <- (V / H) * (a^2) * bv * bh / (uv)
EIR <- (V / H) * a * (Yv / (Xv + Yv))

Y_delay <- delay(Yh / H, tau)
X_delay <- delay(Xv, tau)

a <- user(0.33)
bh <- user(0.2)
r <- user(0.02)
bv <- user(0.05)
uv <- user(0.1)
gamma <- user(0.0833)
tau <- user(12)
p <- user(0.9)

hostprev <- 100 * Yh / H
vectorprev <- 100 * Yv / (Xv + Yv + Iv)

output(hostprev) <- hostprev
output(vectorprev) <- vectorprev