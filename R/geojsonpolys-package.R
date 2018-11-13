#' @title geojsonpolys
#'
#' @description GeoJSON Polygons. Data provided in this package is of 
#' the smallest size of the options provided, and the least resolution.
#' If you want 
#'
#' @name geojsonpolys-package
#' @author Scott Chamberlain
#' @aliases geojson
#' @docType package
#' @keywords package
#' 
#' @examples
#' length(gsp_counties)
#' gsp_counties[1]
#' gsp_counties$alabama
#' gsp_counties$alabama$walker
#' head(gsp_counties_df)
NULL

#' US states as GeoJSON
#'
#' @docType data
#' @keywords datasets
#' @format named list of GeoJSON strings, one for each state in the USA. 
#' top level list names are states. 
#' Length: 52
#' @name gsp_states
NULL

#' US counties as GeoJSON
#'
#' @docType data
#' @keywords datasets
#' @format named list of GeoJSON strings, one for each county in the USA. 
#' top level list names are states, then counties within each state. 
#' Length: 52. Total number of counties: 3221
#' @name gsp_counties
NULL

#' US counties as GeoJSON, in a data.frame with metadata
#'
#' @docType data
#' @keywords datasets
#' @format data.frame of GeoJSON strings, one for each county in the USA.
#' Rows: 3221. Columns: 5. 
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
