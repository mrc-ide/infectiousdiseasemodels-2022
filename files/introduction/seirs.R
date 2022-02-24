# variables
deriv(S) <- Births - b * S - beta * S * I / N + delta * R 
deriv(E) <- beta * S * I / N - (b + gamma) * E
deriv(I) <- gamma * E - (b + sigma + alpha) * I
deriv(R) <- sigma * I - (b + delta) * R

# initial conditions of the variables
initial(S) <- N0 - I0
initial(E) <- 0
initial(I) <- I0
initial(R) <- 0

N <- S + E + I + R
output(pop) <- N

# parameter values
N0 <- user(1e7)           # total population size
I0 <- user(1)             # num infectious cases at start of epidemic
sigma <- user(1)          # recovery rate (1/mean duration infectiousness)
gamma <- user(1)
alpha <- user(0)
delta <- user(0)          # waning antibody rate
b <- user(2.6e-4)         # death rate (average life expectancy of 1 year or 52 weeks)
R0 <- user(5)

Births <- b * N0          # number of births (for a constant population size)
beta <- R0 * ((b + gamma) / gamma) * (b + alpha + sigma)