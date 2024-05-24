---
title: Rent-Seeking and Public Sector Unions
date: 2023-12-15
categories: Economics
tags: ['public finance', 'unions', 'monopoly']
---

What role do public sector unions play in determining the local government spending priorities? In this essay, I discuss a trio of recent papers that shed light on this question. Each explores a different source of monopoly power that allows unions to extract rents in the form of higher wages.

Not all states allow public employees to bargain collectively: ...

## Transfers from Uncle Sam

Suppose a city government finds a dollar bill on the ground (or, equivalently, that they receive an unexpected transfer from the federal government). What will they do? Rather than returning the money to residents in the form of lower taxes, Feiveson (2015) shows that they spend it. Interestingly, *how* they spend it depends on state laws that govern public sector unions. When unions are strong, the extra cash goes to higher wages for public employees; when they are weak, jurisdictions instead hire more employees and invest in infrastructure.

Feiveson exploits geographic variation in federal transfers due to the allocation formulas in President Nixon's State and Local Fiscal Assistance Act of 1972. These transfers, which comprised roughly 3% of local budgets each year until 1986, were intended to move spending decisions "closer to the people." Congressional horse-trading led to a geographically-tiered formula that first allocated funds to state areas, then across county areas within the state, and only then across local governments the county. The result: two similar cities could receive vastly different amounts of money depending on the state and county that they happened to be in.

After showing that $1 of transfers from this program lead to about $1 of additional spending, Feiveson breaks down spending into four categories: wages, employment, capital outlays, and everything else. She then interacts the amount of federal transfers with an indicator for whether the state requires collective bargaining or not. The key results appear in Table 9 and are copied below:

![png]({{ site.baseurl }}/images/feiveson-2015-table9.png)

While cities in pro-union states spend about $0.78 of the extra dollar on wages, those in anti-union states spend merely $0.14, with the rest going to employment and capital outlays.

While Feiveson emphasizes the implications of her results for macroeconomic policy and spending multipliers, I think the more interesting lesson is what we learn about the nature of local governments. Cities are sometimes viewed as firms whose shareholders are their residents (hence, a municipal *corporation*). When firms receive a dollar in windfall profits, we expect them to return it to their shareholders either via dividends or stock buybacks. The fact that cities *don't* distribute windfall gains to residents by lowering taxes tells us something about who their true shareholders are.

## Local Amenities

A place with great weather, beautiful beaches, or a natural harbor will have some residents even if the local government is corrupt or inefficient. Brueckner and Neumark (2014) push this idea a step further: can public employees actively exploit natural amenities to raise their wages without providing additional services?

In the spirit of Buchanan, Brueckner and Neumark develop a model where public employees control the local government and choose their own wages. This may seem a bit crazy: after all, voters presumably have some say in wage setting through the political process. All that they really need, though, is that public employees can exert a teeny bit of influence on their wages. Given the importance of public sector unions in local elections, this assumption seems pretty reasonable.

In their model, public employees face the same trade-off as any monopolist: to raise more revenue for a raise, they can increase taxes, but that will cause some residents to move elsewhere. Their "wage-maximizing" tax rate will balance higher revenues per resident against the number of residents willing to put up with those taxes. Critically, great amenities allow public employees to push up taxes higher than they could otherwise because some residents will stay for the beaches or sunshine.

Brueckner and Nuemark test this prediction with Mincer-style wage regressions using CPS data. They include the standard demographics controls plus three variables motivated by their model: measures of local amenities, an indicator for public sector status, and their interaction. If public sector workers are able to generate rents from local amenities, this interaction should be positive. In short, nice weather + public employee = higher (relative) wage. And that's exactly what they find.

Are all public sector employees able to collect these rents? Not quite. When they split their sample based on the extent of collective bargaining in the state, Brueckner and Neumark find that the effect of amenities on wages is only present in states with strong unions, as seen by comparing columns (3) and (4) in the table below

![png]({{ site.baseurl }}/images/brueckner-neumark-amenities-2014.png)

In the highlighted row, *proximity* measures how close the average resident of the state is to a beach, Great Lake, or major river. For public employees in states without strong unions, there is little relationship between proximity and wages. But among states with strong unions, moving closer to a body of water is associated with a statistically significant increase in wages.

## Inelastic Housing Supply

Diamond (2017)

## Some Parting Thoughts

In each of these studies, government productivity is the elephant in the room. So what if public wages are high -- maybe they've earned that raise by working harder or longer! There would seem to be room here for a project that constructed an objective measure of government output that could be compared across jurisdictions and over time, something like wait times at the DMV or 911 response times. Teacher value-added could work, but I'm not aware of any such estimates that are available for multiple school districts.

Another way to get at public sector productivity is to look at government procurement. If two jurisdictions purchase the same inputs for different prices, it is safe to say that one is operating more efficiently than the other. There's ongoing research on this topic by Cailinn Slattery in the US and Garcia-Santana and Santamaria (2021) in France and Spain, but I believe these questions are still ripe for exploration.

## References

Diamond, Rebecca. "Housing supply elasticity and rent extraction by state and local governments." American Economic Journal: Economic Policy 9, no. 1 (2017): 74-111. https://doi.org/10.1257/pol.20150320.

Feiveson, Laura. "General revenue sharing and public sector unions." *Journal of Public Economics* 125 (2015): 28-45. http://dx.doi.org/10.1016/j.jpubeco.2015.03.004.

Brueckner, Jan K., and David Neumark. "Beaches, sunshine, and public sector pay: theory and evidence on amenities and rent extraction by government workers." *American Economic Journal: Economic Policy* 6, no. 2 (2014): 198-230. http://dx.doi.org/10.1257/pol.6.2.198.

Garcıa-Santana, Manuel, and Marta Santamarıa. "Border Effects in Public procurement: the Aggregate Effects of Governments’ Home Bias." (2021).
