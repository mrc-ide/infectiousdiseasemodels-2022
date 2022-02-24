## Example 1: Deterministic and stochastic growth model

This is a simple simulation of a birth process. Each individual has a birth rate (births per unit time), \(r\). In a short time, \(dt\), we would expect \(r \times dt\) new births for each individual. Thus, in a population of size \(N\) there will be \(rNdt\) births. So the ODE equation for change in population size is

$$ \frac{dN}{dt}  = rN $$

where \(r\) is the growth rate per individual per unit time. The solution of this equation is exponential growth i.e.

$$ N(t) = N(0) e^{rt}$$

where \(N(0)\) is the initial population at time \(t = 0\).

For a stochastic simulation, the probability that an individual gives birth in a short time, \(dt\), is given by \(r dt \). The same probability applies to each of the \( N \) individuals. Hence the number of new births will be binomially distributed:

$$ \mbox{births in time } dt \sim \mathrm{Binomial}(N, rdt) $$
