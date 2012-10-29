# Configure greptilian.com infrastructure with Vagrant

As of this writing there's only server1.greptilian.com

## How to reprovision server1.greptilian.com

### Restore from a snapshot and set the root password via console:

    ssh -p 12345 console.v2s.org

### Enable EPEL and install git and puppet

    curl -O http://mirror.us.leaseweb.net/epel/6/i386/epel-release-6-7.noarch.rpm
    yum -y install epel-release*
    yum -y install git puppet

### Clone this repo and run puppet

    git clone https://github.com/pdurbin/greptilian-vagrant.git
    cd greptilian-vagrant
    git submodule init
    git submodule update
    modules/server1/files/usr/sbin/server1-puppet-apply.sh
