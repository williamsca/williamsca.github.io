---
layout: post
title: The Great Recession, Cereal Edition
categories: Economics
---

The bust was a difficult time for cereal fans.

![png]({{ site.baseurl }}/images/20190709 Cereal Introductions by Year.png)

---

Find the source code below:

```stata
hist year if year >= 1996, graphregion(color(white)) bgcolor(white) ///
	title(`"{fontface "Garamond":Production of New Cereals Collapsed after 2008}"', color(black) ring(0) position(11)) ///
	subtitle(`"{fontface "Garamond": Cereal Introductions by Year}"', color(gs6) ring(0) pos(11) margin(0 0 0 6)) ///
	note("{bf:Source:} The Cereal Project, retrieved from https://www.mrbreakfast.com on 7/9/2019.", color(gs7)) ///
	freq addlabel ytitle("# of New Cereals") width(1) ylabel(0 77, nogrid) yscale(off) ///
	xlabel(1996(4)2020, labsize(small)) xtitle("") fcolor(navy) fintensity(inten80) lcolor(black) ///
	text(30.5 1999 "General Mills introduced" ///
				 "{bf:Reese's Puffs} in 1999.", size(small) color(sand)) ///
	text(48 2013.7 "Quaker adds {bf:Golden Maple} to" ///
				 "their Oat Squares lineup in 2009.", size(small) color(sand)) ///
	text(53 2004 "Kellogg's debuts {bf:Shrek}" ///
			 "themed cereal in 2007.", size(small) color(sand))
```
