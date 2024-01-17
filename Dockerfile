# Get source code from Github Repository: https://github.com/Systems-Modeling/SysML-v2-Release
FROM datajoint/miniconda3 as source_code
USER root:root

RUN apt-get update && apt-get install -y git
RUN mkdir -p /source_code
RUN git clone https://github.com/Systems-Modeling/SysML-v2-Release.git /source_code

# Final image
FROM datajoint/miniconda3
USER root:root
WORKDIR /root

RUN mkdir -p /root/source
COPY --from=source_code /source_code/install/jupyter /root/source
WORKDIR /root/source

RUN conda install openjdk=11
RUN chmod +x *.sh && ./install.sh
RUN rm -rf /root/source

WORKDIR /root

