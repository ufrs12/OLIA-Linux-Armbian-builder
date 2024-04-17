
#!/bin/bash

THIS_SCRIPT="header"
MOTD_DISABLE=""

# Read image configuration
[[ -f /etc/armbian-image-release ]] && . /etc/armbian-image-release
VENDORTEMP="${VENDOR}"

# Read update configuration
[[ -f /etc/armbian-release ]] && . /etc/armbian-release

# Keep the VENDOR from image if its defined there
[[ -n "${VENDORTEMP}" && "${VENDORTEMP}" != "${VENDOR}" ]] && VENDOR="${VENDORTEMP}"

if [[ -f /etc/armbian-distribution-status ]]; then
        . /etc/armbian-distribution-status
        [[ -f /etc/lsb-release ]] && DISTRIBUTION_CODENAME=$(grep CODENAME /etc/lsb-release | cut -d"=" -f2)
        [[ -z "$DISTRIBUTION_CODENAME" && -f /etc/os-release ]] && DISTRIBUTION_CODENAME=$(grep VERSION_CODENAME /etc/os-release | cut -d">
        [[ -z "$DISTRIBUTION_CODENAME" && -x /usr/bin/lsb_release ]] && DISTRIBUTION_CODENAME=$(/usr/bin/lsb_release -c | cut -d":" -f2 | >
        DISTRIBUTION_STATUS=$(grep "$DISTRIBUTION_CODENAME" /etc/armbian-distribution-status | cut -d"=" -f2)
fi
[[ -f /etc/default/armbian-motd ]] && . /etc/default/armbian-motd

for f in $MOTD_DISABLE; do
        [[ $f == $THIS_SCRIPT ]] && exit 0
done

KERNELID=$(uname -r)

# Odroid N2 exception
[[ -f /proc/device-tree/model ]] && [[ -n $(tr -d '\000' < /proc/device-tree/model | grep ODROID | grep Plus) ]] && BOARD_NAME+="+"

TERM=linux toilet -f standard -F metal $(echo $BOARD_NAME | sed 's/Orange Pi/OPi/')

printf "\033[34m\033[40m╭━━━━━╮ ╭━╮     ╭━╮ ╭━━━━━╮             \033[0m\n"
printf "\033[94m\033[40m┃.╭━╮ ┃ ┃.┃     ┃.┃ ┃.╭━╮ ┃ Open        \033[0m\n"
printf "\033[36m\033[40m┃.┃ ┃ ┃ ┃.┃     ┃.┃ ┃.╰━╯ ┃ Logical     \033[0m\n"
printf "\033[96m\033[40m┃.╰━╯ ┃ ┃.╰━━━╮ ┃.┃ ┃.╭━╮ ┃ Industrial  \033[0m\n"
printf "\033[37m\033[40m╰━━━━━╯ ╰━━━━━╯ ╰━╯ ╰━╯ ╰━╯ Architecture\033[0m\n"

echo -e "Welcome to \e[0;95mOLIA Linux Armbian\x1B[0m"
echo -e "Kernel \e[0;95m Linux $KERNELID\x1B[0m"
echo -e "Based on \e[0;95m Debian 12 Bookworm\x1B[0m"


