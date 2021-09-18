#----------------------------------------------------
#
# Fetch old pre-Carto OSM Mapnik stylesheed
#
# we won't really use it as it is outdated, but we need its symbol dir
# for the maposmatic printable stylesheet later
#
#----------------------------------------------------

    cd /home/maposmatic/styles

    git clone https://github.com/openstreetmap/mapnik-stylesheets mapnik2-osm
    cd mapnik2-osm
    ln -s /home/maposmatic/shapefiles/world_boundaries .

    cp /vagrant/files/styles/mapnik2-osm/* inc

    cd ..

