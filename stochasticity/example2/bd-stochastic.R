r <- user(0.1) # Growth rate
s <- user(0.06) # Death rate
N0 <- user(1) # Initial number

dt <- 0.01 
time <- step * dt

# Exact implementation - often unobtainable for non-linear models
output(N_det) <- N0 * exp((r-s)*time)

# Stochastic implementation with initial condition, number of births in time t to t+dt and then update to next step

initial(N) <- N0

growthAndDeath <- rbinom(N, (r+s)*dt) # How many events happen in total (births and deaths)?
death <- rbinom(growthAndDeath, s/(r+s)) # How many of these were deaths?
growth <- growthAndDeath - death

update(N) <- N + growth - death

output(extinct) <- N == 0
