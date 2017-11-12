# **PPBstats 0.23 under process**
### update fonctions
- format_data_PPBstats.R : 
    - when date, add a column with julian day, cf #65
    - add type data_organo_napping and data_organo_hedonic, cf #72
    - format data for data_network, cf #65
        - add code regarding network_split arg
        - better differentiate year, relation_year_start and relation_year_end : cf Rd
    - describe_data.data_agro.R : add raster arg for plot_type, cf #68
    - debugs several functions regarding tests
- plot.mean_comparisons_model_1.R
    - improve display of score : cf #61
- plot.parameter_groups.R:
    - model 2 ACP cluster : put in blod or color a given ind, cf #76

### add new functions
- napping.R, cf #72
- hedonic.R, cf #72
- PPBstats_interface.R, cf #64
- /inst/shiny_interface/agro/server.R, cf #64
- /inst/shiny_interface/agro/ui.R, cf #64
- format_data_PPBstats.format_network.R, cf #65
- format_data_PPBstats.format_agro.R, cf #65
- format_data_PPBstats.format_agro_version.R, cf #65
- format_data_PPBstats.format_organo_napping.R, cf #65
- format_data_PPBstats.format_organo_hedonic.R, cf #65
- plot.data_network.R, cf #67

### vignette
- update text (cf #76)
  
  
# **PPBstats 0.22**
### update functions
- model_1.R : 
     - correct bug model_1 (cf #60)
     - better plot for score regarding model 1 (cf #61)
- workflow regarding spatial analysis : improve and debug
- update workflow regarding variance_intra model (cf #28, #29, #30, #31, #32) but still work to do : cf #62
- plot.parameter_groups.R : split plot ACP cluster (cf #47) + update Rd in plot.PPBstats.R
- describe_data.R : create class

### add new functions
- format_data_PPBstats.R
- describe_data.data_agro.R : huge refactoring, cf #68
- describe_data.data_network.R : empty from now
- multivariate.R

### vignette
- update text (typo + format_data_PPBstats + cf #36, #47, #68)
- add new section on variance_intra + update workflow figure, functions table, analysis families
- update multivariate analysis section
- update contributions
  

# **PPBstats 0.21**
### update functions
- ggplot_mean_comparisons_model_1.R
- ggplot_mean_comparisons_predict_the_past_model_2.R : cf #34
- model_1.R
- fix typo (cf #53)
- rename file .R in order to have same name of files and functions

### update RData
- Add the date in format of data #48

- add new functions that implement spatial analysis (cf #20)
    - spatial.R 
    - check_model.fit_model_spatial.R
    - plot.check_model_spatial.R
    - mean_comparisons.check_model_spatial.R
    - plot.mean_comparisons_model_spatial.R
  
### vignette
- update text, fix typo, update fig (cf #20, #34, #49)
- add section on spatial analysis
- add Rmd regarding contributions
  

# **PPBstats 0.20** 
- substitute get_ggplot() by plot() methods (#21)
- update vignette and cached results


# **PPBstats 0.19** 
### update functions
- add add_stars_version() in ggplot_mean_comparisons_model_1.R (cf #35)
- ok + update vignette (cf #51)

  
# **PPBstats 0.18** 
### update vignette
- cf #36 : add decision tree + update
- reorganise introduction of agro section

# **PPBstats 0.17** 
### add new functions
- model_variance_intra.R
- check_model_model_variance_intra.R
- ggplot_check_model_model_variance_intra.R
- mean_comparisons_model_variance_intra.R 

### update function
- check_model_model_1.R : add location and year for data_env_whose_param_did_not_converge
- ggplot_parameter_groups.R & parameter_groups.R : change kmeans methods for HCPC
- ggplot_mean_comparisons_model_1.R : little debug

### update vignette
- changes in text and exemple regarding functions udaptes


# **PPBstats 0.16** 
### update functions
- predict_the_past_model_2.R : add estimated and predicted MCMC + parameter statuts
- mean_comparisons_predict_the_past_model_2.R : add parameter statuts in mean comparisons outputs

### update vignette
- remind to install JAGS
- add R version
- new sections : network, agronomic, organoleptic and molecular
- add IBD analysis section
  

# **PPBstats 0.15** 
### update functions
- biplot_GxE.R and ggplot_biplot_GxE.R : add interaction matrix
- GxE.R and GxE_build_interaction_matrix.R : model writing

### update vignette
- regarding changes in R code
- spelling 
- contributions and aknowledgement


# **PPBstats 0.14** 
Huge refactoring of the code in several functions for each steps of the analysis

### rename function
- analyse.outputs.R becomes check_model.R
- get.parameter.groups.R becomes parameter.groups.R
- get.mean.comparisons.R becomes mean.comparisons.R
- MC.R becomes model_1.R
- FWH.R becomes model_2.R
- cross.validation.R becomes cross_validation_model_2.R
- predict.the.past.R becomes predict_the_past_model_2.R
- get.ggplot.R becomes get_ggplot.R

### add new functions
- biplot_GxE.R
  
- check_model_model_1.R
- check_model_model_2.R
- check_model_GxE.R
  
- mean_comparisons_GxE.R
- mean_comparisons_model_1.R
- mean_comparisons_model_2.R
- mean_comparisons_predict_the_past_model_2.R
  
- parameter_groups_GxE.R
- parameter_groups_model_2.R
  
- ggplot_biplot_GxE.R
- ggplot_check_model_model_1.R
- ggplot_check_model_model_2.R
- ggplot_check_model_GxE.R
- ggplot_mean_comparisons_GxE.R
- ggplot_parameter_groups.R
- ggplot_cross_validation_model_2.R
- ggplot_predict_the_past_model_2.R
- ggplot_mean_comparisons_predict_the_past_model_2.R

### delete functions
- ggplot_LSDgroup

### vignette
- update regarding changes in R code


# **PPBstats 0.13** 
### add new functions
- describe_data.R
- extra_functions.R
- design_experiment.R
- ggplot_which_won_where.R
- ggplot_mean_vs_stability.R
- ggplot_discrimitiveness_vs_representativeness.R

### rename function
- AMMI.R becomes GxE.R
  
### update functions
- MC.R
- get.ggplot.R: manage nb_parameters_per_plot for ggplot.type == "biplot-alpha-beta"
- get.significant.group.R
- get.PPBstats.data.R

### vignette
- refactor the code
- add new sections


# **PPBstats 0.12** 
- delete all the pdf in the file that are generated by Rnw 
in order to earn space on github

- change the nomenclature of the version


# **PPBstats 0.11.1** 
- update some little bugs regarding tests

### update functions
- get.ggplot.R
     - debug data_version regarding real data set
    

# **PPBstats 0.11.0** 
- update some little bugs regarding tests

### update the vignette
- add example for data_version
- add example for ggplot.type = "biplot-alpha-beta"
  

# **PPBstats 0.10.2** 
### update functions
- get.ggplot.R
     - add data_2 argument
     - add ggplot.type = "biplot" which is possible for model 2


# **PPBstats 0.10.1** 
- update some little bugs regarding tests

### update functions
- get.ggplot.R : add data_version argument
- get.mean.comparisons.R
- predict.the.past.R : take into account when there are no parameters in the MCMC
  
### add new functions
- AMMI.R
- AMMI_called_functions.R

### add new data set
- data_version.RData
  

# **PPBstats 0.10.0** 
### vignette
- update the vignette following previous developments


# **PPBstats 0.9.2** 
- fix little bugs
- add the presence.absence.matrix for the model in FWH, analyse.outputs and predict.the.past
- add model1.data_env_whose_param_did_not_converge in analyse.outputs and get.ggplot
- return MCMC only for parameters that converge
- possible to choose NULL for get.at.least.X.groups
- "cluster" is displayed in the legend for ggplots from get.parameter.groups
- fix huge bug in MC where the mean of the observation were not correctly done


# **PBstats 0.9.1** 
- little changes in vignette and readme
- little changes in the comments of some functions


# **PPBstats 0.9** 
- first version on Github