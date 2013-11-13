This repo contains data and code for geolocation search and visualization

* shape_file_processor.sh - Iterates recursively over the 'source' directory for all .shp files and using ogr2ogr creates a geojson file and a pg.sql for importing data into PostgreSQL
* source - Contains raw data from http://www.zillow.com/howto/api/neighborhood-boundaries.htm
* output - Contains output from bash script


Dependencies
____________
* brew install gdal (http://www.gdal.org/)
* brew install postgis (http://live.osgeo.org/en/quickstart/postgis_quickstart.html)