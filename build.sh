# clone the repository
git clone https://github.com/apptainer/singularity/ --branch release-3.8 --single-branch --depth 1 && \

cd singularity && \

# make singularity - stored in like /usr/local/bin
./mconfig && \
    make -C ./builddir && \
    sudo make -C ./builddir install

