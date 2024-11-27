RUN 
./configure --CFLAGS='-O3' --CXXFLAGS='-O3' --FFLAGS='-O3' --with-debugging=no --with-shared-libraries=yes --known-mpi-shared-libraries=1 --with-mpi=1 --download-hdf5-fortran-bindings=yes --with-hdf5-fortran-bindings=1 --download-metis=yes --download-parmetis=yes --download-fblaslapack=1

RUN make PETSC_DIR=/petsc PETSC_ARCH=arch-linux-c-opt all

ENV PETSC_DIR='/petsc'
ENV PETSC_ARCH='arch-linux-c-opt'

WORKDIR /



wget https://support.hdfgroup.org/ftp/HDF5/releases/hdf5-1.14/hdf5-1.14.3/src/hdf5-1.14.3.tar
tar xvf hdf5-1.14.3.tar.bz2
cd hdf5-1.14.3



RUN ./configure --CFLAGS='-O3' --CXXFLAGS='-O3' --FFLAGS='-O3' --with-debugging=no --with-shared-libraries=yes --known-mpi-shared-libraries=1 --download-hdf5-fortran-bindings=yes --with-hdf5-dir=/usr/lib/aarch64-linux-gnu/hdf5-1.14.3 --with-hdf5-fortran-bindings=1 --download-metis=yes --download-parmetis=yes --download-fblaslapack=1

RUN make PETSC_DIR=/petsc PETSC_ARCH=arch-linux-c-opt all

ENV PETSC_DIR='/petsc'
ENV PETSC_ARCH='arch-linux-c-opt'

WORKDIR /

