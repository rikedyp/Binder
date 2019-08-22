FROM rikedyp/dyalog-jupyter:12345
USER root
RUN usermod -l joyvan dyalog
RUN mv /home/dyalog /home/joyvan
USER joyvan
CMD jupyter notebook --ip 8888:8888
