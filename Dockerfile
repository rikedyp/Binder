FROM raspbian/jessie:041518

#ARG NB_USER=rikedyp
#ARG NB_UID=1000
#ENV USER ${NB_USER}
#ENV NB_UID ${NB_UID}
#ENV HOME /home/${NB_USER}
#
#RUN adduser --disabled-password \
#--gecos "Default user" \
#--uid ${NB_UID} \
#${NB_USER}
 
RUN echo 'this'
USER root

RUN apt update
#RUN sudo apt install python python-pip
USER pi

RUN pip install --no-cache-dir notebook==5.7.8
