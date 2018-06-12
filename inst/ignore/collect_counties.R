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
save(counties_us_df, file = "data/counties_us_df.rda", compress = "xz")
