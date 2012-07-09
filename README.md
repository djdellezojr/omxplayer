omxplayer-native-build
======================

OMXPlayer is a commandline OMX player for the Raspberry Pi. It was developed as
a testbed for the XBMC Raspberry PI implementation and is quite handy to use
standalone. 

omxplayer-native-build is a fork from the original omxplayer located at: 
https://github.com/huceke/omxplayer/ and is located at: 
https://github.com/wrightrocket/omxplayer-native-build. 

The Makefiles of the omxplayer-native-build project have been
customized to support building the project on the Raspberry Pi, 
instead of defaulting to cross-compiling them on another system. 

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


Installing dependencies for the omxplayer-native-build
------------------------------------------------------
    sudo apt-get install libavcodec-dev libavformat-dev \
    libswresample-dev libavfilter-dev libswscale-dev \
    libpcre3-dev libboost-dev libtheora-dev \
    libopenjpeg-dev libvorbis-dev git fbset

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
    make dist

Installing omxplayer-native-build
---------------------------------
If you have completed compiling omxplayer-native-build:

    sudo make install

Uninstalling omxplayer-native-build
-----------------------------------
If you have compiled and installed omxplayer-native-build, but not cleaned the build directory:

    sudo make uninstall
    
Cleaning the omxplayer-native-build
-----------------------------------
If you have completed compiling omxplayer-native-build, and are sure you don't want to uninstall 
omxplayer without re-compiling it:
    
    make clean

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

