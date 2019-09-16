#----------------------------------------------------
#
# Old German style
#
#----------------------------------------------------
   
# we share boundaries with the "classic" mapnik OSM style
ln -s /home/maposmatic/shapefiles/world_boundaries/ .
   
# check out current stylesheet source
cd /home/maposmatic/styles
svn checkout http://svn.openstreetmap.org/applications/rendering/mapnik-german/
cd mapnik-german

# build transliterate function

cd utf8translit
make install
sudo -u maposmatic psql gis --command "CREATE FUNCTION transliterate(text) RETURNS text AS 'utf8translit', 'transliterate' LANGUAGE C STRICT;" 

cd ..

# create some extra database views
# for sql in views/*.sql
# do
#     sudo -u maposmatic psql gis < $sql
# done

# fix a SQL problem in the stylesheet:
sed -ie "s/ele,'FM9999D99'/ele::float,'FM9999D99'/g" osm-de.xml

# set up the actual stylesheet
/vagrant/files/tools/generate_xml.py \
          --host 'localhost' \
          --port 5432 \
          --dbname gis \
          --prefix planet_osm \
          --user maposmatic \
          --password 'secret' \
          --inc $(pwd)/inc-de \
          --world_boundaries /home/maposmatic/shapefiles/world_boundaries

