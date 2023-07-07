#----------------------------------------------------
#
# HikeBikeMap style
#
#----------------------------------------------------

cd $STYLEDIR

# correct HikeBikeMap style is on DropBox:
# https://www.dropbox.com/s/ykarpeq2jr0vh6e/hikebikemap-carto-0.9.tbz
# we use a mirrored file here:
wget https://get-map.org/downloads/hikebikemap-carto-0.9.tbz
tar -xf hikebikemap-carto-0.9.tbz
mv hikebikemap-carto-0.9 hikebikemap-carto

# the version in Git is *not* the correct one
#git clone --quiet https://github.com/cmarqu/hikebikemap-carto.git

cd hikebikemap-carto/

ln -s $SHAPEFILE_DIR data

# remove deprecated name attributes from layers to silence carto warnings
sed -i '/"name":/d' project.mml

# convert CartoCSS to Mapnil XML
carto --quiet --api $MAPNIK_VERSION_FOR_CARTO project.mml > osm.xml

