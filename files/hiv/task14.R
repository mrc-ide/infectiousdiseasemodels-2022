##Differential equations

deriv(S_f) <- g*B/2-beta_mtof*S_f*I_m/N_m-mu*S_f
deriv(S_m) <- g*B/2-beta_ftom*S_m*I_f/N_f-mu*S_m

deriv(I_f) <- beta_mtof*S_f*I_m/N_m-mu*I_f-nu*I_f
deriv(I_m) <- beta_ftom*S_m*I_f/N_f-mu*I_m-nu*I_m

deriv(P_f) <- (1-g)*B/2-mu*P_f
deriv(P_m) <- (1-g)*B/2-mu*P_m

##Initial conditions

initial(S_f) <- g*init_susc/2
initial(S_m) <- g*init_susc/2

initial(I_f) <- 5
initial(I_m) <- 5

initial(P_f) <- (1-g)*init_susc/2
initial(P_m) <- (1-g)*init_susc/2

init_susc <- 990

##Other equations

N_f <- S_f+I_f+P_f
N_m <- S_m+I_m+P_m
N_tot <- N_f+N_m

beta_mtof <- kappa_mtof*c_f
beta_ftom <- kappa_ftom*c_m

B <- alpha*N_tot 	#entry rate, exponentially growing population
#B <- mu*N+nu*I	#entry rate, constant population size - useful for model checking

c_f <- c_m*(S_m+I_m)/(S_f+I_f) #calculating partner change rate for females at each time-step, ensuring partnerships balance

##Parameter values

g <- user(0.4)		#proportion at-risk (in S class)
#c_f <-user(11)		#partner change rate, females
c_m <-user(11)		#partner change rate, males
kappa_mtof <- user(0.1)  	#per partner HIV transmission probability, male to female
kappa_ftom <- user(0.1)  	#per partner HIV transmission probability, female to male
nu <- user(0.0833)            #mortality rate per person per year due to HIV/AIDS (1/mean duration in years)		
mu <- user(0.0152)      #crude mortality rate due to causes other than AIDS, scaled to rate per person
alpha <-user(0.0374)    #birth rate scaled to per person

##Additional output

output(prevalence_f) <- I_f/N_f
output(prevalence_m) <- I_m/N_m
output(prevalence_tot) <- (I_f+I_m)/N_tot
output(incidence_f) <- beta_mtof*S_f*I_m/N_m
output(incidence_m) <- beta_ftom*S_m*I_f/N_f
output(incidence_tot) <- (beta_mtof*S_f*I_m/N_m)+(beta_ftom*S_m*I_f/N_f)
output(incidence_rate_f) <- (beta_mtof*S_f*I_m/N_m)/(S_f+P_f)
output(incidence_rate_m) <- (beta_ftom*S_m*I_f/N_f)/(S_m+P_m)
output(incidence_rate_tot) <- ((beta_mtof*S_f*I_m/N_m)+(beta_ftom*S_m*I_f/N_f))/(S_f+P_f+S_m+P_m)
output(partnerships_f) <- c_f*(S_f+I_f)
output(partnerships_m) <- c_m*(S_m+I_m)