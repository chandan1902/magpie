# |  (C) 2008-2019 Potsdam Institute for Climate Impact Research (PIK)
# |  authors, and contributors see CITATION.cff file. This file is part
# |  of MAgPIE and licensed under AGPL-3.0-or-later. Under Section 7 of
# |  AGPL-3.0, you are granted additional permissions described in the
# |  MAgPIE License Exception, version 1.0 (see LICENSE file).
# |  Contact: magpie@pik-potsdam.de


######################################
#### Script to start a MAgPIE run ####
######################################

library(lucode)

# Load start_run(cfg) function which is needed to start MAgPIE runs
source("scripts/start_functions.R")

# Load cfg and overwrite
source("config/default.cfg")

cfg = setScenario(cfg,"SSP2","nocc")

cfg$gms$c56_pollutant_prices <- "R2M41-SSP2-NPi"         # def = "R2M41-SSP2-NPi"
cfg$gms$c60_2ndgen_biodem <- "R2M41-SSP2-NPi"            # def = R2M41-SSP2-NPi

#start MAgPIE run
start_run(cfg=cfg)
