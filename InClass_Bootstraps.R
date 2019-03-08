data(mtcars)

automatic <- mtcars %>% 
  filter(am == 0) 

manual <- mtcars %>% 
  filter(am == 1) 

boots_automatic <- replicate(1000, sample(automatic$hp, replace = TRUE), simplify = FALSE)

boots_manual <- replicate(1000, sample(manual$hp, replace = TRUE), simplify = FALSE)

my_stats_automatic <-map_dbl(boots_automatic, mean)


my_stats_manual <- map_dbl(boots_manual, mean)


conf_int <- my_stats_automatic - my_stats_manual

conf <- quantile(conf_int, c(0.025, 0.975))


