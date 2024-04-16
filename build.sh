# 1. Download repository Armbian build
git clone --depth=1 --branch=main https://github.com/ufrs12/build

# 2. Add packages
echo 'mc' >> ./build/config/cli/common/main/packages
echo 'nginx' >> ./build/config/cli/common/main/packages

# 3. Run Armbian build with options first time
./build/compile.sh PREFER_DOCKER=no INCLUDE_HOME_DIR=yes EXPERT=yes BUILD_MINIMAL=yes BUILD_DESKTOP=no BRANCH=edge RELEASE=bookworm BOARD=orangepi3-lts KERNEL_CONFIGURE=no
