################################################################################
# A basic SEIR model, allowing average time between onset and death and onset and recovery.
# The transmissibility is allowed to change following intervention (day 170).
# 
#   S = # susceptible 
#   E = # latent
#   ID = # infectious - will die
#   IR = # hospitalised - will recover
#   R = # recovered
#   Dead = # dead
#   
#   Fit the model by calibrating the following parameters:
#     - the initial number of cases (seeding the infection) 
#     - the CFR 
#     - the reproduction number before and after intervention 
#   Fit both the weekly incidence curve of onset of symptoms and the 
# weekly incidence curve of death.
################################################################################

################################################################################
### model dynamics
################################################################################

deriv (S) <- - S/N * (beta_r * I_r + 
                        beta_d * I_d)

deriv (E) <- S/N * (beta_r * I_r + 
                      beta_d * I_d) - 
  gamma * E

deriv (I_d) <- cfr * gamma * E - sigma_d * I_d 
deriv (I_r) <- (1 - cfr) * gamma * E - sigma_r * I_r

deriv(R) <- sigma_r * I_r
deriv(Dead) <- sigma_d * I_d

deriv(cumul_onset) <-  gamma * E
cumul_death_h <- Dead

### create delayed variables in order to compute non cumulative (weekly) 
### incidence and deaths variables
cumul_onset_delayed <- delay(cumul_onset, 7) # 7 for weekly delay
cumul_death_h_delayed <- delay(cumul_death_h, 7) # 7 for weekly delay
output(weekly_onset) <- cumul_onset - cumul_onset_delayed
output(weekly_death_h) <- cumul_death_h - cumul_death_h_delayed

### useful variables to output

Exposed <- E
Infectious <- I_d + I_r 

################################################################################
### initial numbuer of individuals in each compartment
################################################################################

initial(S) <- N
initial(E) <- 0
initial(I_d) <- I0 / 2
initial(I_r) <- I0 / 2
initial(R) <- 0 
initial(Dead) <- 0
initial(cumul_onset) <- 0

################################################################################
### user defined parameters
################################################################################

N <- user(5e+5, min = 0) # population size with default value
I0 <- user(15.31, min = 0) # initial number of infected individuals ### default value was fitted to data
L <- user(9.92, min = 0) # mean latency
mu_d <- user(8.0, min = 0) # time from onset to death in days
mu_r <- user(16.98, min = 0) # mean time from onset to recovery in days
cfr <- user(0.5656, min = 0, max = 1) # case fatality ratio
R0_before <- user(1.58, min = 0) ### default value was fitted to data
# Rt (assumed the same for those who stay in community and
# (1) recover or (2) died 
R0_after <- user(0.80, min = 0) ### default value was fitted to data
t_intervention <- user(170, min = 0) # time of interventions

### compute other parameters from the ones above
gamma <- 1/L
sigma_d <- 1 / mu_d
sigma_r <- 1 / mu_r
beta_r <- Rt / mu_r
beta_d <- Rt / mu_d
Rt <- if (t <= t_intervention) R0_before else R0_after 

### additional things to output
output(Rt) <- TRUE
output(cumul_death_h) <- TRUE



