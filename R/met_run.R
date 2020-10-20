##' .. content for \description{} (no empty lines) ..
##'
##' .. content for \details{} ..
##'
##' @title
##' @param NEON_data
met_run <- function(NEON_data) {

  model_type = 'bayes'
  
  model_name = 'streamMetabolizer'
  
  prepped_data_list = map(NEON_data, ~ prep_metabolism(d = .x, type = model_type, model = model_name, retrieve_air_pres = TRUE, rm_flagged = 'none', estimate_PAR = TRUE))

}
