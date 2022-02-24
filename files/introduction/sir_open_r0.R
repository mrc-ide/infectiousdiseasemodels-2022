# variables
deriv(S) <- Births - b*S - beta * S * I / N 
deriv(I) <- beta * S * I / N - (b+sigma) * I
deriv(R) <- sigma * I - b*R 

# initial conditions of the variables
initial(S) <- N - I0
initial(I) <- I0
initial(R) <- 0

output(pop) <- S + I + R    

# parameter values
N <- 1e6               # total population size
I0 <- user(1)          # num infectious cases at start of epidemic
# beta <- R0*(sigma+b) # transmission parameter
beta <- user(5)
sigma <- user(2)       # recovery rate (1/mean duration infectiousness)
# R0 <- user(5)        # av num new cases caused by single infectious case
b <- 1/52              # death rate (mean life expectancy of 1 year or 52 weeks)
Births <- (S+I+R)*b    # number of births (for a constant population size)
output(R0) <- beta / (sigma + b)

