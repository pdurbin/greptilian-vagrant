# Configure greptilian.com infrastructure with Vagrant

By using Vagrant, I can quickly iterate on the Puppet configs for my home server (server1.greptilian.com). Manifests are first applied to the Vagrant VM where bugs are worked out. Then changes are commited to this repo and applied to the production VM.

## How to operate on a local server1.greptilian.com VM with Vagrant

### How to start and ssh into your own local server1.greptilian.com VM

    git clone https://github.com/pdurbin/greptilian-vagrant.git
    cd greptilian-vagrant
    git submodule init
    git submodule update
    vagrant up
    vagrant ssh

http://localhost:8080 is where Vagrant will try to forward port 80.

### How to make changes to your own local server1.greptilian.com VM

    vim modules/server1/manifests/init.pp
    vagrant provision

### How to shutdown or destroy your own local server1.greptilian.com VM

    vagrant halt
    vagrant destroy

### How to rebuild your own local server1.greptilian.com VM (after a destroy)

    vagrant up

## How to reprovision the production server1.greptilian.com

Here's how I configure a newly imaged production VM.

### Restore baseline image from a snapshot

    ssh -p 12345 console.v2s.org

(I reset the root password as well.)

### Enable EPEL and install git and puppet

    curl -O http://mirror.us.leaseweb.net/epel/6/i386/epel-release-6-7.noarch.rpm
    yum -y install epel-release*
    yum -y install git puppet

### Clone this repo and run Puppet

    git clone https://github.com/pdurbin/greptilian-vagrant.git
    cd greptilian-vagrant
    git submodule init
    git submodule update
    modules/server1/files/usr/local/greptilian/sbin/greptilian-puppet-apply

### Run some one off stuff

#### Enable supybot cron job (as root)

    bash /usr/local/greptilian/sbin/supybot-setup

#### Install ikiwiki via http://yum.greptilian.com (as root)

    bash /usr/local/greptilian/sbin/yum-setup 

#### Set up http://wiki.greptilian.com (as pdurbin)

    bash /usr/local/greptilian/bin/wiki-setup 

### pdurbin user setup

    passwd pdurbin
    ~pdurbin/.ssh/authorized_keys
    git clone https://github.com/pdurbin/dotfiles.git

### MySQL setup

    /usr/bin/mysql_secure_installation

### Setup for http://thinkup.greptilian.com

    mysql -u root -p

    create database thinkup;
    grant all privileges on thinkup.* to 'thinkup'@'localhost' identified by 'REDACTED';
    flush privileges;

    rm -rf /var/www/thinkup
    git clone https://github.com/ginatrapani/ThinkUp/ /var/www/thinkup

FIXME: should probably pick a branch to run rather than "master".

    /usr/local/greptilian/sbin/greptilian-puppet-apply

http://thinkup.greptilian.com/install

### Patch and reboot (as root)

    yum -y update && reboot

### Bugs

If I don't reboot I have to restart iptables so port 80 gets opened up... I shouldn't have to... since iptables is subscribed to `/etc/sysconfig/iptables` and a refresh is triggered...

    notice: /Stage[last]/Last/Service[iptables]/ensure: ensure changed 'stopped' to 'running'
    notice: /Stage[last]/Last/Service[iptables]: Triggered 'refresh' from 1 events
