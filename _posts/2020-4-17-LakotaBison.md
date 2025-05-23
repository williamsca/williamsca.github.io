---
title: Lakota Hunting Dynamics
categories: Economics
mathjax: true
tags: ['History', 'Differential Equations']
---

When does violence end quickly, and when does it escalate into broader conflict? The competition between Native American tribes over bison hunting grounds during the mid-1800s provides an illustrative example. Lakotas, Crows, Omahas, Poncas, and other groups roamed the plains on horseback, seeking food for the winter and hides to sell to American traders. 

Clashes between the tribes led to cycles of killings and retribution. The dynamic resulted from specific features of their environment. Pekka Hamalainen notes that the tribes "tended to avoid places where they where bound to run into enemies, and some of those places became buffer zones, no-man's lands people entered with caution if at all. That made them veritable animal preserves." These zones were "rich in game, intensely coveted, and hotly disputed."<label for="sn-1" class="margin-toggle sidenote-number"></label><input type="checkbox" id="sn-1" class="margin-toggle"/><span class="sidenote">Hamalainen, Pekka. *Lakota America*. New Haven: Yale University Press, 2019.</span> In short, conflict caused the disputed land to become even more valuable, thus increasing the potential pay-off to the tribe able to claim those lands for themselves.

I present a toy model of the conflict over bison hunting grounds based
on the Lotka-Volterra equations, commonly used to describe the
population dynamics of predators and prey. In addition to predators
(Native hunters) and prey (bison), I include Native raiders as a third population.

The effect of adding raiding parties to the traditional predator-prey
equations is that a system with an abundance of bison can "tip" into a
conflict zone. Escalating violence dissuades hunting parties, the
bison population grows in the absence of predators, and more raiders
seek to control the region for their tribe. High initial levels of
raiding parties can also lead to this high-conflict, low hunting
equilibrium.

## The Model

I model three populations:
the bison, Native hunting parties, and Native raiding parties. The
number of bison grows according to the current number of bison and
decreases based on the number of hunting parties. Hunting parties are attracted to large numbers of bison, but will refrain from hunting when there are too many raiding parties. Raiding parties are also drawn to bison-rich lands, but casualties from the resulting conflict lower their numbers.

Let *x* be the number of bison, *y* the number of hunters, and *z* the number of raiders. The populations change through time according the equations

\begin{eqnarray}
\frac{dx}{dt} = x - xy, \qquad \quad \frac{dy}{dt} = xy - y(z^\alpha),
\qquad \quad \frac{dz}{dt} = x - z
\end{eqnarray}

To simplify the exposition, I include only one parameter $\alpha \in
\\{0, 1\\}$, which indicates whether the region is contested. When the
region is accessible to multiple rival tribes, $\alpha$ takes the
value $1$. If it is controlled by a single group, raiders do not deter
hunting parties, 
$\alpha = 0$, and the model
collapses into the Lotka-Volterra equations, as seen below. A growing bison
population attracts more and more hunters, who deplete the bison
population and then switch to other hunting grounds while the bison
herds recover. The populations continue to cycle between low and high.

![png]({{ site.baseurl }}/assets/images/20200422 Bison Dynamics (No Raiders).png) 

When $\alpha = 1$, raiders affect the population dynamic. In a
situation where bison are initially plentiful, the equilibrium
solution to the system is one with high levels of bison and raiders
and relatively fewer hunters. The land is heavily contested and
lightly hunted.

![png]({{ site.baseurl }}/assets/images/20200422 Bison Dynamics (Large Herds).png) 

Similarly, high initial levels of raiders also cause the system to
arrive at a high-conflict equilibrium, even when bison are initially scarce.

![png]({{ site.baseurl }}/assets/images/20200422 Bison Dynamics (Many Raiders).png) 

Finally, low initial numbers of raiders and bison can put the region in a peaceful
equilibrium with many hunters picking over thinned-out herds.

![png]({{ site.baseurl }}/assets/images/20200422 Bison Dynamics (Low-Conflict).png)

## Discussion
Although the high-conflict equilibrium is not in anyone's interest but
the bisons', it may have been prohibitively expensive for the
decentralized Native
tribes to negotiate and enforce some kind of agreement. A further
complication is the ease with which a hunting party could become a
raiding party, making policing nearly impossible. In any case, it is
an interesting historical moment when conflict and abundance
reinforced each other.

## Code
```python
import numpy as np
from scipy.integrate import odeint
import matplotlib.pyplot as plt

def model(X, t, alpha):
    x = X[0]
    y = X[1]
    z = X[2]

    dxdt = x - x*y
    dydt = x*y - y*(z**alpha)
    dzdt = x - z
    dZdt = [dxdt, dydt, dzdt]
    return dZdt

# initial condition
X0 = [.2, .8, .3]
alpha = 1

# set T
T = 20
n = T*10+1
t = np.linspace(0, T, n)

# store solution; record initial conditions
x = np.empty_like(t)
y = np.empty_like(t)
z = np.empty_like(t)
x[0] = X0[0]
y[0] = X0[1]
z[0] = X0[2]

# solve ODE
for i in range(1, n):
    
    # solve for the next time step
    tspan = [t[i-1], t[i]]
    X = odeint(model, X0, tspan, args = (alpha,))
    
    # store solution for plotting
    x[i] = X[1][0]
    y[i] = X[1][1]
    z[i] = X[1][2]

    # next initial condition
    X0 = X[1]

# plot results
plt.rcParams['font.sans-serif'] = 'Garamond'
plt.rcParams['font.family'] = 'sans-serif'
plt.plot(t, x, color='DarkGoldenRod', label = 'x(t)')
plt.plot(t, y, color='DarkGreen', label = 'y(t)')
plt.plot(t, z, color='Crimson', label = 'z(t)')
plt.ylabel('Population', fontsize = 13)
plt.xlabel('Time', fontsize = 13)
plt.title('Hunters Everywhere, But Few Bison', fontsize = 16)
plt.legend(loc='best')
plt.show()
```

