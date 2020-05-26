FROM tensorflow/tensorflow:1.13.2-gpu-py3-jupyter
#
###
ENV DEBIAN_FRONTEND=noninteractive
RUN sed -i 's/archive.ubuntu.com/free.nchc.org.tw/g' /etc/apt/sources.list
RUN apt-get update && \
    apt-get install wget -y && \
    apt-get install cmake -y && \
    apt-get install git -y && \
    apt-get install unzip -y && \
    apt-get install zip -y && \
    apt-get install gedit -y && \
    apt-get install libgtk2.0-dev -y && \
    apt-get install pkg-config -y && \
    apt-get install libavcodec-dev -y && \
    apt-get install libavformat-dev -y && \
    apt-get install libswscale-dev -y && \
    apt-get install python-dev -y && \
    apt-get install python-numpy -y && \
    apt-get install libtbb2 -y && \
    apt-get install libtbb-dev -y && \
    apt-get install libjpeg-dev -y && \
    apt-get install libpng-dev -y && \
    apt-get install libtiff-dev -y && \
    apt-get install libdc1394-22-dev -y && \
    apt-get install qt5-default -y && \
    apt-get install build-essential -y && \
    apt-get install curl -y && \
    apt-get install ffmpeg -y


RUN add-apt-repository "deb http://security.ubuntu.com/ubuntu xenial-security main"
RUN apt update
RUN apt-get install libjasper1 -y && apt-get install libjasper-dev -y


###

RUN echo deb http://deb.obspy.org xenial main >> /etc/apt/sources.list
RUN wget --quiet -O - https://raw.github.com/obspy/obspy/master/misc/debian/public.key | apt-key add -
RUN apt update
RUN apt install -y openssh-server python3-obspy -y
RUN mkdir /var/run/sshd
RUN echo 'root:password' | chpasswd
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd
ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

COPY jupyter_notebook_config.py /root/.jupyter/jupyter_notebook_config.py
RUN pip install opencv-python-inference-engine
RUN pip install torch


COPY run_jupyter.sh run_jupyter.sh
USER root
CMD ./run_jupyter.sh
EXPOSE 8888
EXPOSE 22
#CMD ["source /etc/bash.bashrc && jupyter notebook --notebook-dir=/home --ip 0.0.0.0 --no-browser --allow-root"]
