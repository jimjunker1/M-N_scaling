the_plan <-
  drake_plan(

   ## Plan targets in here.

    NEON_data = pull_data(),
    
    NEON_site_metab = met_run(NEON_data),
    
)
