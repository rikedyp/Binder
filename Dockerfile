FROM rikedyp/dyalog-jupyter:12345
USER root
RUN usermod --login jovyan --move-home --home /home/jovyan dyalog
ENV NB_USER jovyan
ENV NB_UID 1000
ENV HOME /home/${NB_USER}
USER root
RUN chown -R ${NB_UID} ${HOME}
USER ${NB_USER}
RUN jupyter notebook --generate-config -y
CMD jupyter notebook --ip 8888:8888
