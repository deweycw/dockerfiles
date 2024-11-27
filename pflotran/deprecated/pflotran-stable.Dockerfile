FROM deweycw/pflotran-base:parallel

RUN git clone https://github.com/deweycw/dewey-pflo.git
WORKDIR dewey-pflo/src/pflotran
RUN git checkout dewey-stable

RUN make pflotran
ENV PFLOTRAN_DIR='/pflotran/dewey-pflo/src/pflotran'

RUN useradd pflotran-user
RUN usermod -aG pflotran-user sudo
RUN su pflotran-user

WORKDIR /
