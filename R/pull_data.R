##' .. content for \description{} (no empty lines) ..
##'
##' .. content for \details{} ..
##'
##' @title

pull_data <- function() {

  NEON_site_list = StreamPULSE::query_available_data(region = 'all') %>%
    flatten %>% 
    data.frame %>% 
    dplyr::filter(contact == 'NEON') 
  
  NEON_site_codes = NEON_site_list %>%
    unite("site_code", region:site, remove = TRUE) %>%
    select(site_code) %>% 
    unlist
  
  NEON_site_sub = NEON_site_codes[NEON_site_codes %ni% c("AK_TOOK-down", "AL_BLWA-down")]

  NEON_data_list = map(NEON_site_sub, ~StreamPULSE::request_data(sitecode = .x))
  
  NEON_data_list = setNames(NEON_data_list, nm = NEON_site_sub)

  return(NEON_data_list)
}
