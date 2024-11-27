FROM debian:stable-slim

RUN apt update && apt upgrade -y
RUN apt install wget -y
RUN apt install python3 -y
RUN apt install gcc -y
RUN apt-get install gfortran -y
RUN apt-get install openmpi-bin openmpi-common libopenmpi-dev libgtk2.0-dev -y
RUN apt-get install make -y
RUN apt-get install cmake -y
RUN apt install git -y
RUN apt install vim -y

WORKDIR /
RUN wget https://support.hdfgroup.org/ftp/HDF5/releases/hdf5-1.14/hdf5-1.14.3/src/hdf5-1.14.3.tar
RUN tar xvf hdf5-1.14.3.tar
WORKDIR hdf5-1.14.3
RUN CC=/usr/bin/mpicc ./configure --enable-parallel --prefix=/usr/lib/aarch64-linux-gnu/hdf5-1.14.3
RUN make install 
WORKDIR /

ENV PATH="${PATH}:/usr/lib"
ENV LD_LIBRARY_PATH="/usr/lib"

RUN git clone https://gitlab.com/petsc/petsc.git petsc
WORKDIR /petsc
RUN git checkout v3.20.2
RUN ./configure --CFLAGS='-O3' --CXXFLAGS='-O3' --FFLAGS='-O3' --with-debugging=no --with-hdf5-dir=/usr/lib/aarch64-linux-gnu/hdf5/openmpi --with-hdf5-fortran-bindings=1 --download-metis=yes --download-parmetis=yes --download-fblaslapack=1
RUN make PETSC_DIR=/petsc PETSC_ARCH=arch-linux-c-opt all
ENV PETSC_DIR='/petsc'
ENV PETSC_ARCH='arch-linux-c-opt'
WORKDIR /


