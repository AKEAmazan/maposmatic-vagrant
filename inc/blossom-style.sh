#! /bin/bash

cd /home/maposmatic/styles

git clone https://github.com/stekhn/blossom

cd blossom 

sed '/"name":/d' < project.mml > osm.mml
carto -a 3.0.12 -l osm.mml | sed -e 's/\[osm\]/\[gis\]/g' > osm.xml

cat <<EOF >> /home/maposmatic/ocitysmap/ocitysmap.styledefs
[blossom]
name: Blossom
description: Blossom style by Steffen Kühne
path: /home/maposmatic/styles/blossom/osm.xml

EOF

echo "  blossom," >> /home/maposmatic/ocitysmap/ocitysmap.styles

