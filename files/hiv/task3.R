##Differential equations

deriv(S) <- B -beta*S*I/N - mu*S
deriv(I) <- beta*S*I/N -mu*I -nu*I

##Initial conditions

initial(S) <- 995
initial(I) <- 5

##Other equations

N <- S+I

beta <- kappa*c

B <- alpha*N 	#entry rate, exponentially growing population
#B <- mu*N+nu*I	#entry rate, constant population size - useful for model checking

R0 <- beta/(mu+nu)


##Parameter values

c <-user(2.4)		    #partner change rate
kappa <- user(0.1)  	#per partner HIV transmission probability
nu <- user(0.0833)      #mortality rate per person per year due to HIV/AIDS (1/mean duration in years)		
mu <- user(0.0152)      #crude mortality rate due to causes other than AIDS, scaled to rate per person
alpha <-user(0.0374)    #birth rate scaled to per person

##Additional output

output(prevalence) <- I/N
output(Preveq) <- 1 - 1/R0 #prevalence at equilibrium
output(R0_out) <- beta/(mu+nu)
output(inci) <- (beta*S*I/N)/N

