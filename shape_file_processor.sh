#! /bin/bash

##This script takes our processed shapefiles and turns them into GeoJSON and SQL files to be imported into PostGIS

# Clear the output directory
find output -name '*.geojson' -exec rm {} \;

#this automatically does file listing of everything that ends in shp
for var in $(find source -name '*.shp')
do
    file_name=$(basename $var)

    #find "shp" in var and replace with "pg.sql" and then store it as a variable
    output_pg=${file_name//shp/pg.sql}

    #find "shp" in var and replace with ".geojson" and then store it as a variable
    output_gjson=${file_name//shp/geojson}

    #strip the file name of "_final.shp" and store it in a variable
    table_name=${var%_final.shp}

    #use OGR to make geojson and put the output into a different directory
    ogr2ogr -f "GeoJSON" output/$output_gjson $var

    #need the postgis client tools for this one to work
    #take the files and output the sql files to a different directory
    shp2pgsql -s 4326 -I -D $var  $table_name > output/$output_pg

    printf ":%s\n" $table_name
done