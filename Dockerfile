FROM marcelmaatkamp/flightradar24-feeder

WORKDIR /gnuradio
RUN apt-get update && apt-get install -y tcl8.5-dev tclx8.4-dev itcl3-dev tcl-tls tcllib automake cmake tcl-tclreadline telnet git gcc make

# clone_or_update https://github.com/mutability/mlat-client.git v0.2.4 $OUTDIR/mlat-client

RUN git clone https://github.com/flightaware/tcllauncher.git
WORKDIR /gnuradio/tcllauncher
RUN git checkout -q --detach 460debe4d350f06f9c7e54e5400992cac4f1d328 --
RUN autoconf
RUN ./configure --with-tcl=/usr/lib/tcl8.5
RUN make
RUN make install

WORKDIR /gnuradio
RUN git clone https://github.com/mutability/dump1090.git dump1090_mr
WORKDIR /gnuradio/dump1090_mr
RUN git checkout -q --detach faup1090-2.1-5 --
RUN apt-get install -y librtlsdr-dev libusb-1.0-0-dev pkg-config debhelper
RUN rm -rf /usr/local/lib/librtlsdr*
RUN dpkg-buildpackage -b
# RUN make
# RUN make -f makefaup1090 all
# RUN make -f makefaup1090 full-install

WORKDIR /gnuradio
RUN git clone https://github.com/flightaware/piaware.git
WORKDIR /gnuradio/piaware
RUN git checkout -q --detach 6a883f428912357c252654cb811499e58db87d3a --
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
