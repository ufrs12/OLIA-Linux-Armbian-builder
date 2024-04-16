# 1. Download repository Armbian build
git clone --depth=1 --branch=main https://github.com/ufrs12/build

# 2. Add packages
echo 'mc' >> ./build/config/cli/common/main/packages
echo 'nginx' >> ./build/config/cli/common/main/packages

# 3. Copy overlay files for use in customize-image.sh as "/tmp/overlay/"
cp ./OLIA-Linux-Armbian-builder/overlay/network/interfaces ./build/userpatches/overlay/network/interfaces

# 4. Assembling file customize-image.sh and move to userpatches
cd ./OLIA-Linux-Armbian-builder/userpatches/orpi3lts
cat customize-image_begin.sh customize-image_body.sh customize-image_end.sh > customize-image.sh
cd
mv ./OLIA-Linux-Armbian-builder/userpatches/orpi3ltscustomize-image.sh ./build/userpatches/

# 5. Run Armbian build with options
./build/compile.sh PREFER_DOCKER=no INCLUDE_HOME_DIR=yes EXPERT=yes BUILD_MINIMAL=yes BUILD_DESKTOP=no BRANCH=legacy RELEASE=bookworm BOARD=orangepi3-lts KERNEL_CONFIGURE=no
