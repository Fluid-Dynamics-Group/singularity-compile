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

git checkout v1.0.2

./mconfig --prefix=/opt/apptainer && \
    make -C ./builddir && \
    sudo make -C ./builddir install

# add apptainer to /usr/local/bin w/ symlink
# this is probably devastatingly bad if it was installed with a package manager
sudo ln -s /opt/apptainer/bin/apptainer /usr/local/bin/apptainer
