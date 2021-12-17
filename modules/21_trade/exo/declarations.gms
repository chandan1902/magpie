*** |  (C) 2008-2021 Potsdam Institute for Climate Impact Research (PIK)
*** |  authors, and contributors see CITATION.cff file. This file is part
*** |  of MAgPIE and licensed under AGPL-3.0-or-later. Under Section 7 of
*** |  AGPL-3.0, you are granted additional permissions described in the
*** |  MAgPIE License Exception, version 1.0 (see LICENSE file).
*** |  Contact: magpie@pik-potsdam.de

parameters
pm_selfsuff_ext(t_ext,h,kforestry)            Self sufficiency for timber products in extended time frame (1)
;
positive variables
<<<<<<< HEAD
 vm_cost_trade(i)                            Regional  trade costs (mio. USD05MER per yr)
 v21_manna_from_heaven(i,kall)                  Last resort resource for otherwise infeasble trade balance constraints (mio. tDM per yr)
;

equations
 q21_notrade(i,kall)        Regional production constraint of non-tradable commodities (mio. tDM per yr)
 q21_cost_trade(i)                       Regional  trade costs (mio. USD05MER per yr)
=======
 vm_cost_trade(i)               Regional  trade costs (mio. USD05MER per yr)
 v21_manna_from_heaven(h,kall)  Last resort resource for otherwise infeasible trade balance constraints (mio. tDM per yr)
;

equations
 q21_notrade(h,kall)        Superregional production constraint of non-tradable commodities (mio. tDM per yr)
 q21_cost_trade(h)          Superregional  trade costs (mio. USD05MER per yr)
>>>>>>> 1f9bd81785e9eecf1cc8bbe8b12383c38c653b74
;

*#################### R SECTION START (OUTPUT DECLARATIONS) ####################
parameters
 ov_cost_trade(t,i,type)               Regional  trade costs (mio. USD05MER per yr)
<<<<<<< HEAD
 ov21_manna_from_heaven(t,i,kall,type) Last resort resource for otherwise infeasble trade balance constraints (mio. tDM per yr)
 oq21_notrade(t,i,kall,type)           Regional production constraint of non-tradable commodities (mio. tDM per yr)
 oq21_cost_trade(t,i,type)             Regional  trade costs (mio. USD05MER per yr)
=======
 ov21_manna_from_heaven(t,h,kall,type) Last resort resource for otherwise infeasible trade balance constraints (mio. tDM per yr)
 oq21_notrade(t,h,kall,type)           Superregional production constraint of non-tradable commodities (mio. tDM per yr)
 oq21_cost_trade(t,h,type)             Superregional  trade costs (mio. USD05MER per yr)
>>>>>>> 1f9bd81785e9eecf1cc8bbe8b12383c38c653b74
;
*##################### R SECTION END (OUTPUT DECLARATIONS) #####################
