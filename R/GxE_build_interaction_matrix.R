#' Compute interaction matrix for AMMI or GGE model
#'
#' @description
#' \code{GxE_build_interaction_matrix} computes interaction matrix for AMMI or GGE model
#' 
#' @param data The data frame on which the model is run. It should have at least the following columns : c("year", "germplasm", "location", "block", "X", "Y", "..."), with "..." the variables.
#' 
#' @param gxe_analysis the analysis to carry out: "AMMI" or "GGE"
#' 
#' @details The computation is inspired from \code{agricolae::AMMI}. 
#' Another way to do was explored but did not succeed regarding missing data. 
#' The code is inside the function within a if(FALSE){}.
#' 
#' @return 
#' The function returns the interaction matrix
#' 
#' @author 
#' Pierre Riviere
#' 
#' @seealso \code{\link{model_GxE}}
#' 
#' @import stats
#' 
#' @export
#' 
GxE_build_interaction_matrix = function(
  data, 
  gxe_analysis
  )
  {
  match.arg(gxe_analysis, c("AMMI", "GGE"), several.ok = FALSE)
  
  if(nlevels(data$year) > 1) { 
    if( gxe_analysis == "AMMI"){
      model = stats::lm(variable ~ germplasm + location + block %in% year:location + year + year:germplasm + year:location , data = data)
    }
    if( gxe_analysis == "GGE"){
      model = stats::lm(variable ~ location + block %in% location + year + year:germplasm + year:location, data = data)
    }
  } else {
    if( gxe_analysis == "AMMI"){
      model = stats::lm(variable ~ germplasm + location + block %in% location, data = data)
    }
    if( gxe_analysis == "GGE"){
      model = stats::lm(variable ~ location + block %in% location, data = data)
    }
  }
  
  data$residuals = stats::residuals(model)
  Mgxe_by = by(data[, "residuals"], data[, c("germplasm", "location")], function(x) sum(x,na.rm = TRUE))
  Mgxe = data.frame()
  for(i in 1:nrow(Mgxe_by)){ for(j in 1:ncol(Mgxe_by)){ Mgxe[i,j] = Mgxe_by[i,j] }}
  colnames(Mgxe) = colnames(Mgxe_by)
  rownames(Mgxe) = rownames(Mgxe_by)
  
  if(FALSE){
    c = model$coefficients
    
    # germplasm x location ----------
    coef_gxe = c[grep("germplasm", names(c))]
    coef_gxe = coef_gxe[grep(":", names(coef_gxe))]
    coef_gxe[which(is.na(coef_gxe))] = 0 # If NA, it means that coef is not defined because of singularities, then it means no interaction, so 0 based on the construction of the model.
    
    Mgxe = as.data.frame(matrix(NA, ncol = length(model$xlevels$location), nrow = length(model$xlevels$germplasm)))
    colnames(Mgxe) = paste("env", c(1:length(model$xlevels$location)), sep="")
    rownames(Mgxe) = paste("germ", c(1:length(model$xlevels$germplasm)), sep="")
    
    compteur = 1
    for(i in 1:(length(model$xlevels$location)-1)){
      for(j in 1:(length(model$xlevels$germplasm)-1)){
        Mgxe[j,i] = coef_gxe[compteur]
        compteur = compteur + 1
      }
    }
    
    rownames(Mgxe) = model$xlevels$germplasm
    colnames(Mgxe) = model$xlevels$location
    
    # Get element of the interaction matrix that must not be estimated because the data do no exist
    w = as.data.frame(with(data, table(year, location, germplasm)))
    
    a = w$Freq == 0
    b = as.character(w$germplasm) == as.character(model$xlevels$germplasm[length(model$xlevels$germplasm)])
    c = as.character(w$location) == as.character(model$xlevels$location[length(model$xlevels$location)])
    w = w[which(a & (b|c)),]
    
    if(nrow(w)>0){
      for(i in 1:nrow(w)){ Mgxe[as.character(w[i,"germplasm"]), as.character(w[i, "location"])] = 0 }
      
      # Knowing this, correct the col or row to set the constrains sum = 0
      a = Mgxe[as.character(w[i,"germplasm"]), 1:(ncol(Mgxe) - 1)]
      x = 0 - sum(a)
      Mgxe[as.character(w[i,"germplasm"]), 1:(ncol(Mgxe)-1)] = a + x/3
    }
    # quid si 0 aussi dans SH JEV et AML? ... A tester ! ----------
    
    for(i in 1:nrow(Mgxe)){
      if(is.na(Mgxe[i, ncol(Mgxe)])) { Mgxe[i, ncol(Mgxe)] = 0 - sum(Mgxe[i, 1:(ncol(Mgxe)-1)])}
    }
    
    for(j in 1:ncol(Mgxe)){
      if(is.na(Mgxe[nrow(Mgxe),j])) { Mgxe[nrow(Mgxe), j] = 0 - sum(Mgxe[1:(nrow(Mgxe)-1), j])}
    }
  }

  return(Mgxe)
}


