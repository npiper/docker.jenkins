# Jenkins Server for npiper

## Base image

Ubuntu based on Docker image [Jenkins](https://hub.docker.com/_/jenkins/)

## Tools installed for build jobs

* Java
* make
* maven 
* gradle

## Plugins

# Execution

## To build

`docker build -t solveapuzzle.dev/jenkins .`

## To run

`docker run -p 8080:8080 -p 50000:50000 -v /Volumes/Untitled/VOLUME/JENKINS:/var/jenkins-home solveapuzzle.dev/jenkins`

### Volumes & Configuration parameters

## To configure

### Configuration


### Back up configuration

`docker cp $ID:/var/jenkins_home $BACKUP_PATH`

# References

https://github.com/fabric8io/jenkins-docker
https://hub.docker.com/_/jenkins/
http://askubuntu.com/questions/493460/how-to-install-add-apt-repository-using-the-terminal
http://linuxg.net/how-to-install-gradle-2-1-on-ubuntu-14-10-ubuntu-14-04-ubuntu-12-04-and-derivatives/

