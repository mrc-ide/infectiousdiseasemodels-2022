## Example 3: Stochastic SIS model

In the next example we consider a model of infection transmission within a closed popluation (no births or deaths): the susceptible-infected-susceptible (SIS) model.

In this model we consider two types of event:
	Infection events, which occur in each time step with probability $((\beta  I dt)/N\)$ per susceptible individual, and
	Recovery events, which occur in each time step with a probability $(\nu  dt\)$ per infected individual.

The ODE representation of the model is:

$$\frac{dS}{dt}=-\beta \frac{SI}{N}+\nu I$$
$$\frac{dI}{dt}=\beta \frac{SI}{N}-\nu I$$

The analytical solution to this ODE can be shown to be:

$$I(t)=I \frac{1}{1+(I⁄I_0 -1)\exp(-(\beta -\nu )t)}$$

where $I_0$ is the initial number of infected individuals and $I^*=N(1-\nu / \beta )$. After sufficient time, the infection and recovery processes balance each other out. This occurs when the number of infectious individuals reaches its equilibrium value $I^*$. We can write the equilibrium value as

$$I^*= N \left(1-\frac{1}{R_0} \right)$$

since \(R_0\) is defined as \(\beta ⁄\nu \). At this point, we say that the disease is endemic in the population.
