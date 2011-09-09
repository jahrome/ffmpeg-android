#!/bin/bash

export NDK=${HOME}/Projet_android/android-ndk-r6b
export TOOLCHAIN=${HOME}/standalone-toolchain
#$NDK/build/tools/make-standalone-toolchain.sh --platform=android-9 --install-dir=$TOOLCHAIN
export PATH=$TOOLCHAIN/bin/:$PATH

EXTRA_CFLAGS="-march=armv7-a -mfloat-abi=softfp -mfpu=neon"
EXTRA_LDFLAGS="-Wl,--fix-cortex-a8"
EXTRA_LIBS="-lgcc"

FLAGS="--target-os=linux --cross-prefix=arm-linux-androideabi- --arch=arm"
FLAGS="$FLAGS --prefix=build/ffmpeg"
FLAGS="$FLAGS --disable-static --enable-shared --enable-postproc --disable-symver --enable-gpl --enable-nonfree"
#FLAGS="$FLAGS --disable-encoders --disable-decoders --disable-protocols --disable-muxers --disable-demuxers --disable-parsers --disable-devices --disable-filters --disable-bsfs"
FLAGS="$FLAGS --enable-encoder=mpeg2video"

rm -rf build/ffmpeg
mkdir -p build/ffmpeg
echo $FLAGS --extra-cflags="$EXTRA_CFLAGS" --extra-ldflags="$EXTRA_LDFLAGS" --extra-libs="$EXTRA_LIBS" > build/ffmpeg/info.txt
./configure $FLAGS --extra-cflags="$EXTRA_CFLAGS" --extra-ldflags="$EXTRA_LDFLAGS" --extra-libs="$EXTRA_LIBS" | tee build/ffmpeg/configuration.txt
[ $PIPESTATUS == 0 ] || exit 1
make clean
make -j4 || exit 1
make install || exit 1
