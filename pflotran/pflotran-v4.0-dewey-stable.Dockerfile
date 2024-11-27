FROM deweycw/pflotran-base:petsc-v3.17.1

RUN git clone https://github.com/deweycw/dewey-pflo.git
WORKDIR dewey-pflo/src/pflotran
RUN git checkout dewey-stable

RUN make pflotran
ENV PFLOTRAN_DIR='/pflotran/dewey-pflo/src/pflotran'

RUN useradd pflotran-user
USER pflotran-user

WORKDIR /
