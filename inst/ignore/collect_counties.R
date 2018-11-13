# biggest
# butte <- jq(url("http://eric.clst.org/assets/wiki/uploads/Stuff/gz_2010_us_050_00_500k.json"), '.features[] | select(.properties.NAME == "Butte" and .properties.STATE == "06")')
# smallest
library(jqr)
counties_smallest <- "http://eric.clst.org/assets/wiki/uploads/Stuff/gz_2010_us_050_00_20m.json"
counties <- jq(url(counties_smallest), '.')
counties_us <- jq(counties, '.features[]')
save(counties_us, file = "data/counties_us.rda", compress = "xz")

# as a data.frame, named by state and county
library(dplyr)
df <- tbl_df(bind_rows(lapply(counties_us, function(z) {
  data.frame(
    state_code = geojson:::asc(jq(z, ".properties.STATE")), 
    county_code = geojson:::asc(jq(z, ".properties.COUNTY")),
    county = geojson:::asc(jq(z, ".properties.NAME")),
    geojson = z,
    stringsAsFactors = FALSE
  )
})))
# match with state names
states_smallest <- 'http://eric.clst.org/assets/wiki/uploads/Stuff/gz_2010_us_040_00_20m.json'
sts <- jsonlite::fromJSON(states_smallest)
stsprops <- sts$features$properties

counties_us_df <- df %>% 
  left_join(stsprops, by = c("state_code" = "STATE")) %>% 
  select(state_code, NAME, county_code, county, geojson) %>% 
  rename(state = NAME)

# save to data/
gsp_counties_df <- counties_us_df
save(gsp_counties_df, file = "data/gsp_counties_df.rda", compress = "xz")


# counties as a named list
counties_us_list <- apply(counties_us_df, 1, function(z) {
  stats::setNames(
    list(stats::setNames(list(z[['geojson']]), gsub("\\s", "_", tolower(z[['county']])))),
    gsub("\\s", "_", tolower(z[['state']]))
  )
})
out <- list()
st_names <- unique(names(unlist(counties_us_list, FALSE)))
for (i in seq_along(st_names)) {
  prune <- Filter(function(z) names(z) == st_names[i], counties_us_list)
  out[[ st_names[i] ]] <- unlist(unname(unlist(prune, FALSE)), FALSE)
}
gsp_counties <- out
save(gsp_counties, file = "data/gsp_counties.rda", compress = "xz")



## states
### get states as a vector
states_smallest <- 'http://eric.clst.org/assets/wiki/uploads/Stuff/gz_2010_us_040_00_20m.json'
st <- jq(url(states_smallest), '.')
stst <- jq(st, '.features[]')
### add names
gsp_states <- list()
for (i in seq_along(stst)) {
  nm <- gsub("\\s", "_", tolower(gsub("\"", "", unclass(jq(stst[i], '.properties.NAME')))))
  gsp_states[[ nm ]] <- stst[i]
}
save(gsp_states, file = "data/gsp_states.rda", compress = "xz")
