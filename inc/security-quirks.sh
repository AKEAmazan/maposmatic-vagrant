#! /bin/bash 

# see https://askubuntu.com/questions/1081895/trouble-with-batch-conversion-of-png-to-pdf-using-convert
sed -i '/PDF/d' /etc/ImageMagick-6/policy.xml
