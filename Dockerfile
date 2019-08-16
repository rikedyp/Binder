FROM raspbian/jessie:041518
USER root
RUN apt-get update
RUN apt install python python-pip
RUN pip install --no-cache-dir notebook==5.7.8
