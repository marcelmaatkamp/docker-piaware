# docker-piaware
![RTLSDR setup](http://e1.flightcdn.com/adsb/images/piaware_with_antenna.jpg)

Want to build and run your own ADS-B ground station for USD$25 / EUR€20? With this docker image and a simple RTLSDR Dongle you can setup your own ADS-B ground station and track flights in real-time in a matter of minutes!

###Instructions: 
 * register for an account on [flightaware.com](http://flightaware.com)
 * insert a RTLSDR dongle
 * issue the following command: 
```
$ docker run -ti --privileged --env USERNAME=<username> --env PASSWORD=<password> marcelmaatkamp/piaware
```
 * you are now eligable for a premium account! 
