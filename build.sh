sudo apt-get update && sudo apt-get install -y \
    build-essential \
    uuid-dev \
    libgpgme-dev \
    squashfs-tools \
    libseccomp-dev \
    wget \
    pkg-config \
    git \
    cryptsetup-bin \
    golang && \

git clone https://github.com/apptainer/singularity/ --branch release-3.8 --single-branch --depth 1 && \
cd singularity && \

./mconfig && \
    make -C ./builddir && \
    sudo make -C ./builddir install &&

sudo mv /usr/local/bin/singularity /usr/bin

