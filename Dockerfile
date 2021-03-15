FROM ubuntu:18.04 

RUN apt-get upgrade -y
RUN apt-get update
RUN apt-get install -y curl
RUN apt-get install -y gnupg2
RUN apt-get install -y apt-utils

## Microsoft stuff
RUN curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -
RUN curl https://packages.microsoft.com/config/ubuntu/18.04/prod.list > /etc/apt/sources.list.d/mssql-release.list

ENV ACCEPT_EULA=Y
RUN apt-get update
RUN apt-get install -y msodbcsql17
RUN apt-get install -y mssql-tools
RUN echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> ~/.bash_profile
RUN echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> ~/.bashrc

## Python stuff
RUN apt-get install -y python3
RUN apt-get install -y python3-pip
RUN apt-get install -y unixodbc unixodbc-dev

WORKDIR /usr/src/app

CMD [ "/bin/bash" ]