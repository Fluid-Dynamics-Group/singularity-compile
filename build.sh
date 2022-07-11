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
