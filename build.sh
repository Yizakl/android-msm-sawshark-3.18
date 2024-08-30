mkdir -p out
export ARCH=arm
export SUBARCH=arm
make O=out clean
make O=out mrproper
export CROSS_COMPILE=$HOME/Android-dev/toolchains/aosp-clang/arm-linux-androideabi-4.9/bin/arm-linux-androidkernel-
#make O=out sawshark_defconfig 
make O=out sawshark_full_defconfig
make O=out -j$(nproc --all) 
