# 1. Copy overlay files for use in customize-image.sh as "/tmp/overlay/"
cp -R ./OLIA-Linux-Armbian-builder/userpatches/orpi3lts/overlay/network ./build/userpatches/overlay/

# 2. Assembling file customize-image.sh and move to userpatches
cd ./OLIA-Linux-Armbian-builder/userpatches/orpi3lts
cat customize-image_begin.sh customize-image_body.sh customize-image_end.sh > customize-image.sh
cd
mv ./OLIA-Linux-Armbian-builder/userpatches/orpi3lts/customize-image.sh ./build/userpatches/

# 3. Run Armbian build with options
./build/compile.sh PREFER_DOCKER=no INCLUDE_HOME_DIR=yes EXPERT=yes BUILD_MINIMAL=yes BUILD_DESKTOP=no BRANCH=current RELEASE=bookworm BOARD=orangepi3-lts KERNEL_CONFIGURE=no
