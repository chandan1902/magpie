*** Historical value fix
pm_interest_dev(t_historical,i) = pm_interest_dev("y1995",i) * 0.9;

** Calculation of Single rotation model rotation lengths

** Calculating forestry carbon densitiy here is the same calculation as in carbon module.
** As these numbers don't exist yet due to carbon module appearing below forestry module.
** We need this to calculate marginal carbon density in the next step.
p32_carbon_density_ac_forestry(t_all,j,ac) = m_growth_vegc(0,fm_carbon_density(t_all,j,"other","vegc"),sum(clcl,pm_climate_class(j,clcl)*fm_growth_par(clcl,"k","plantations")),sum(clcl,pm_climate_class(j,clcl)*fm_growth_par(clcl,"m","plantations")),(ord(ac)-1));

** Calculating the marginal of carbon density i.e. change in carbon density over two time steps
** The carbon densities are tC/ha/year so we don't have to divide by timestep length.
loop(ac_sub,
  p32_carbon_density_ac_marg(t_all,j,ac_sub) = p32_carbon_density_ac_forestry(t_all,j,ac_sub) - p32_carbon_density_ac_forestry(t_all,j,ac_sub-1);
  );
p32_carbon_density_ac_marg(t_all,j,"ac0") = 0;

** Calculating Instantaneous Growth Rates (IGR).
** This is a proxy number which can be compared against interest rate in the economy to
** make investment decisions in plantations (i.e. to keep it growing or to harvest it).
** This parameter is then used to calculate rotation lengths.
p32_IGR(t_all,j,ac) =   (p32_carbon_density_ac_marg(t_all,j,ac)/p32_carbon_density_ac_forestry(t_all,j,ac))$(p32_carbon_density_ac_forestry(t_all,j,ac)>0)
                      + 1$(p32_carbon_density_ac_forestry(t_all,j,ac)=0);

** For each cluster in MAgPIE ("j") we calculate how long the prevailing interest rates stay lower than the IGR.
** As long as the prevailing interest rates are lower than IGR, plantations shall be kept standing.
** As long as the prevailing interest rate becomes higher than IGR, it is assumed that the forest owner would rather
** keep his/her investment in bank rather than in keeping the forest standing.
** The easiest way to do this calculation is to count a value of 1 for IGR>interest rate and a value of 0 for IGR<interest rate.
p32_rot_flg(t_all,j,ac) = 1$(p32_IGR(t_all,j,ac) - sum(cell(i,j),pm_interest_dev(t_all,i)) >  0)
                        + 0$(p32_IGR(t_all,j,ac) - sum(cell(i,j),pm_interest_dev(t_all,i)) <= 0);

** From the above calculation, now its easier to count how many age-classes can be sustained before IGR falls below interest rate.

*********************************************************************************

** Faustmann rotation lengths:

p32_time(ac) = ord(ac);

p32_discount_factor(t_all,j,ac)         =  1/(exp(sum(cell(i,j),pm_interest_dev(t_all,i))*p32_time(ac)));

p32_net_present_value(t_all,j,ac)       = ((s32_price * p32_carbon_density_ac_forestry(t_all,j,ac) * p32_discount_factor(t_all,j,ac)))/(1-p32_discount_factor(t_all,j,ac));

p32_stand_value(t_all,j,ac)             = s32_price * p32_carbon_density_ac_forestry(t_all,j,ac);
p32_stand_value(t_all,j,ac)$(p32_stand_value(t_all,j,ac)<0.01) = 0.01;

p32_investment_returns_lost(t_all,j,ac) = sum(cell(i,j),pm_interest_dev(t_all,i)) * p32_net_present_value(t_all,j,ac);
p32_land_rent_weighted(t_all,j,ac)      = p32_investment_returns_lost(t_all,j,ac)/p32_stand_value(t_all,j,ac) ;

p32_rot_flg_faustmann(t_all,j,ac)       = 1$(p32_IGR(t_all,j,ac) > sum(cell(i,j),pm_interest_dev(t_all,i)) + p32_land_rent_weighted(t_all,j,ac))
                                        + 0$(p32_IGR(t_all,j,ac) <= sum(cell(i,j),pm_interest_dev(t_all,i)) + p32_land_rent_weighted(t_all,j,ac));

p32_rot_length_faustmann(t_all,j)       = sum(ac,p32_rot_flg_faustmann(t_all,j,ac));

*********************************************************************************

** Change rotation based on switch. If not use calculation before faustmann
if(s32_faustmann_rotation = 0,
  p32_rot_length_ac_eqivalent(t_all,j) = sum(ac,p32_rot_flg(t_all,j,ac));
elseif s32_faustmann_rotation = 1,
  p32_rot_length_ac_eqivalent(t_all,j) = sum(ac,p32_rot_flg_faustmann(t_all,j,ac));
);

** We provide a upper limit of 90 years for commercial plantations.
** 90 years translates to age-class 18 (90/5)
p32_rot_length_ac_eqivalent(t_all,j)$(p32_rot_length_ac_eqivalent(t_all,j)>18) = 18;
p32_rot_length_ac_eqivalent(t_historical,j) = p32_rot_length_ac_eqivalent("y1995",j);

** Holding rotation lengths constant after the end of this century.
p32_rot_length_ac_eqivalent(t_future,j) = p32_rot_length_ac_eqivalent("y2100",j);

** Number of cells in each region
p32_ncells(i) = sum(cell(i,j),1);

**** Representative regional rotation
loop(t_all,
  p32_rotation_regional(t_all,i) = ceil(sum(cell(i,j), p32_rot_length_ac_eqivalent(t_all,j))/p32_ncells(i));
  p32_representative_rotation(t_all,i) = ord(t_all) + ceil(sum(cell(i,j),p32_rot_length_ac_eqivalent(t_all,j))/p32_ncells(i));
  );
*display p32_rotation_regional;
*display p32_representative_rotation;

** Earlier we converted rotation lengths to absolute numbers, now we make the Conversion
** back to rotation length in age-classes.
p32_rotation_cellular_estb(t_all,j) = ceil(p32_rot_length_ac_eqivalent(t_all,j));

* Shift rotations. E.g. rotations harvested in 2050 should be harvested with the rotations using which they were establsihed.
* For 2050 plantation establsihed in 2020 with 30y rotaions shall be harvested according to 30 yr (for example)

** Set harvesting rotations same as establishment rotations -- Don't move this line below extension of rotation. This is overwritten in the next loop anyways
p32_rotation_cellular_harvesting(t_all,j) = p32_rotation_cellular_estb(t_all,j);

** RL Extension
p32_rotation_cellular_estb(t_all,j) = p32_rotation_cellular_estb(t_all,j) * s32_rotation_extension ;

** With the following loop, harvesting rotations are updated based on the rotation length
** at which the establishment of plantations was made. For example, an establishment with
** 50 year rotation in mind in year 2000 shall be available for harvest when the age of
** this plantation is 50 years in 2050. The following loop makes sure that the harvesting
** age is updated correctly in the future.

loop(j,
  loop(t_all,
      p32_rotation_offset = p32_rotation_cellular_estb(t_all,j);
* The harvest year is calculated for future based on current establishment decision
      p32_rotation_cellular_harvesting(t_all+p32_rotation_offset,j) = p32_rotation_cellular_estb(t_all,j);
    );
  );

** This loop fixes empty gaps.
** For example in 2035, if establishment length was 10 (50yrs) then it should be harvested in 2085
** But in 2040, lets say if establishment length was 11 (55yrs) then the harvesting should happen in 2095.
** This leaves y2090 with a gap where model doens't know which value to choose
** At this point, it takes the values which were initilaized in lines above
** where we give harvested rotations the same value as establishment rotation to start with
** The loop below makes some educated guess based on jumps during these blind spots and fills them with proper numbers
loop(t_all,
  p32_rotation_cellular_harvesting(t_all+1,j)$(abs(p32_rotation_cellular_harvesting(t_all+1,j) - p32_rotation_cellular_harvesting(t_all,j))>2 AND ord(t_all)<card(t_all)) = p32_rotation_cellular_harvesting(t_all,j);
  );

** Rotation used for establishment decision.
p32_rot_length_ac_eqivalent(t_all,j) = p32_rotation_cellular_estb(t_all,j);

** Define protect and harvest setting
protect32(t,j,ac_sub) = no;
protect32(t,j,ac_sub) = yes$(ord(ac_sub) < p32_rotation_cellular_harvesting(t,j));

harvest32(t,j,ac_sub) = no;
harvest32(t,j,ac_sub) = yes$(ord(ac_sub) >= p32_rotation_cellular_harvesting(t,j));

** Afforestation policies NPI and NDCs
p32_aff_pol(t,j) = f32_aff_pol(t,j,"%c32_aff_policy%");

* Calculate the remaining exogenous afforestation with respect to the maximum exogenous target over time.
* `p32_aff_togo` is used to adjust `s32_max_aff_area` in the constraint `q32_max_aff`.
p32_aff_togo(t) = sum(j, smax(t2, p32_aff_pol(t2,j)) - p32_aff_pol(t,j));

* Adjust the afforestation limit `s32_max_aff_area` upwards, if it is below the exogenous policy target.
s32_max_aff_area = max(s32_max_aff_area, sum(j, smax(t2, p32_aff_pol(t2,j))) );

p32_cdr_ac(t,j,ac) = 0;
p32_cdr_ac_plant(t,j,ac) = 0;

** Initialize parameter
p32_land(t,j,type32,ac) = 0;

** divide initial forestry area by number of age classes within protect32
** since protect32 is TRUE for ord(ac_sub) < p32_rotation_cellular_estb(j) there is
** one additional junk which is assigned to ac0
if(s32_initial_distribution = 0,
** Initialize with highest age class and don't shift it when intitial distribution is off
  p32_land(t,j,"plant","acx") = pcm_land(j,"forestry");

elseif s32_initial_distribution = 1,
** Initialize with equal distribtuion in rotation age class
  p32_plant_ini_ac(j) = pm_land_start(j,"forestry")/p32_rotation_cellular_estb("y1995",j);
  p32_land("y1995",j,"plant",ac_sub)$(protect32("y1995",j,ac_sub)) = p32_plant_ini_ac(j);
  p32_land("y1995",j,"plant","ac0") = p32_plant_ini_ac(j);

** Initial shifting of age classes
  p32_land(t,j,"plant",ac)$(ord(ac) > 1) = p32_land(t,j,"plant",ac-1);
** Reset ac0 to zero
  p32_land("y1995",j,"plant","ac0") = 0;

  );
*display p32_land;
** Initialization of land
p32_land_start(j,type32,ac) = p32_land("y1995",j,type32,ac);

*fix bph effect to zero for all age classes except the ac that is chosen for the bph effect to occur after planting (e.g. canopy closure)
p32_aff_bgp(j,ac) = 0;
p32_aff_bgp(j,"%c32_bgp_ac%") = f32_aff_bgp(j,"%c32_aff_bgp%");

** Proportion of production coming from plantations
p32_plant_prod_share(t_ext,i) = f32_plant_prod_share("y2100");
p32_plant_prod_share(t_all,i) = f32_plant_prod_share(t_all);

**************************************************************************
