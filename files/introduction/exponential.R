# variables
deriv(N) <- a * N

# initial conditions of the variables
initial(N) <- N0

# parameter values
N0 <- user(1)             # total population size
a <- user(0.5)            # growth rate

# additional output
output(N_analytical) <- N0*exp(a*t)