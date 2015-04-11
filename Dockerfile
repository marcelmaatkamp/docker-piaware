FROM marcelmaatkamp/flightradar24-feeder

WORKDIR /gnuradio
RUN apt-get install -y tcl8.5-dev tclx8.4-dev itcl3-dev tcl-tls tcllib automake cmake tcl-tclreadline telnet git gcc make

RUN git clone https://github.com/flightaware/tcllauncher.git
WORKDIR /gnuradio/tcllauncher
RUN autoconf
RUN ./configure --with-tcl=/usr/lib/tcl8.5
RUN make
RUN make install

WORKDIR /gnuradio
RUN git clone https://github.com/flightaware/dump1090_mr.git
WORKDIR /gnuradio/dump1090_mr
RUN make
RUN make -f makefaup1090 all
RUN make -f makefaup1090 full-install

WORKDIR /gnuradio
RUN git clone https://github.com/flightaware/piaware.git
WORKDIR /gnuradio/piaware
RUN make install
