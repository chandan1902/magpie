*** |  (C) 2008-2021 Potsdam Institute for Climate Impact Research (PIK)
*** |  authors, and contributors see CITATION.cff file. This file is part
*** |  of MAgPIE and licensed under AGPL-3.0-or-later. Under Section 7 of
*** |  AGPL-3.0, you are granted additional permissions described in the
*** |  MAgPIE License Exception, version 1.0 (see LICENSE file).
*** |  Contact: magpie@pik-potsdam.de

parameters
 pm_wat_req_k(t,j,k)               LPJmL annual water demand for irrigation per ha per yr and livestock demand per ton per yr (m^3)
 ic42_wat_req_k(j,k)                LPJmL annual water demand for irrigation per ha per yr and livestock demand per ton per yr (m^3)
 i42_env_flows(t,j)                 Environmental flow requirements in case of policy (mio m^3)
 i42_env_flows_base(t,j)            Environmental flow requirements in case of no policy (mio m^3)
 ic42_env_flow_policy(i)            Determines whether environmental flow protection is enforced in the current time step (1)
 i42_env_flow_policy(t,i)           Determines whether environmental flow protection is enforced (1)
* country-specific scenario switch
 p42_country_dummy(iso)             Dummy parameter indicating whether country is affected by EFP (1)
 p42_EFP_region_shr(t_all,i)        Weighted share of region with regards to EFP (1)
;

equations
 q42_water_demand(wat_dem,j)         Water withdrawals of different sectors (mio. m^3 per yr)
 q42_vm_water_cost(j)                Total cost of pumping irrigation water (USD)
;

positive variables
  vm_watdem(wat_dem,j)               Amount of water needed in different sectors (mio. m^3 per yr)
  v42_irrig_eff(j)                   Irrigation efficiency (1)
  vm_water_cost(i)                   Cost of irrigation water (USD per m^3 per yr)
;

*#################### R SECTION START (OUTPUT DECLARATIONS) ####################
parameters
 ov_watdem(t,wat_dem,j,type)         Amount of water needed in different sectors (mio. m^3 per yr)
 ov42_irrig_eff(t,j,type)            Irrigation efficiency (1)
 ov_water_cost(t,i,type)             Cost of irrigation water (USD per m^3 per yr)
 oq42_water_demand(t,wat_dem,j,type) Water withdrawals of different sectors (mio. m^3 per yr)
 oq42_vm_water_cost(t,j,type)        Total cost of pumping irrigation water (USD)
;
*##################### R SECTION END (OUTPUT DECLARATIONS) #####################
