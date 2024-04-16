git clone --depth=1 --branch=v23.11 https://github.com/armbian/build

./build/compile.sh PREFER_DOCKER=no INCLUDE_HOME_DIR=yes EXPERT=yes BUILD_MINIMAL=yes BUILD_DESKTOP=no BRANCH=legacy RELEASE=bookworm BOARD=orangepi3-lts KERNEL_CONFIGURE=no REPOSITORY_INSTALL="nginx"
