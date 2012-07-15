omxplayer
=========

OMXPlayer is a commandline OMX player for the Raspberry Pi. It was developed as
a testbed for the XBMC Raspberry PI implementation and is quite handy to use
standalone. 

This fork originated from the the omxplayer located at: 
https://github.com/huceke/omxplayer/. Below is a list of differences between this native build and it's origin. 

Primarily, the Makefiles of this omxplayer project have been
customized to support building the project on the Raspberry Pi, 
instead of defaulting to cross-compiling them on another system.

Other differences:

The default output is HDMI, so using omxplayer -o hdmi video.mp4, is not necessary, just omxplayer video.mp4. 

On the other hand, if you want audio output from the jack, then you need to use omxplayer -o local video.mp4.

The default location for the project to be downloaded and built from is /usr/local/src on the Raspberry Pi.

The default location for the omxplayer script and omxplayer.bin is /usr/local/bin instead of /usr/bin.

The default location for the ffmpeg libraries is /usr/local/lib instead of /usr/lib/omxplayer.

The Raspberry Pi firmware library is downloaded from it's github repository and used during the build.

The required ffmpeg sources are only downloaded once, when you begin building, not for every build.

There is the following additional make commands: install, uninstall, sources, clean-sources.


Installing dependencies for the omxplayer
------------------------------------------------------
    sudo apt-get install libpcre3-dev libboost-dev git fbset

Downloading omxplayer
----------------------------------
    sudo chown pi:pi /usr/local/src
    cd /usr/local/src
    git clone git://github.com/wrightrocket/omxplayer.git

Compiling omxplayer
--------------------------------
    cd /usr/local/src/omxplayer
    make sources
    make -f Makefile.ffmpeg
    make -f Makefile.ffmpeg install
    make
    make dist

Installing omxplayer
---------------------------------
If you have completed compiling omxplayer:

    sudo make install

Uninstalling omxplayer
-----------------------------------
If you have compiled and installed omxplayer, but not cleaned the build directory:

    sudo make uninstall
    
Cleaning the omxplayer
-----------------------------------
If you have completed compiling omxplayer, and are sure you don't want to uninstall 
omxplayer without re-compiling it:
    
    make clean
    make clean-sources

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

