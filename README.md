# Jenkins Server for npiper

## Base image

Ubuntu based on Docker image [Jenkins](https://hub.docker.com/_/jenkins/)

https://engineering.riotgames.com/news/putting-jenkins-docker-container

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

`docker run -p 8080:8080 -p 50000:50000 -v $(pwd)/JENKINS_HOME:/var/jenkins/home solveapuzzle.dev/jenkins`



### Volumes & Configuration parameters

## To configure

### Configuration


### Back up configuration

`docker cp $ID:/var/jenkins_home $BACKUP_PATH`

Copy to AWS as a backup


# References
 * https://github.com/jenkinsci/docker/blob/master/README.md
 * https://github.com/fabric8io/jenkins-docker
 * https://hub.docker.com/_/jenkins/
 * https://www.howtoinstall.co/en/debian/jessie/gradle
 * http://www.webupd8.org/2014/03/how-to-install-oracle-java-8-in-debian.html
 * https://thepracticalsysadmin.com/backing-up-jenkins-configurations-to-s3/
