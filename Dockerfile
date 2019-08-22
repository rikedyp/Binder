FROM rikedyp/dyalog-jupyter:12345

#RUN pip install --no-cache-dir notebook==5.7.8



#COPY ${HOME}/* 

#RUN userdel -r dyalog

ARG NB_USER=dyalog
ARG NB_UID=1000
ENV USER ${NB_USER}
ENV NB_UID ${NB_UID}
ENV HOME /home/${NB_USER}

#RUN adduser --disabled-password \
#    --gecos "Default user" \
#    --uid ${NB_UID} \
#    ${NB_USER}

USER root

# Make sure the contents of our repo are in ${HOME}
COPY . ${HOME}
RUN chown -R ${NB_UID} ${HOME}
USER ${NB_USER}

RUN jupyter notebook --generate-config
CMD ["jupyter", "notebook", "--ip", "8888:8888"]
