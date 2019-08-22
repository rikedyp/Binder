#FROM rikedyp/dyalog-jupyter:12345
FROM raspbian/desktop:0.1.0

RUN pip install --no-cache --upgrade pip && \
    pip install --no-cache-dir notebook==5.7.8



#COPY ${HOME}/* 
#USER root
#RUN userdel -r dyalog
# create user with a home directory
ENV NB_USER jovyan
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

#RUN jupyter notebook --generate-config
CMD ["jupyter", "notebook", "--ip=8888:8888"]
