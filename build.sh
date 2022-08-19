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

# golang should be installed manually since ubuntu based systems are really poor about this

git clone https://github.com/apptainer/apptainer.git && \
    cd apptainer && \

git checkout v1.0.2 && \

./mconfig --prefix=/opt/apptainer && \
    make -C ./builddir && \
    sudo make -C ./builddir install

# add apptainer to /usr/local/bin w/ symlink
# this is probably devastatingly bad if it was installed with a package manager
sudo ln -s /opt/apptainer/bin/apptainer /usr/local/bin/apptainer
