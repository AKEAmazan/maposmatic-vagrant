#----------------------------------------------------
#
# MapOSMatic web frontend installation & configuration
#
#----------------------------------------------------

# get maposmatic web frontend
cd /home/maposmatic
git clone https://github.com/hholzgra/maposmatic.git
cd maposmatic
git checkout site-osm-baustelle

# install dependencies
bower --allow-root install
wget -O www/static/js/leaflet-omnivore.min.js http://api.tiles.mapbox.com/mapbox.js/plugins/leaflet-omnivore/v0.3.1/leaflet-omnivore.min.js

# create needed directories and tweak permissions
mkdir -p logs rendering/results    

# copy config files
cp $FILEDIR/config.py scripts/config.py
cp $FILEDIR/settings_local.py www/settings_local.py
cp $FILEDIR/maposmatic.wsgi www/maposmatic.wsgi

# init MaposMatics housekeeping database
python manage.py makemigrations maposmatic
python manage.py migrate

# set up translations
cd www/maposmatic
django-admin compilemessages
cd ../..

# fix directory ownerships
chown -R maposmatic /home/maposmatic
chgrp www-data logs www www/datastore.sqlite3
chmod   g+w    logs www www/datastore.sqlite3
mkdir media
chgrp www-data media

# set up render daemon
cp $FILEDIR/maposmatic-render.service /lib/systemd/system
chmod 644 /lib/systemd/system/maposmatic-render.service
systemctl daemon-reload
systemctl enable maposmatic-render.service
systemctl start maposmatic-render.service

# set up web server
service apache2 stop
cp $FILEDIR/000-default.conf /etc/apache2/sites-available
service apache2 start
    
