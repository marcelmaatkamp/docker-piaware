FROM marcelmaatkamp/flightradar24-feeder

RUN apt-get install -y tcl8.5-dev tclx8.4-dev itcl3-dev tcl-tls tcllib automake cmake tcl-tclreadline telnet git gcc make
RUN apt-get install -y tcl8.5-doc tclx8.4-doc itcl3-doc
WORKDIR /gnuradio
RUN git clone https://github.com/flightaware/piaware.git
WOKDIR piaware
RUN make install
