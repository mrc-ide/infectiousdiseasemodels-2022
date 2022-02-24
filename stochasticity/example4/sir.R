beta <- user(0.5) # contact rate
nu <- user(0.3) # recovery
mu <- user(0.0004) # death rate 
prop_immune <- user(0) # proportion of population initially immune

N <- user(10000)  # total population.
I0 <- user(5) # initial infecteds
S0 <- (N-I0)*(1 - prop_immune) # initial susceptibles

I0_at_steady_state <- user(0)

dt <- 0.01

## Steady-state prevelance
R0 <- beta/( nu + mu )
I_star <- N*mu*(beta - nu - mu)/(beta*(mu + nu)) # SIR: new definition of number of infecteds at endemic equilibrium state
S_star <- N/R0 # SIR: new definition of number of susceptibles at endemic equilibrium state

## Stochastic solution
initial(S) <- if (I0_at_steady_state > 0) round(S_star) else S0
initial(I) <- if (I0_at_steady_state > 0) round(I_star) else I0
initial(R) <- if (I0_at_steady_state > 0) N - round(I_star) - round(S_star) else N - I0 - S0

FOI <- beta * I / N 

n_events_S <- rbinom(S, (FOI + mu)*dt) # SIR: two types of events for S, so competing hazards. 
n_deaths_S <- rbinom(n_events_S, mu/(FOI + mu)) # SIR: a fraction of S events are deaths. 
n_infections_S <- n_events_S - n_deaths_S	# SIR: ...the rest are infections. 

n_events_I <- rbinom(I, (nu+mu)*dt ) # SIR: two types of events for I, so competing hazards.
n_deaths_I <- rbinom(n_events_I, mu/(mu + nu)) # SIR: a fraction of I events are deaths.
n_recoveries_I <- n_events_I - n_deaths_I # SIR: ...the rest are recoveries. 

n_deaths_R <- rbinom(R, mu*dt)
n_births <- n_deaths_S + n_deaths_I + n_deaths_R

# update for next time step
update(S) <- S - n_deaths_S - n_infections_S + n_births
update(I) <- I + n_infections_S - n_recoveries_I - n_deaths_I
update(R) <- R + n_recoveries_I - n_deaths_R

output(extinct) <- I == 0
