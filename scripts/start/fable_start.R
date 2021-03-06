
# |  (C) 2008-2019 Potsdam Institute for Climate Impact Research (PIK)
# |  authors, and contributors see CITATION.cff file. This file is part
# |  of MAgPIE and licensed under AGPL-3.0-or-later. Under Section 7 of
# |  AGPL-3.0, you are granted additional permissions described in the
# |  MAgPIE License Exception, version 1.0 (see LICENSE file).
# |  Contact: magpie@pik-potsdam.de


######################################
#### Script to start a MAgPIE run ####
######################################

#!!! # Load start_run(cfg) function which is needed to start MAgPIE runs
#!!! source("scripts/start_functions.R")

#!!! #start MAgPIE run
#!!! start_run(cfg="fable.cfg")
#!!!
library(magclass)

# Load start_run(cfg) function which is needed to start MAgPIE runs
source("scripts/start_functions.R")
source("config/default.cfg")



## BAU SCENARIO

cfg$title <- "BAUclosetradeEAT1011"
cfg<-lucode::setScenario(cfg,"SSP2")
cfg<-lucode::setScenario(cfg,"cc")

cfg$input <- c("isimip_rcp-IPSL_CM5A_LR-rcp6p0-co2_rev42_c200_690d3718e151be1b450b394c1064b1c5.tgz",
               "rev4.42_690d3718e151be1b450b394c1064b1c5_magpie.tgz",
               "rev4.42_690d3718e151be1b450b394c1064b1c5_validation.tgz",
               "calibration_H12_c200_26Feb20.tgz",
               "additional_data_rev3.77.tgz")

##Afforestation(21Mha)

cfg$recalc_npi_ndc <- TRUE
cfg$gms$c32_aff_policy <- "ndc"


##Drivers

cfg$gms$c09_pop_scenario  <- "SSP2"
cfg$gms$c09_gdp_scenario  <- "SSP2"




##YieldCrop
cfg$gms$c12_interest_rate <- "medium"

##YieldLLivestock

cfg$gms$c70_feed_scen <- "SSP2"

##Food Scenario
# * switch for transition to EAT Lancet diet scenarios
# * (1):      transition towards exogenous diets and food demand
# * (0):      regression-based estimation of diets and food demand


cfg$gms$s15_exo_diet <- 1

cfg$gms$c15_kcal_scen <- "healthy_BMI"

cfg$gms$c15_EAT_scen <- "FLX"



##Food waste scenario

# * switch for transition to food waste scenarios
# * (1):      transition towards exogenous food waste target
# * (0):      regression-based estimation of food waste
cfg$gms$s15_exo_waste <- 1

# * scenario target for the ratio between food demand and intake
# * only activated if s15_exo_waste is set to 1
# *   options: scalars >1
# * (1.1):  corresponds to 10% food waste ~ quarter waste of HIC
# * (1.2):  corresponds to 20% food waste ~ half waste of HIC
cfg$gms$s15_waste_scen <- 1.2

##Update exogenous trade balances for India
cfg$gms$trade <- "exo"
cfg$gms$c60_bioenergy_subsidy <- 300 #to prevent infeasibilities in other regions

tb_file       <- "modules/21_trade/input/f21_trade_balance.cs3"
tb_india_file <- "trade_balance_india_bau.cs3" ##Ensure the suffix is correct here for both BAU and sust runs. Ass suffix in code to read the correct file name
out           <- read.magpie(tb_file)
replacement   <- read.magpie(tb_india_file)
out["IND",getYears(replacement),getNames(replacement)] <- replacement
write.magpie(out,tb_file)
cat("Exogenous trade information for India has been updated!\n\n")

##copy trade balance india to output folder (for documentation)
cfg$files2export$start <- c(cfg$files2export$start,tb_india_file)


##Biofuel Scenario

cfg$gms$c60_1stgen_biodem <- "const2030"
cfg$gms$c60_2ndgen_biodem <- "R2M41-SSP2-NPi"


start_run(cfg)
