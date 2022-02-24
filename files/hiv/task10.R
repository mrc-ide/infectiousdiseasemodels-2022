##Differential equations
  
deriv(S_h) <- g*B-lambda_h*S_h-mu*S_h
deriv(S_l) <- (1-g)*B-lambda_l*S_l-mu*S_l 
deriv(I_h) <- lambda_h*S_h-mu*I_h-nu*I_h
deriv(I_l) <- lambda_l*S_l-mu*I_h-nu*I_l

##Initial conditions

initial(S_h) <- g*init_susc
initial(S_l) <- (1-g)*init_susc
initial(I_h) <- 4
initial(I_l) <- 1
init_susc <- 995

##Other equations

N_h <- S_h+I_h
N_l <- S_l+I_l
N_tot <- S_h+S_l+I_h+I_l

lambda_h <- kappa*c_h*(rho_hh*(I_h/(S_h+I_h))+rho_hl*(I_l/(S_l+I_l)))
lambda_l <- kappa*c_l*(rho_lh*(I_h/(S_h+I_h))+rho_ll*(I_l/(S_l+I_l)))

#random partner selection:

rho_hh <- c_h*(S_h+I_h)/(c_h*(S_h+I_h)+c_l*(S_l+I_l))
rho_hl <- 1-rho_hh
rho_ll <- c_l*(S_l+I_l)/(c_h*(S_h+I_h)+c_l*(S_l+I_l))
rho_lh <- 1-rho_ll

#partner selection varying between random and assortative

#rho_hh <- (1-epsilon)*1+epsilon*(c_h*(S_h+I_h)/(c_h*(S_h+I_h)+c_l*(S_l+I_l)))
#rho_hl <- 1-rho_hh
#rho_ll <- (1-epsilon)*1+epsilon*(c_l*(S_l+I_l)/(c_h*(S_h+I_h)+c_l*(S_l+I_l)))
#rho_lh <- 1-rho_ll

B <- alpha*N_tot 	#entry rate, exponentially growing population
#B <- mu*N_tot+nu*I	#entry rate, constant population size - useful for model checking

##Parameter values

g <- user(0.4)		#proportion at higher risk (in S class)
c_h <-user(11)		#partner change rate - high activity class
c_l <-user(2)		#partner change rate - low activity class
kappa <- user(0.1)  	#per partner HIV transmission probability
#epsilon <- user(0.3)	#extent of mixing between assortative (0) and random (1) 
nu <- user(0.0833)            #mortality rate per person per year due to HIV/AIDS (1/mean duration in years)		
mu <- user(0.0152)      #crude mortality rate due to causes other than AIDS, scaled to rate per person
alpha <-user(0.0374)    #birth rate scaled to per person

##Additional output
output(prevalence_h) <- I_h/N_h
output(prevalence_l) <- I_l/N_l
output(prevalence_tot) <- (I_h+I_l)/N_tot
output(incidence_h) <- lambda_h*S_h
output(incidence_l) <- lambda_l*S_l
output(incidence_tot) <- lambda_h*S_h+lambda_l*S_l
output(incidence_rate_h) <- lambda_h
output(incidence_rate_l) <- lambda_l
output(incidence_rate_tot) <- (lambda_h*S_h+lambda_l*S_l)/(S_h+S_l)