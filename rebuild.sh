# 1. Copy overlay files for use in customize-image.sh as "/tmp/overlay/"
cp ./OLIA-Linux-Armbian-builder/orpi3lts/overlay/network/interfaces ./build/userpatches/overlay/network/interfaces

# 2. Assembling file customize-image.sh and move to userpatches
cd ./OLIA-Linux-Armbian-builder/userpatches/orpi3lts
cat customize-image_begin.sh customize-image_body.sh customize-image_end.sh > customize-image.sh
cd
mv ./OLIA-Linux-Armbian-builder/userpatches/orpi3ltscustomize-image.sh ./build/userpatches/

# 3. Run Armbian build with options
./build/compile.sh PREFER_DOCKER=no INCLUDE_HOME_DIR=yes EXPERT=yes BUILD_MINIMAL=yes BUILD_DESKTOP=no BRANCH=legacy RELEASE=bookworm BOARD=orangepi3-lts KERNEL_CONFIGURE=no
