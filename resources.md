---
layout: page
title: "Resources"
permalink: /resources/
description: "Public goods produced by Colin"
---

  <section>
    <h2> Data </h2>
      <p>
        <span class="marginnote">The Home Mortgage Disclosure Act (HMDA) data did not track whether loans were for site-built or mobile homes before 2004. I train a classifier on loan-level data from 2004-2017 and use it to impute the type of home for the period 1990-2003 when that information is otherwise unavailable. The classifier accurately predicts loan type in the validation set and is consistent with independent data from the Census Bureau. The data highlight the massive and persistent decline in lending to mobile home buyers since 1998. </span>
        <span class="papertitle"><b>Imputing Mobile Home Loans in HMDA</b></span>
        <span class="paperdetails"> <a href="10.5281/zenodo.16848727" target="_blank">Data</a> | <a href="https://github.com/williamsca/manufactured-hmda" target="_blank">Replication</a>
        </span>
        ![png]({{ site.baseurl }}/assets/images/originations_by_year.png)
      </p>

  </section>