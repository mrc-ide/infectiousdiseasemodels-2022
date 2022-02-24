## Example 2: Stochastic growth and death model

This model includes births and deaths at per-capita rates \(r\) and \(s\) per week, respectively. The ODE for \(N\) is made up of the difference between the mean growth rate and the mean death rate:

$$ \frac{dN}{dt}=rN-sN $$

The difference \((r-s)\) is the net growth rate and the solution is either exponential growth or decline i.e.,

$$ N(t) =N(0) \exp((r-s)t) $$

If births exceed deaths (\(r > s\)) the population grows. If deaths exceed births (\(s > r\)) the population shrinks.

In the stochastic simulation, we have to be more careful as we are dealing with individuals. Each individual has a probability of reproducing and of dying in some short interval, \(dt\). However, it can’t die and then give birth! These two dependent events that can happen are known as competing hazards. To calculate the number of births and deaths in a short time, we first calculate the number of births or deaths:

$$ \mbox{Births or deaths in }dt, n \sim \mathrm{Binomial}(N,(r + s)dt) $$

We then decide which were births and which deaths:

$$ \mbox{Deaths in }dt \sim \mathrm{Binomial}(s / (r + s),n) $$
