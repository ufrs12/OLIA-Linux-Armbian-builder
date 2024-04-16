<p align="center">
 <img width="250px" src="https://github.com/ufrs12/OLIA-Linux-Armbian/blob/main/sources/img/logo/OLIA-Linux.png" alt="qr"/>
</p>
# OLIA Linux Armbian builder  

This builder is based on [armbian/build](https://github.com/armbian/build). Essentially, it runs [armbian/build](https://github.com/armbian/build) with the parameters necessary to build [OLIA-Linux Armbian](https://github.com/ufrs12/OLIA-Linux-Armbian), and also modifies Armbian for tasks that are necessary for the OLIA architecture. It can also add software products that are required in the [OLIA-Linux Armbian stack](https://github.com/ufrs12/OLIA-Linux-Armbian/blob/main/stack.md) and that are not in the Armbian repositories.  


## Getting started

### Requirements for self hosted

- x86_64 / aarch64 machine
- Windows 10/11 with WSL2 subsystem running Ubuntu Jammy 22.04.x
- at least 2GB of memory and ~35GB of disk space
- [Armbian / Ubuntu Jammy 22.04.x](https://github.com/armbian/sdk) for native building
- Superuser rights (configured sudo or root access).
- Make sure your system is up-to-date!  

#### Build

```bash
apt-get -y install git
git clone --depth=1 --branch=main https://github.com/ufrs12/OLIA-Linux-Armbian-builder
sh ./OLIA-Linux-Armbian-builder/build.sh

```
#### ReBuild

```bash
sh ./OLIA-Linux-Armbian-builder/rebuild.sh

```
