FROM raspbian/jessie:041518

RUN sudo apt update
RUN sudo apt install python python-pip
RUN sudo pip install --no-cache-dir notebook==5.7.8
