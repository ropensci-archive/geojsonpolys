#' @title geojsonpolys
#'
#' @description GeoJSON Polygons. Most data provided in this package is of 
#' the smallest resolution of the options provided, except for the US 
#' country level outline [gsp_states] of which we provide all three 
#' resolutions. higher resolution options for states and counties 
#' will likely come in a future version of this package.
#' 
#' Data is from http://eric.clst.org/tech/usgeojson/, which was taken 
#' originally from United States Census Cartographic Boundary Files 
#' (https://www.census.gov/geo/maps-data/data/tiger-cart-boundary.html)
#'
#' @name geojsonpolys-package
#' @author Scott Chamberlain
#' @aliases geojson
#' @docType package
#' @keywords package
#' 
#' @examples
#' length(gsp_us)
#' names(gsp_us)
#' length(gsp_counties)
#' names(gsp_counties)
#' gsp_counties[1]
#' gsp_counties$alabama
#' gsp_counties$alabama$walker
#' head(gsp_counties_df)
NULL



#' US outline as GeoJSON
#'
#' @docType data
#' @keywords datasets
#' @format named list of GeoJSON strings, one for each of three levels 
#' of resolution:
#' 
#' - us_20m: least detailed, resolution of 1:20,000,000 
#' - us_5m: medium detail, resolution of 1:5,000,000
#' - us_500k: most detailed, resolution of 1:500,000
#' 
#' @name gsp_us
NULL

#' US states as GeoJSON
#'
#' @docType data
#' @keywords datasets
#' @format named list of GeoJSON strings, one for each state in the USA. 
#' top level list names are states. Length: 52. Data here is 20m resolution
#' @name gsp_states
NULL

#' US counties as GeoJSON
#'
#' @docType data
#' @keywords datasets
#' @format named list of GeoJSON strings, one for each county in the USA. 
#' top level list names are states, then counties within each state. 
#' Length: 52. Total number of counties: 3221. Data here is 20m resolution
#' @name gsp_counties
NULL

#' US counties as GeoJSON, in a data.frame with metadata
#'
#' @docType data
#' @keywords datasets
#' @format data.frame of GeoJSON strings, one for each county in the USA.
#' Rows: 3221. Columns: 5. Data here is 20m resolution
#' @details Columns:
#' 
#' - state_code: state FIPS code
#' - state: state name
#' - county_code: county FIPS code
#' - county: county name
#' - geojson: GeoJSON as character
#' 
#' @name gsp_counties_df
NULL

#' US congressional districts as GeoJSON, in a data.frame with metadata
#'
#' @docType data
#' @keywords datasets
#' @format data.frame of GeoJSON strings, one for each congressional district.
#' Rows: 437. Columns: 8. Data here is 20m resolution
#' @details Columns:
#' 
#' - geo_id
#' - state: name of the state
#' - state_code: state FIPS code
#' - cd
#' - name
#' - lsad
#' - censusarea
#' - geojson: GeoJSON as character
#' 
#' @name gsp_congressional_df
NULL
