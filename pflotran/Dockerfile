FROM debian:stable-slim

RUN apt update && apt upgrade -y
RUN apt install wget -y
RUN apt install python3 -y
RUN apt install gcc -y
RUN apt-get install gfortran -y


ENV OMPI_DIR=/opt/ompi
RUN mkdir -p /opt

RUN wget -O openmpi-4.1.6.tar.bz2 "https://download.open-mpi.org/release/open-mpi/v4.1/openmpi-4.1.6.tar.gz"
RUN tar -xjf openmpi-4.1.6.tar.bz2
WORKDIR openmpi-4.1.6 && ./configure && make install
ENV PATH=$OMPI_DIR/bin:$PATH
ENV LD_LIBRARY_PATH=$OMPI_DIR/lib:$LD_LIBRARY_PATH
ENV MANPATH=$OMPI_DIR/share/man:$MANPATH




RUN apt-get install openmpi-bin openmpi-common libopenmpi-dev libgtk2.0-dev -y
RUN apt install libhdf5-mpi-dev -y
RUN apt-get install make -y
RUN apt-get install cmake -y
RUN apt install git -y
RUN apt install vim -y

ENV PATH="${PATH}:/usr/lib"
ENV LD_LIBRARY_PATH="/usr/lib"

RUN git clone https://gitlab.com/petsc/petsc.git petsc
WORKDIR /petsc
RUN git checkout v3.21.5
RUN ./configure --CFLAGS='-O3' --CXXFLAGS='-O3' --FFLAGS='-O3' --with-debugging=no --with-hdf5-dir=/usr/lib/x86_64-linux-gnu/hdf5/openmpi --with-hdf5-fortran-bindings=1 --download-metis=yes --download-parmetis=yes --download-fblaslapack=1
RUN make all
ENV PETSC_DIR='/petsc'
ENV PETSC_ARCH='arch-linux-c-opt'
WORKDIR /

RUN git clone https://github.com/deweycw/dewey-pflo.git pflotran
WORKDIR pflotran/src/pflotran
RUN git checkout dewey

RUN make pflotran
ENV PFLOTRAN_DIR='/pflotran/src/pflotran'

RUN useradd pflotran-user
USER pflotran-user

WORKDIR /
