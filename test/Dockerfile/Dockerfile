FROM tensorflow/tensorflow:2.0.0-gpu-py3-jupyter


ENV DEBIAN_FRONTEND=noninteractive
RUN sed -i 's/archive.ubuntu.com/free.nchc.org.tw/g' /etc/apt/sources.list
RUN apt update && apt install wget -y
RUN echo deb http://deb.obspy.org xenial main >> /etc/apt/sources.list
RUN wget --quiet -O - https://raw.github.com/obspy/obspy/master/misc/debian/public.key | apt-key add -
RUN apt update
RUN apt install -y openssh-server
RUN mkdir /var/run/sshd
RUN echo 'root:password' | chpasswd
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd
ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile
# setting the ssh client
RUN apt-get update
RUN apt-get install sshpass -y
## expose port 8888,22
EXPOSE 8888
EXPOSE 22

# Setting jupyter notebook
COPY jupyter_notebook_config.py /root/.jupyter/jupyter_notebook_config.py

# install Anaconda3
###
RUN mkdir /data-share
RUN mkdir /lab
RUN mkdir /home/data-share
RUN mkdir /home/lab

COPY run_jupyter.sh run_jupyter.sh
RUN chmod 777 run_jupyter.sh
CMD ./run_jupyter.sh $PASSWORD $account $uid
