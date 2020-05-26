FROM ubuntu:16.04
#######################################################
RUN apt-get update
RUN apt-get install -y openssh-server
RUN apt-get install -y curl


RUN apt-get install python2.7 -y
RUN mkdir /var/run/sshd
RUN echo 'root:password' | chpasswd
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config 
# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd
 
ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile
#######################################################

# install Anaconda3-2019.10
#RUN curl -O https://repo.anaconda.com/archive/Anaconda3-2019.10-Linux-x86_64.sh
#RUN ./Anaconda3-2019.10-Linux-x86_64.sh -b
#RUN export PATH=~/anaconda3/bin:$PATH

RUN wget --quiet https://repo.continuum.io/archive/Anaconda3-2019.10-Linux-x86_64.sh -O ~/anaconda.sh && \
    /bin/bash ~/anaconda.sh -b -p /opt/conda && \
    rm ~/anaconda.sh && \
    echo "export PATH=/opt/conda/bin:$PATH" >> ~/.bashrc

#######################################################
EXPOSE 22
EXPOSE 80
#######################################################

#CMD service sshd start && service nginx start

#CMD ["sh","-c","service sshd start && nginx -g daemon off"]
#RUN sh -c "service sshd start"
#CMD ["nginx", "-g", "daemon off;"]

COPY my_wrapper_script.sh my_wrapper_script.sh
CMD ./my_wrapper_script.sh
