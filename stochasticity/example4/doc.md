## Example 4: Stochastic SIR model

This model investigates the behaviour of a Susceptible-Infected-Recovered (SIR) model. The code to do this in `odin` can be easily adapted from the SIS code.

Compared to the SIS model, the SIR model has one extra compartment, \( R \), representing recovered, immune individuals and four extra events: death of susceptible, infected and recovered individuals at rate \( \mu \), and birth of new susceptibles at rate \( B \). To simplify, in any time period, we can make the number of births equal to the sum of the number of deaths. This keeps the total population constant.

The possible events for the SIR system are therefore:

* Infection (S \( \rightarrow \) I) at rate  \( \beta I / N \)
* Recovery (I \( \rightarrow \) S)  at rate  \( \nu \)
* Death of susceptible (S \( \rightarrow \) ) at rate \( \mu \)
* Death of infected (I \( \rightarrow \) ) at rate \( \mu \)
* Death of recovered (R \( \rightarrow \) ) at rate \( \mu \)
* Births ( \( \rightarrow \) S) at rate \( B = \mu N \)

Note that there are two competing hazards for \( S \) (death and infection) and for \( I \) (death and recovery). For this system,

$$ R_0  = \frac{\beta} { (\mu+\nu) } $$

and the new equilibria are:

$$ S^* = \frac{1} {R_0} $$
$$ I^* = \frac{N \mu} {\beta}  (R_0-1) $$
