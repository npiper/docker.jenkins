echo "Australia/Melbourne" | sudo tee /etc/timezone
dpkg-reconfigure --frontend noninteractive tzdata

wget http://apt.puppetlabs.com/puppetlabs-release-trusty.deb
sudo dpkg -i puppetlabs-release-trusty.deb

apt-get update && apt-get upgrade -y && apt-get autoremove && apt-get autoclean

apt-get -q -y install puppet

puppet module install puppetlabs-stdlib
puppet module install puppetlabs-apt
puppet module install puppetlabs-java
puppet module install puppetlabs-git
puppet module install maestrodev-maven
puppet module install rtyler-jenkins

puppet apply -d /vagrant_data/git.pp
puppet apply -d /vagrant_data/puppetScript.pp 
puppet apply -d /vagrant_data/jenkinsPlugins.pp

# Copy 3 xml files
cp /vagrant_data/config.xml /var/lib/jenkins/config.xml
cp /vagrant_data/hudson.plugins.git.GitTool.xml /var/lib/jenkins/hudson.plugins.git.GitTool.xml
cp /vagrant_data/hudson.tasks.Maven.xml /var/lib/jenkins/hudson.tasks.Maven.xml
mkdir /home/vagrant/.m2
chown vagrant /home/vagrant/.m2
cp /vagrant_data/settings.xml /home/vagrant/.m2/settings.xml
chown vagrant /home/vagrant/.m2/settings.xml
chgrp vagrant /home/vagrant/.m2/settings.xml