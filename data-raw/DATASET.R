## code to prepare `parc` dataset goes here
library(sf)
library(raster)
r <- raster("../data/mnt_par_adj/")
s <- terrain(r,opt = c("slope", "aspect", "TPI", "TRI") )
scrop <- crop(s,parc)
scrop <- mask(scrop,parc)

rcrop <- crop(r,parc)
rcrop <- crop(rcrop,parc)

usethis::use_data(parc, overwrite = TRUE)
usethis::use_data(scrop, overwrite = TRUE)
usethis::use_data(rcrop, overwrite = TRUE)
