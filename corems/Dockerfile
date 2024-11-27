FROM deweycw/py310-debian

RUN apt update && apt upgrade -y 
RUN apt install wget git parallel vim gcc g++ libicu-dev -y

RUN wget https://dot.net/v1/dotnet-install.sh -O dotnet-install.sh && \
	chmod +x dotnet-install.sh && \
	./dotnet-install.sh --version latest --runtime aspnetcore

RUN git clone https://github.com/deweycw/CoreMS.git
WORKDIR /CoreMS
RUN git checkout mmac_docker

RUN python -m pip install -U pip
RUN python -m pip install wheel
RUN python -m pip install seaborn
RUN python -m pip install -r requirements.txt
RUN python -m pip install coremstools
RUN python -m pip install psycopg2-binary
RUN python -m pip isntall pandas 

ENV PYTHONNET_RUNTIME=coreclr
ENV DOTNET_ROOT=/root/.dotnet
ENV PATH=$PATH:$DOTNET_ROOT:$DOTNET_ROOT/tools

RUN python ./setup.py install

RUN rm -rf /CoreMS/tests
RUN rm -rf /CoreMS/examples
