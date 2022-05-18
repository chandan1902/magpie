*** |  (C) 2008-2021 Potsdam Institute for Climate Impact Research (PIK)
*** |  authors, and contributors see CITATION.cff file. This file is part
*** |  of MAgPIE and licensed under AGPL-3.0-or-later. Under Section 7 of
*** |  AGPL-3.0, you are granted additional permissions described in the
*** |  MAgPIE License Exception, version 1.0 (see LICENSE file).
*** |  Contact: magpie@pik-potsdam.de

parameters
 p44_price_bv_loss(t_all)			            Price (subsidy) for biodiversity stock loss (gain) (USD per ha)
;

variables
 v44_bv_loss(j)                                 Change in biodiversity stock compared to previous time step (Mha per time step)
 vm_cost_bv_loss(j)					            Cost of biodiversity loss (mio USD)
;

positive variables
 vm_bv(j,landcover44,potnatveg)		            Biodiversity stock for all land cover classes (unweighted) (Mha)
 v44_bv_weighted(j)				 			    Range-rarity weighted biodiversity stock (Mha)
;

equations
 q44_bv_loss(j)                                 Change in biodiversity stock compared to previous time step (Mha per time step)
 q44_bv_weighted(j)		            			Range-rarity weighted biodiversity stock (Mha)
 q44_cost_bv_loss(j)			                Cost of biodiversity loss (mio USD)
;


*#################### R SECTION START (OUTPUT DECLARATIONS) ####################
parameters
 ov44_bv_loss(t,j,type)                Change in biodiversity stock compared to previous time step (Mha per time step)
 ov_cost_bv_loss(t,j,type)             Cost of biodiversity loss (mio USD)
 ov_bv(t,j,landcover44,potnatveg,type) Biodiversity stock for all land cover classes (unweighted) (Mha)
 ov44_bv_weighted(t,j,type)            Range-rarity weighted biodiversity stock (Mha)
 oq44_bv_loss(t,j,type)                Change in biodiversity stock compared to previous time step (Mha per time step)
 oq44_bv_weighted(t,j,type)            Range-rarity weighted biodiversity stock (Mha)
 oq44_cost_bv_loss(t,j,type)           Cost of biodiversity loss (mio USD)
;
*##################### R SECTION END (OUTPUT DECLARATIONS) #####################

