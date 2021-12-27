## code to prepare `parc` dataset goes here
library(sf)
library(raster)

parc <- read_sf("data-raw/parcelle_adj.shp")

r <- raster("data-raw/mnt_par_adj/")
r <- readAll(r)
s <- terrain(r,opt = c("slope", "aspect", "TPI", "TRI") )
scrop <- crop(s,parc)
scrop <- mask(scrop,parc)

rcrop <- crop(r,parc)
rcrop <- crop(rcrop,parc)

usethis::use_data(parc, overwrite = TRUE)
usethis::use_data(scrop, overwrite = TRUE)
usethis::use_data(rcrop, overwrite = TRUE)
