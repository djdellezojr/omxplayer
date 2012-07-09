omxplayer-native-build
======================

OMXPlayer is a commandline OMX player for the Raspberry Pi. It was developed as
a testbed for the XBMC Raspberry PI implementation and is quite handy to use
standalone. 

omxplayer-native-build is a fork from the original omxplayer located at: 
https://github.com/huceke/omxplayer/. The Makefiles in this project have been
customized to support building the project on the Raspberry Pi, instead of 
cross-compiling them on another machine. 

Other differences:

The default output is HDMI, so using omxplayer -o hdmi video.mp4, is not necessary,
just omxplayer video.mp4. On the other hand, if you want audio output from the 
jack, then you need to use omxplayer -o local video.mp4.

The default location for the project to be downloaded and built from is /usr/local/src
on the Raspberry Pi.

The default location for the omxplayer script and omxplayer.bin is /usr/local/bin instead
of /usr/bin.

The default location for the ffmpeg libraries is /usr/local/lib instead of /usr/lib/omxplayer.

The Raspberry Pi firmware library is downloaded from it's github repository and used during the build.

The build of ffmpeg using the optimized libraries is performed.


Downloading omxplayer-native-build
----------------------------------

    sudo chown pi:pi /usr/local/src
    cd /usr/local/src
    git clone git://github.com/wrightrocket/omxplayer-native-build.git

Compiling omxplayer-native-build
--------------------------------

    cd /usr/local/src/omxplayer-native-build
    make git
    make -f Makefile.ffmpeg
    make

    

Installing omxplayer-native-build
---------------------------------

If you have completed compiling omxplayer-native-build, then 

    make dist
    sudo make install
    

Using omxplayer-native-build
----------------------------

    Usage: omxplayer [OPTIONS] [FILE]
    Options :
             -h / --help                    print this help
             -a / --alang language          audio language        : e.g. ger
             -n / --aidx  index             audio stream index    : e.g. 1
             -o / --adev  device            audio out device      : e.g. hdmi/local
             -i / --info                    dump stream format and exit
             -s / --stats                   pts and buffer stats
             -p / --passthrough             audio passthrough
             -d / --deinterlace             deinterlacing
             -w / --hw                      hw audio decoding
             -3 / --3d                      switch tv into 3d mode
             -y / --hdmiclocksync           adjust display refresh rate to match video
             -t / --sid index               show subtitle with index

For example:

    ./omxplayer -o local test.mkv
    omxplayer video.mp4

