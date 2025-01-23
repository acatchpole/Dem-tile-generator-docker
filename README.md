# Dem-tile-generator-docker


example commands to create tiles:

1. ```gdalwarp -t_srs EPSG:3857 -co TILED=YES -dstnodata None -r cubic original_geotiff.tif dem_3857.tif```
2. ```rio rgbify -b -10000 -i 0.1 dem_3857.tif dem_3857_rgb.tif```
3. ```gdal2tiles.py --zoom=0-15 --xyz dem_3857_rgb.tif ./out_tiles```
