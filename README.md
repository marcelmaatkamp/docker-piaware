# piaware
![RTLSDR setup](http://e1.flightcdn.com/adsb/images/piaware_with_antenna.jpg)

Want to build and run your own ADS-B ground station for USD$10? With this docker image and a simple RTLSDR dongle you can setup your own ADS-B ground station and track flights in real-time in a matter of minutes! This software makes you eligable for a [premium account worth $89/month](http://flightaware.com/commercial/premium) on [flightaware.com](http://flightaware.com) 

This is a docker image with [http://nl.flightaware.com/adsb/piaware/](http://nl.flightaware.com/adsb/piaware/)

###Installation instructions: 
 * register for an account on [flightaware.com](http://flightaware.com) and get a username & password
 * insert a RTLSDR dongle
 * issue the following command: 
```
$ docker run -d \
  --name piaware \
  --privileged \
  -p 30003:30003 \
  -p 30005:30005 \
  -p 8080:8080 \
  -p 8754:8754 \
  --env USERNAME=<username> \
  --env PASSWORD=<password> \
  marcelmaatkamp/piaware
```
 * you are now eligable for a [premium account worth $89/month](http://flightaware.com/commercial/premium)! 
