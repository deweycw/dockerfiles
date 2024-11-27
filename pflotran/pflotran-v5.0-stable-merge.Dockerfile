FROM deweycw/pflotran-base:par-petsc-v3.20.2

RUN git clone https://github.com/deweycw/dewey-pflo.git
WORKDIR dewey-pflo/src/pflotran
RUN git checkout v5.0-stable-merge

RUN make pflotran
ENV PFLOTRAN_DIR='/pflotran/dewey-pflo/src/pflotran'

RUN useradd pflotran-user
USER pflotran-user

WORKDIR /
