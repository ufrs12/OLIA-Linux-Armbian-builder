git clone --depth=1 --branch=v24.02 https://github.com/armbian/build
sh ./build/compile.sh PREFER_DOCKER=no INCLUDE_HOME_DIR=yes EXPERT=yes BUILD_MINIMAL=no BUILD_DESKTOP=no BRANCH=legacy RELEASE=bookworm BOARD=orangepi3-lts KERNEL_CONFIGURE=no 
