FROM rikedyp/dyalog-jupyter:12345
USER root
RUN usermod -l joyvan dyalog
USER joyvan
