FROM jenkins/jenkins:lts
# Set timezone to Melbourne
USER root
RUN echo "Europe/London" | tee /etc/timezone
RUN dpkg-reconfigure --frontend noninteractive tzdata 

# Install tools

## Gradle repository - allow use of 'add-apt-repository'
RUN apt-get update

RUN apt-get install -y software-properties-common python3-software-properties software-properties-common 

#RUN add-apt-repository ppa:cwchien/gradle
RUN apt-get install -y maven git make gradle

RUN apt update
#RUN apt install oracle-java8-installer

# Oracle JDK
#RUN echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 select true" | debconf-set-selections
#RUN echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" > /etc/apt/sources.list.d/webupd8team-java-trusty.list
#RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EEA14886
#RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y --force-yes --no-install-recommends oracle-java8-installer && apt-get clean all

# Install plugins
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt 
#RUN /usr/local/bin/plugins.sh /usr/share/jenkins/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt
# Install Docker
RUN apt-get install -y apt-transport-https ca-certificates curl
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
RUN apt-get update
RUN apt-get install -y docker-ce


USER jenkins
