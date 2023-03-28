# crash out of this program if things dont work as expected
set -e

sudo apt-get update && sudo apt-get install -y \
    build-essential \
    uuid-dev \
    libgpgme-dev \
    squashfs-tools \
    libseccomp-dev \
    wget \
    pkg-config \
    git \
    cryptsetup-bin

#
# Install golang manually
#
wget https://go.dev/dl/go1.19.2.linux-amd64.tar.gz
tar -xzf go1.19.2.linux-amd64.tar.gz
# the above tar extracts to the folder ./go
sudo mv go /opt/go
sudo ln -s /opt/go/bin/go /usr/local/bin/

git clone https://github.com/apptainer/apptainer.git
cd apptainer

# commit tracks arch linux build version 
# https://github.com/archlinux/svntogit-community/blob/packages/apptainer/trunk/PKGBUILD
commit="47190aa95d3fbd45b69a35e27fda816e3917f6c4"

git checkout $commit

./mconfig --prefix=/opt/apptainer && \
    make -C ./builddir && \
    sudo make -C ./builddir install

# add apptainer to /usr/local/bin w/ symlink
# this is probably devastatingly bad if it was installed with a package manager
sudo ln -s /opt/apptainer/bin/apptainer /usr/local/bin/apptainer
