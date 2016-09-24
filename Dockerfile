FROM jenkins

# Set timezone to Melbourne
USER root
RUN echo "Australia/Melbourne" | tee /etc/timezone
RUN dpkg-reconfigure --frontend noninteractive tzdata 

# Install tools

## Gradle repository - allow use of 'add-apt-repository'
RUN apt-get update

RUN apt-get install -y software-properties-common python3-software-properties python-software-properties

RUN add-apt-repository ppa:cwchien/gradle
RUN apt-get install -y maven git make gradle


# Install plugins
COPY plugins.txt /usr/share/jenkins/plugins.txt
RUN /usr/local/bin/plugins.sh /usr/share/jenkins/plugins.txt

USER jenkins
