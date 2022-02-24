# initial conditions
initial(S) <- N - I_0
initial(E) <- 0
initial(I) <- I_0
initial(R) <- 0

# equations
deriv(S) <- -beta * S * I / N
deriv(E) <- beta * S * I / N - gamma * E
deriv(I) <- gamma * E - sigma * I
deriv(R) <- sigma * I

# parameter values
R_0 <- user(1.5)
R_0_closure <- user(1.5)
L <- user(1)
D <- user(1)
I_0 <- 1 
N <- 370

# convert parameters
gamma <- 1 / L
sigma <- 1 / D
beta <- if (t > 18 && t < 25) R_0_closure * sigma else R_0 * sigma

#Output
output(onset) <- if(t == 0) I_0 else gamma*E

