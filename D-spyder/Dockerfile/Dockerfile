FROM ubuntu:16.04
#######################################################
RUN apt-get update && apt-get install -y openssh-server && apt-get install -y curl && apt-get install python2.7 -y
RUN mkdir /var/run/sshd
RUN echo 'root:password' | chpasswd
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config 
# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd
 
ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile
#######################################################
#  install  Anaconda v2
RUN wget --quiet https://repo.continuum.io/archive/Anaconda2-2019.10-Linux-x86_64.sh -O ~/anaconda.sh && \
    /bin/bash ~/anaconda.sh -b -p /opt/conda && \
    rm ~/anaconda.sh && \
    echo "export PATH=/opt/conda/bin:$PATH" >> ~/.bashrc
#######################################################
# install spyder v2
#RUN conda install -c anaconda spyder
RUN bash
RUN /opt/conda/bin/conda install -c anaconda spyder -y
#######################################################
EXPOSE 22
#######################################################

COPY my_wrapper_script.sh my_wrapper_script.sh
CMD ./my_wrapper_script.sh
