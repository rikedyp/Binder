FROM rikedyp/dyalog-jupyter:12345

#RUN pip install --no-cache-dir notebook==5.7.8



#COPY ${HOME}/* 
USER root
RUN userdel -r dyalog
# create user with a home directory
ARG NB_USER
ARG NB_UID
ENV USER ${NB_USER}
ENV HOME /home/${NB_USER}

RUN adduser --disabled-password \
    --gecos "Default user" \
    --uid ${NB_UID} \
    ${NB_USER}
WORKDIR ${HOME}
USER ${USER}

RUN jupyter notebook --generate-config
CMD ["jupyter", "notebook", "--ip", "8888:8888"]
