# |  (C) 2008-2021 Potsdam Institute for Climate Impact Research (PIK)
# |  authors, and contributors see CITATION.cff file. This file is part
# |  of MAgPIE and licensed under AGPL-3.0-or-later. Under Section 7 of
# |  AGPL-3.0, you are granted additional permissions described in the
# |  MAgPIE License Exception, version 1.0 (see LICENSE file).
# |  Contact: magpie@pik-potsdam.de

# ------------------------------------------------
# description: start run with default.cfg settings
# position: 1
# ------------------------------------------------

library(magclass)

# Load start_run(cfg) function which is needed to start MAgPIE runs
source("scripts/start_functions.R")
source("config/default.cfg")

#start MAgPIE run
start_run(cfg="default.cfg")

# Year until which all parameters are fixed to SSP2 values
cfg$gms$sm_fix_SSP2 <- 2015


cfg$title <- "Biofueconst2030IND"

cfg$input <- c(regional    = "rev4.65_h12_magpie.tgz",
               cellular    = "rev4.65_h12_1998ea10_cellularmagpie_c200_MRI-ESM2-0-ssp370_lpjml-8e6c5eb1.tgz",
               validation  = "rev4.65_h12_validation.tgz",
               additional  = "additional_data_rev4.07.tgz",
               calibration = "calibration_H12_sticky_feb18_dynamic_30Nov21.tgz")

cfg$gms$c38_sticky_mode <- "dynamic"         # default = free

# * 1st generation bioenergy demand scenarios based on Lotze Campen (2014)
# * (phaseout2020): increase until 2020, followed by phaseout until 2050
# * (const2020): increase until 2020, constant thereafter
# * (const2030): increase until 2030, constant thereafter
# * (ind2030const): NBP2018 untill 20330 constant there after
# * (ind2050lin): NBP2018 untill 2050 linear increase there after
cfg$gms$c60_1stgen_biodem <- "ind2050lin"               # def = const2020


cfg$output <- c("output_check", "rds_report", "extra/disaggregation")

#Start MAgPIE run
start_run(cfg,codeCheck=FALSE)