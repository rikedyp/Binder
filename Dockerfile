FROM rikedyp/dyalog-jupyter:12345
#FROM dyalog/ubuntu:1804-mingw
#FROM dyalog/dyalog:17.1

USER root

RUN apt-get update 
RUN apt-get install -y python3 python3-pip git
RUN python3 -m pip install --no-cache --upgrade pip
RUN python3 -m pip install --no-cache-dir notebook
RUN alias python=python3

#COPY ${HOME}/* 
#USER root
RUN userdel -r dyalog
# create user with a home directory
ENV NB_USER dyalog
ENV NB_UID 1000
ENV HOME /home/${NB_USER}

RUN adduser --disabled-password \
    --gecos "Default user" \
    --uid ${NB_UID} \
    ${NB_USER}

COPY . ${HOME}
USER root
RUN chown -R ${NB_UID} ${HOME}
USER ${NB_USER}

WORKDIR ${HOME}
USER ${NB_USER}

#RUN git clone https://github.com/Dyalog/dyalog-jupyter-kernel
#RUN cd dyalog-jupyter-kernel && ./install.sh

RUN jupyter notebook --generate-config
#CMD ["jupyter", "notebook", "--ip", "8888:8888"]
ENTRYPOINT ["jupyter","notebook","--ip","0.0.0.0:8888:8888"]
#ENTRYPOINT ["echo","hello"]
#ENTRYPOINT ["jupyter","notebook","--ip","8888:8888"]
#ENTRYPOINT ["cat","/etc/hosts"]
#CMD ["jupyter", "notebook", "--ip", "8888:8888"]
#CMD ["localhost"]
CMD jupyter notebook --ip 8888:8888
