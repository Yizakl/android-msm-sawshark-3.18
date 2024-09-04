branch=$(git symbolic-ref --short HEAD)
branch_name=$(git rev-parse --abbrev-ref HEAD)
last_commit=$(git rev-parse --verify --short=8 HEAD)
export LOCALVERSION="-Simple-Kernel-${branch_name}"
mkdir -p out
export ARCH=arm
export SUBARCH=arm
make O=out clean
make O=out mrproper
export CROSS_COMPILE=$HOME/Android-dev/toolchains/aosp-clang/arm-linux-androideabi-4.9/bin/arm-linux-androidkernel-
#make O=out sawshark_defconfig 
make O=out sawshark_full_defconfig
#make O=out -j1
make O=out -j$(nproc --all)

rm ./AnyKernel3/*.zip
rm ./AnyKernel3/zImage-dtb
cp ./out/arch/arm/boot/zImage-dtb ./AnyKernel3
cd ./AnyKernel3
zip -r9 Simple-Kernel-"$version"-"$branch"-"$last_commit".zip * -x .git README.md *placeholder
cd ..