FROM jenkins

# Set timezone to Melbourne
USER root
RUN echo "Australia/Melbourne" | tee /etc/timezone
RUN dpkg-reconfigure --frontend noninteractive tzdata 

# Install tools

## Gradle repository - allow use of 'add-apt-repository'
RUN apt-get update

RUN apt-get install -y software-properties-common python3-software-properties python-software-properties

#RUN add-apt-repository ppa:cwchien/gradle
RUN apt-get install -y maven git make gradle

# Oracle JDK
RUN echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu xenial main" | tee /etc/apt/sources.list.d/webupd8team-java.list
RUN echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu xenial main" | tee -a /etc/apt/sources.list.d/webupd8team-java.list
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886
RUN apt-get update
RUN echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
RUN apt-get install -y oracle-java8-installer


# Install plugins
COPY plugins.txt /usr/share/jenkins/plugins.txt
RUN /usr/local/bin/plugins.sh /usr/share/jenkins/plugins.txt

# Install Docker
RUN apt-get install -y apt-transport-https ca-certificates curl
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
RUN apt-get update
RUN apt-get install -y docker-ce


USER jenkins
