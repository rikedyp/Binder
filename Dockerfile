FROM rikedyp/dyalog-jupyter:12345
USER root
RUN usermod -l joyvan dyalog
RUN mv /home/dyalog /home/joyvan
ENV NB_USER jovyan
ENV NB_UID 1000
#ENV HOME /home/${NB_USER}
#USER root
#RUN chown -R ${NB_UID} ${HOME}
USER ${NB_USER}
RUN jupyter notebook --generate-config
CMD jupyter notebook --ip 8888:8888
