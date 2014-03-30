#/bin/bash
###
#Bash script to download/compile FFMPEG
#Date: 2014/03/30
#By: Matt Briggs
#For: Ubuntu 12.04
####

#Directory
src=~/ffmpeg_source
bld=~/ffmpeg_build
bin=~/bin

#Install build essentials
sudo apt-get update
sudo apt-get -y install autoconf automake build-essential libass-dev libgpac-dev libtheora-dev libtool libvorbis-dev pkg-config texi2html zlib1g-dev nasm

#mkdir
mkdir $src
mkdir $bld
mkdir $bin

#install yasm
cd $src
wget http://www.tortall.net/projects/yasm/releases/yasm-1.2.0.tar.gz
cd yasm-1.2.0
./configure --prefix="$bld" --bindir="$bin"
make && make install && make distclean
export "PATH=$PATH:$bin"

#install x264
cd $src
wget http://download.videolan.org/pub/x264/snapshots/last_x264.tar.bz2
tar xjvf last_x264.tar.bz2
cd x264-snapshot*
./configure --prefix="$bld" --bindir="$bin" --enable-static
make && make install && make distclean

#install fdk-aac
cd $src
wget -O fdk-aac.zip https://github.com/mstorsjo/fdk-aac/zipball/master
unzip fdk-aac.zip
cd mstorsjo-fdk-aac*
autoreconf -fiv
./configure --prefix="$bld" --disable-shared
make && make install && make distclean

#install mp3lam
cd $src
wget http://downloads.sourceforge.net/project/lame/lame/3.99/lame-3.99.5.tar.gz
tar xzvf lame-3.99.5.tar.gz
cd lame-3.99.5
./configure --prefix="$bld" --enable-nasm --disable-shared
make && make install && make distclean

#install libopus
cd $src
wget http://downloads.xiph.org/releases/opus/opus-1.1.tar.gz
tar xzvf opus-1.1.tar.gz
cd opus-1.1
./configure --prefix="$bld" --disable-shared
make && make install && make distclean

#libvpx
cd $src
wget http://webm.googlecode.com/files/libvpx-v1.3.0.tar.bz2
tar xjvf libvpx-v1.3.0.tar.bz2
cd libvpx-v1.3.0
./configure --prefix="$bld" --disable-examples
make && make install && make clean

#ffmpeg
cd $src
wget http://ffmpeg.org/releases/ffmpeg-snapshot.tar.bz2
tar xjvf ffmpeg-snapshot.tar.bz2
cd ffmpeg
PKG_CONFIG_PATH="$bld/lib/pkgconfig"
export PKG_CONFIG_PATH
./configure --prefix="$bld" --extra-cflags="-I$bld/include" --extra-ldflags="-L$bld/lib" --bindir="$bin" --extra-libs="-ldl" --enable-gpl --enable-libass --enable-libfdk-aac --enable-libmp3lame --enable-libopus --enable-libtheora --enable-libvorbis --enable-libvpx --enable-libx264 --enable-nonfree
make && make install && make distclean
hash -r

#remove source directory
rm -rf $src
