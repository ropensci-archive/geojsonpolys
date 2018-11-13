geojsonpolys
============



[![Project Status: WIP – Initial development is in progress, but there has not yet been a stable, usable release suitable for the public.](https://www.repostatus.org/badges/latest/wip.svg)](https://www.repostatus.org/#wip)
[![Build Status](https://travis-ci.com/ropenscilabs/geojsonpolys.svg?branch=master)](https://travis-ci.com/ropenscilabs/geojsonpolys)


`geojsonpolys` provides GeoJSON polygons of political boundaries - GeoJSON you some data.

No dependenciez.

Data from <http://eric.clst.org/tech/usgeojson/>, which were converted from files from the United States
Census Cartographic Boundary Files (<https://www.census.gov/geo/maps-data/data/tiger-cart-boundary.html>).

Contains data for the US only:

- US polygon
- states polygons
- counties polygons
- congressional polygons

## Installation

CRAN version


```r
install.packages("geojsonpolys")
```

Dev version


```r
devtools::install_github("ropenscilabs/geojsonpolys")
```


```r
library("geojsonpolys")
```

## Get you some geojson

There's two datasets in the package so far. 

One `gsp_counties` is a character vector of GeoJSON for each county in the US. For example:


```r
gsp_counties$alabama$blount
#> [1] "{\"type\":\"Feature\",\"properties\":{\"GEO_ID\":\"0500000US01009\",\"STATE\":\"01\",\"COUNTY\":\"009\",\"NAME\":\"Blount\",\"LSAD\":\"County\",\"CENSUSAREA\":644.776},\"geometry\":{\"type\":\"Polygon\",\"coordinates\":[[[-86.577799,33.765316],[-86.759144,33.840617],[-86.953664,33.815297],[-86.954305,33.844862],[-86.96296,33.844865],[-86.963358,33.858221],[-86.924387,33.909222],[-86.793914,33.952059],[-86.685365,34.05914],[-86.692061,34.092654],[-86.599632,34.119914],[-86.514881,34.25437],[-86.45302,34.259317],[-86.303516,34.099073],[-86.332723,33.986109],[-86.370152,33.93977],[-86.325622,33.940147],[-86.377532,33.861706],[-86.577528,33.801977],[-86.577799,33.765316]]]}}"
```

`gsp_counties_df` is a data.frame with the GeoJSON but also with metadata for states and counties, which
can make it easier to pick out the GeoJSON you want. (if you load `tibble` you get a brief data.frame 
output)


```r
library(tibble)
gsp_counties_df
#> # A tibble: 3,221 x 5
#>    state_code state  county_code county  geojson                          
#>    <chr>      <chr>  <chr>       <chr>   <chr>                            
#>  1 01         Alaba… 001         Autauga "{\"type\":\"Feature\",\"propert…
#>  2 01         Alaba… 009         Blount  "{\"type\":\"Feature\",\"propert…
#>  3 01         Alaba… 017         Chambe… "{\"type\":\"Feature\",\"propert…
#>  4 01         Alaba… 021         Chilton "{\"type\":\"Feature\",\"propert…
#>  5 01         Alaba… 033         Colbert "{\"type\":\"Feature\",\"propert…
#>  6 01         Alaba… 045         Dale    "{\"type\":\"Feature\",\"propert…
#>  7 01         Alaba… 051         Elmore  "{\"type\":\"Feature\",\"propert…
#>  8 01         Alaba… 065         Hale    "{\"type\":\"Feature\",\"propert…
#>  9 01         Alaba… 079         Lawren… "{\"type\":\"Feature\",\"propert…
#> 10 01         Alaba… 083         Limest… "{\"type\":\"Feature\",\"propert…
#> # ... with 3,211 more rows
```

## do something

Multnomah is a county in Oregon that contains Portland


```r
library(geojsonio)
multnomah <- gsp_counties_df[gsp_counties_df$county == "Multnomah", "geojson"]
geojsonio::map_leaf(multnomah)
```

![multnomah](tools/multnomah.png)

## Meta

* Please [report any issues or bugs](https://github.com/ropenscilabs/geojsonpolys/issues).
* License: MIT
* Get citation information for `geojsonpolys` in R doing `citation(package = 'geojsonpolys')`
* Please note that this project is released with a [Contributor Code of Conduct](CODE_OF_CONDUCT.md).
By participating in this project you agree to abide by its terms.

[![rofooter](https://www.ropensci.org/public_images/github_footer.png)](https://ropensci.org)
