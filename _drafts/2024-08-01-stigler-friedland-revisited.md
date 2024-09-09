---
title: What Can Regulators Regulate? Revisiting Stigler and Friedland (1962)
date: 2024-05-03
categories: Economics
tags: ['regulation', 'monopoly']
---

Prior to 1962, many economists took it as given that utility regulators kept prices low. Absent regulation, utilities would inevitably leverage their status as "natural monopolies" to charge high prices, providing a clear rationale for state intervention. George Stigler and Claire Friedland challenged this consensus in their 1962 paper, "What Can Regulators Regulate?", bringing together a classic Chicago School skepticism of regulation with a then-novel empirical approach that leveraged variation in regulatory policy across states.

Their paper's claim -- that state regulatory policy had *no* effect on electricity prices -- set off a long debate about the purpose of utility regulation. Do benevolent regulators serve the public interest in solving a classic market failure, or are they captured by the industries they regulate?

## The Problem of Natural Monopoly

Natural monopoly occupied an outsized role in the early American economics profession. As noted by Stigler, "fully one-forth of all [economics] articles in America in the first decade of this century were on monopoly and public regulation," with the vast majority focused on the regulation of utilities (Stigler 1982).

## A Modern Reassessment

Stigler and Friendland's methods are refreshingly straightforward. Their main specification is a cross-sectional regression of electricity prices on a dummy variable for whether a state had a regulatory commission in 1922, plus a few covariates. The result? No economically or statistically significant relationship between regulation and prices.

To the modern econometrician, the lack of fixed-effects is startling. States with and without regulation are different in many ways, and the inclusion of a few covariates is unlikely to capture these differences (at least, so goes the typical comment in a research seminar). What would a modern reanalysis look like? The setting screams for a difference-in-differences approach, leveraging temporal *and* cross-sectional variation in regulatory policy to estimate its effect on prices.

Consider the event study specification

$$\ln p_{it} = \sum_{j = -m}^n \gamma_j * D_{i,t-j} + \alpha_i + \delta_t + \epsilon_{it}$$

where $p_{it}$ is the log of electricity prices in state $i$ at time $t$, $D_{i,t-j}$ indicates whether state $i$ had a regulatory commission $j$ years ago, and $\alpha_i$ and $\delta_t$ are state and year fixed effects. Rather than comparing prices across states, this model compares the *change* in prices between states that do and do not adopt utility regulation.

State regulatory policy arose gradually. Most had created a special commission to regulate electric utility rates by 1920, but a few waited until after 1940, as seen in the map below. This pattern of staggered adoption presents some difficulties for the traditional difference-in-differences estimator, which can overweight the treatment effects of early adopters. 

![png]({{ site.baseurl }}/images/stigler-friedland-1962-regulation-map.png)



![png]({{ site.baseurl }}/images/stigler-friedland-1962-revisited.png)

## What Do We Learn?

The long half-life of Stigler and Friedland is somewhat surprising. 

 have nothing to do with regulation. Instead, the paper is a testament to the importance of careful empirical work. The paper's conclusions are flawed 



## References

Stigler, George J., and Claire Friedland. "What can regulators regulate? The case of electricity." *The Journal of Law and Economics* 5 (1962): 1-16.

Stigler, George J. "The economists and the problem of monopoly." *Occasional Papers L. Sch. U. Chi.* 19 (1982): 1.

Peltzman, Sam. “George Stigler’s Contribution to the Economic Analysis of Regulation.” *Journal of Political Economy* 101, no. 5 (1993): 818–32. http://www.jstor.org/stable/2138597.