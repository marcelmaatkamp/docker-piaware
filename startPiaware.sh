#!/bin/bash

echo "user $USERNAME" > /root/.piaware
echo "password $PASSWORD" >> /root/.piaware

/gnuradio/dump1090_mr/dump1090 --gain -10 --net --enable-agc --aggressive --quiet &
/usr/bin/piaware
