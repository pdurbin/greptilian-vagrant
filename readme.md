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

### Apply post-provisioning fixes

(These are bugs and shouldn't be necessary.)

    service iptables restart

We restart iptables so port 80 gets opened up... we shouldn't have to... since `iptables` is subscribed to `/etc/sysconfig/iptables` and a refresh is triggered:

    notice: /Stage[last]/Last/Service[iptables]/ensure: ensure changed 'stopped' to 'running'
    notice: /Stage[last]/Last/Service[iptables]: Triggered 'refresh' from 1 events
