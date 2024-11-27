FROM deweycw/pflotran-base:latest

WORKDIR /pflotran
RUN git clone https://github.com/deweycw/dewey-pflo.git

WORKDIR /pflotran/dewey-pflo/src/pflotran
RUN git checkout som-ferm
RUN make pflotran
ENV PFLOTRAN_DIR='/pflotran/dewey-pflo/src/pflotran'

WORKDIR /
