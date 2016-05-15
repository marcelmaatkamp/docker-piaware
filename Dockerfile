FROM marcelmaatkamp/flightradar24-feeder

WORKDIR /gnuradio
RUN apt-get update && apt-get install -y tcl8.5-dev tclx8.4-dev itcl3-dev tcl-tls tcllib automake cmake tcl-tclreadline telnet git gcc make

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

ADD startPiaware.sh /gnuradio/piaware/startPiaware.sh

EXPOSE 10001
EXPOSE 30001
EXPOSE 30002
EXPOSE 30003
EXPOSE 30004
EXPOSE 30005

EXPOSE 8080

ENTRYPOINT /gnuradio/piaware/startPiaware.sh
