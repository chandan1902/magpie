*** |  (C) 2008-2021 Potsdam Institute for Climate Impact Research (PIK)
*** |  authors, and contributors see CITATION.cff file. This file is part
*** |  of MAgPIE and licensed under AGPL-3.0-or-later. Under Section 7 of
*** |  AGPL-3.0, you are granted additional permissions described in the
*** |  MAgPIE License Exception, version 1.0 (see LICENSE file).
*** |  Contact: magpie@pik-potsdam.de
*' @code
*' Exchange land information after optimization
p32_land(t,j,type32,ac) = v32_land.l(j,type32,ac);
*' @stop

*#################### R SECTION START (OUTPUT DEFINITIONS) #####################
 ov_cost_fore(t,i,"marginal")                     = vm_cost_fore.m(i);
 ov32_cost_hvarea(t,i,"marginal")                 = v32_cost_hvarea.m(i);
 ov32_land(t,j,type32,ac,"marginal")              = v32_land.m(j,type32,ac);
 ov32_land_missing(t,j,"marginal")                = v32_land_missing.m(j);
 ov_landdiff_forestry(t,"marginal")               = vm_landdiff_forestry.m;
 ov32_cost_recur(t,i,"marginal")                  = v32_cost_recur.m(i);
 ov32_land_expansion(t,j,type32,ac,"marginal")    = v32_land_expansion.m(j,type32,ac);
 ov32_land_reduction(t,j,type32,ac,"marginal")    = v32_land_reduction.m(j,type32,ac);
 ov32_cost_establishment(t,i,"marginal")          = v32_cost_establishment.m(i);
 ov32_hvarea_forestry(t,j,ac,"marginal")          = v32_hvarea_forestry.m(j,ac);
 ov_prod_forestry(t,j,kforestry,"marginal")       = vm_prod_forestry.m(j,kforestry);
 ov_cdr_aff(t,j,ac,aff_effect,"marginal")         = vm_cdr_aff.m(j,ac,aff_effect);
 oq32_cost_total(t,i,"marginal")                  = q32_cost_total.m(i);
 oq32_land(t,j,"marginal")                        = q32_land.m(j);
 oq32_cdr_aff(t,j,ac,"marginal")                  = q32_cdr_aff.m(j,ac);
 oq32_carbon(t,j,ag_pools,"marginal")             = q32_carbon.m(j,ag_pools);
 oq32_land_diff(t,"marginal")                     = q32_land_diff.m;
 oq32_max_aff(t,"marginal")                       = q32_max_aff.m;
 oq32_max_aff_reg(t,i,"marginal")                 = q32_max_aff_reg.m(i);
 oq32_aff_pol(t,j,"marginal")                     = q32_aff_pol.m(j);
 oq32_aff_est(t,j,"marginal")                     = q32_aff_est.m(j);
 oq32_hvarea_forestry(t,j,ac,"marginal")          = q32_hvarea_forestry.m(j,ac);
 oq32_cost_recur(t,i,"marginal")                  = q32_cost_recur.m(i);
 oq32_establishment_dynamic(t,i,"marginal")       = q32_establishment_dynamic.m(i);
 oq32_establishment_dynamic_yield(t,i,"marginal") = q32_establishment_dynamic_yield.m(i);
 oq32_establishment_fixed(t,j,"marginal")         = q32_establishment_fixed.m(j);
 oq32_land_expansion(t,j,type32,ac,"marginal")    = q32_land_expansion.m(j,type32,ac);
 oq32_land_reduction(t,j,type32,ac,"marginal")    = q32_land_reduction.m(j,type32,ac);
 oq32_cost_establishment(t,i,"marginal")          = q32_cost_establishment.m(i);
 oq32_bgp_aff(t,j,ac,"marginal")                  = q32_bgp_aff.m(j,ac);
 oq32_forestry_est(t,j,type32,ac,"marginal")      = q32_forestry_est.m(j,type32,ac);
 oq32_cost_hvarea(t,i,"marginal")                 = q32_cost_hvarea.m(i);
 oq32_prod_forestry(t,j,"marginal")               = q32_prod_forestry.m(j);
 oq32_bv_aff(t,j,potnatveg,"marginal")            = q32_bv_aff.m(j,potnatveg);
 oq32_bv_ndc(t,j,potnatveg,"marginal")            = q32_bv_ndc.m(j,potnatveg);
 oq32_bv_plant(t,j,potnatveg,"marginal")          = q32_bv_plant.m(j,potnatveg);
 ov_cost_fore(t,i,"level")                        = vm_cost_fore.l(i);
 ov32_cost_hvarea(t,i,"level")                    = v32_cost_hvarea.l(i);
 ov32_land(t,j,type32,ac,"level")                 = v32_land.l(j,type32,ac);
 ov32_land_missing(t,j,"level")                   = v32_land_missing.l(j);
 ov_landdiff_forestry(t,"level")                  = vm_landdiff_forestry.l;
 ov32_cost_recur(t,i,"level")                     = v32_cost_recur.l(i);
 ov32_land_expansion(t,j,type32,ac,"level")       = v32_land_expansion.l(j,type32,ac);
 ov32_land_reduction(t,j,type32,ac,"level")       = v32_land_reduction.l(j,type32,ac);
 ov32_cost_establishment(t,i,"level")             = v32_cost_establishment.l(i);
 ov32_hvarea_forestry(t,j,ac,"level")             = v32_hvarea_forestry.l(j,ac);
 ov_prod_forestry(t,j,kforestry,"level")          = vm_prod_forestry.l(j,kforestry);
 ov_cdr_aff(t,j,ac,aff_effect,"level")            = vm_cdr_aff.l(j,ac,aff_effect);
 oq32_cost_total(t,i,"level")                     = q32_cost_total.l(i);
 oq32_land(t,j,"level")                           = q32_land.l(j);
 oq32_cdr_aff(t,j,ac,"level")                     = q32_cdr_aff.l(j,ac);
 oq32_carbon(t,j,ag_pools,"level")                = q32_carbon.l(j,ag_pools);
 oq32_land_diff(t,"level")                        = q32_land_diff.l;
 oq32_max_aff(t,"level")                          = q32_max_aff.l;
 oq32_max_aff_reg(t,i,"level")                    = q32_max_aff_reg.l(i);
 oq32_aff_pol(t,j,"level")                        = q32_aff_pol.l(j);
 oq32_aff_est(t,j,"level")                        = q32_aff_est.l(j);
 oq32_hvarea_forestry(t,j,ac,"level")             = q32_hvarea_forestry.l(j,ac);
 oq32_cost_recur(t,i,"level")                     = q32_cost_recur.l(i);
 oq32_establishment_dynamic(t,i,"level")          = q32_establishment_dynamic.l(i);
 oq32_establishment_dynamic_yield(t,i,"level")    = q32_establishment_dynamic_yield.l(i);
 oq32_establishment_fixed(t,j,"level")            = q32_establishment_fixed.l(j);
 oq32_land_expansion(t,j,type32,ac,"level")       = q32_land_expansion.l(j,type32,ac);
 oq32_land_reduction(t,j,type32,ac,"level")       = q32_land_reduction.l(j,type32,ac);
 oq32_cost_establishment(t,i,"level")             = q32_cost_establishment.l(i);
 oq32_bgp_aff(t,j,ac,"level")                     = q32_bgp_aff.l(j,ac);
 oq32_forestry_est(t,j,type32,ac,"level")         = q32_forestry_est.l(j,type32,ac);
 oq32_cost_hvarea(t,i,"level")                    = q32_cost_hvarea.l(i);
 oq32_prod_forestry(t,j,"level")                  = q32_prod_forestry.l(j);
 oq32_bv_aff(t,j,potnatveg,"level")               = q32_bv_aff.l(j,potnatveg);
 oq32_bv_ndc(t,j,potnatveg,"level")               = q32_bv_ndc.l(j,potnatveg);
 oq32_bv_plant(t,j,potnatveg,"level")             = q32_bv_plant.l(j,potnatveg);
 ov_cost_fore(t,i,"upper")                        = vm_cost_fore.up(i);
 ov32_cost_hvarea(t,i,"upper")                    = v32_cost_hvarea.up(i);
 ov32_land(t,j,type32,ac,"upper")                 = v32_land.up(j,type32,ac);
 ov32_land_missing(t,j,"upper")                   = v32_land_missing.up(j);
 ov_landdiff_forestry(t,"upper")                  = vm_landdiff_forestry.up;
 ov32_cost_recur(t,i,"upper")                     = v32_cost_recur.up(i);
 ov32_land_expansion(t,j,type32,ac,"upper")       = v32_land_expansion.up(j,type32,ac);
 ov32_land_reduction(t,j,type32,ac,"upper")       = v32_land_reduction.up(j,type32,ac);
 ov32_cost_establishment(t,i,"upper")             = v32_cost_establishment.up(i);
 ov32_hvarea_forestry(t,j,ac,"upper")             = v32_hvarea_forestry.up(j,ac);
 ov_prod_forestry(t,j,kforestry,"upper")          = vm_prod_forestry.up(j,kforestry);
 ov_cdr_aff(t,j,ac,aff_effect,"upper")            = vm_cdr_aff.up(j,ac,aff_effect);
 oq32_cost_total(t,i,"upper")                     = q32_cost_total.up(i);
 oq32_land(t,j,"upper")                           = q32_land.up(j);
 oq32_cdr_aff(t,j,ac,"upper")                     = q32_cdr_aff.up(j,ac);
 oq32_carbon(t,j,ag_pools,"upper")                = q32_carbon.up(j,ag_pools);
 oq32_land_diff(t,"upper")                        = q32_land_diff.up;
 oq32_max_aff(t,"upper")                          = q32_max_aff.up;
 oq32_max_aff_reg(t,i,"upper")                    = q32_max_aff_reg.up(i);
 oq32_aff_pol(t,j,"upper")                        = q32_aff_pol.up(j);
 oq32_aff_est(t,j,"upper")                        = q32_aff_est.up(j);
 oq32_hvarea_forestry(t,j,ac,"upper")             = q32_hvarea_forestry.up(j,ac);
 oq32_cost_recur(t,i,"upper")                     = q32_cost_recur.up(i);
 oq32_establishment_dynamic(t,i,"upper")          = q32_establishment_dynamic.up(i);
 oq32_establishment_dynamic_yield(t,i,"upper")    = q32_establishment_dynamic_yield.up(i);
 oq32_establishment_fixed(t,j,"upper")            = q32_establishment_fixed.up(j);
 oq32_land_expansion(t,j,type32,ac,"upper")       = q32_land_expansion.up(j,type32,ac);
 oq32_land_reduction(t,j,type32,ac,"upper")       = q32_land_reduction.up(j,type32,ac);
 oq32_cost_establishment(t,i,"upper")             = q32_cost_establishment.up(i);
 oq32_bgp_aff(t,j,ac,"upper")                     = q32_bgp_aff.up(j,ac);
 oq32_forestry_est(t,j,type32,ac,"upper")         = q32_forestry_est.up(j,type32,ac);
 oq32_cost_hvarea(t,i,"upper")                    = q32_cost_hvarea.up(i);
 oq32_prod_forestry(t,j,"upper")                  = q32_prod_forestry.up(j);
 oq32_bv_aff(t,j,potnatveg,"upper")               = q32_bv_aff.up(j,potnatveg);
 oq32_bv_ndc(t,j,potnatveg,"upper")               = q32_bv_ndc.up(j,potnatveg);
 oq32_bv_plant(t,j,potnatveg,"upper")             = q32_bv_plant.up(j,potnatveg);
 ov_cost_fore(t,i,"lower")                        = vm_cost_fore.lo(i);
 ov32_cost_hvarea(t,i,"lower")                    = v32_cost_hvarea.lo(i);
 ov32_land(t,j,type32,ac,"lower")                 = v32_land.lo(j,type32,ac);
 ov32_land_missing(t,j,"lower")                   = v32_land_missing.lo(j);
 ov_landdiff_forestry(t,"lower")                  = vm_landdiff_forestry.lo;
 ov32_cost_recur(t,i,"lower")                     = v32_cost_recur.lo(i);
 ov32_land_expansion(t,j,type32,ac,"lower")       = v32_land_expansion.lo(j,type32,ac);
 ov32_land_reduction(t,j,type32,ac,"lower")       = v32_land_reduction.lo(j,type32,ac);
 ov32_cost_establishment(t,i,"lower")             = v32_cost_establishment.lo(i);
 ov32_hvarea_forestry(t,j,ac,"lower")             = v32_hvarea_forestry.lo(j,ac);
 ov_prod_forestry(t,j,kforestry,"lower")          = vm_prod_forestry.lo(j,kforestry);
 ov_cdr_aff(t,j,ac,aff_effect,"lower")            = vm_cdr_aff.lo(j,ac,aff_effect);
 oq32_cost_total(t,i,"lower")                     = q32_cost_total.lo(i);
 oq32_land(t,j,"lower")                           = q32_land.lo(j);
 oq32_cdr_aff(t,j,ac,"lower")                     = q32_cdr_aff.lo(j,ac);
 oq32_carbon(t,j,ag_pools,"lower")                = q32_carbon.lo(j,ag_pools);
 oq32_land_diff(t,"lower")                        = q32_land_diff.lo;
 oq32_max_aff(t,"lower")                          = q32_max_aff.lo;
 oq32_max_aff_reg(t,i,"lower")                    = q32_max_aff_reg.lo(i);
 oq32_aff_pol(t,j,"lower")                        = q32_aff_pol.lo(j);
 oq32_aff_est(t,j,"lower")                        = q32_aff_est.lo(j);
 oq32_hvarea_forestry(t,j,ac,"lower")             = q32_hvarea_forestry.lo(j,ac);
 oq32_cost_recur(t,i,"lower")                     = q32_cost_recur.lo(i);
 oq32_establishment_dynamic(t,i,"lower")          = q32_establishment_dynamic.lo(i);
 oq32_establishment_dynamic_yield(t,i,"lower")    = q32_establishment_dynamic_yield.lo(i);
 oq32_establishment_fixed(t,j,"lower")            = q32_establishment_fixed.lo(j);
 oq32_land_expansion(t,j,type32,ac,"lower")       = q32_land_expansion.lo(j,type32,ac);
 oq32_land_reduction(t,j,type32,ac,"lower")       = q32_land_reduction.lo(j,type32,ac);
 oq32_cost_establishment(t,i,"lower")             = q32_cost_establishment.lo(i);
 oq32_bgp_aff(t,j,ac,"lower")                     = q32_bgp_aff.lo(j,ac);
 oq32_forestry_est(t,j,type32,ac,"lower")         = q32_forestry_est.lo(j,type32,ac);
 oq32_cost_hvarea(t,i,"lower")                    = q32_cost_hvarea.lo(i);
 oq32_prod_forestry(t,j,"lower")                  = q32_prod_forestry.lo(j);
 oq32_bv_aff(t,j,potnatveg,"lower")               = q32_bv_aff.lo(j,potnatveg);
 oq32_bv_ndc(t,j,potnatveg,"lower")               = q32_bv_ndc.lo(j,potnatveg);
 oq32_bv_plant(t,j,potnatveg,"lower")             = q32_bv_plant.lo(j,potnatveg);
*##################### R SECTION END (OUTPUT DEFINITIONS) ######################
