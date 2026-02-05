clear all

use "1-Incidence.dta"


****significant****
xtgee infant lagtotal_std i.id [fw=pop] , family(binomial 1) link(probit) exposure(pedpop) corr(independent) vce(robust) 
margins , dydx(lagtotal_std)



***test extended probit***
gsem ///
    (infant <- lagtotal_std i.id c.ln_pedpop,  probit) ///
    (lagtotal_std <- ln_lag2 i.id,  ), ///
    vce(cluster fips_st) fw(pop)

	*fw(pop)
margins , dydx(lagtotal_std)


