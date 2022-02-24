r <- user(0.1) # growth rate
N0 <- user(1)  # initial population.

dt <- 0.01
time <- step * dt

## Deterministic solution
output(N_det) <- N0 * exp(r*time)

## Stochastic solution
initial(N_stoch) <- N0

n_birth <- rbinom(N_stoch, r * dt)

update(N_stoch) <- N_stoch + n_birth
output(time) <- TRUE
