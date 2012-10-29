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

### Run some one off stuff

#### Enable supybot cron job

    bash /usr/local/greptilian/sbin/supybot-setup

#### Install ikiwiki

    rm -rf /var/www/yum
    git clone https://github.com/pdurbin/ikiwiki-rpms.git /var/www/yum
    createrepo /var/www/yum
    yum -y --enablerepo=greptilian install ikiwiki ikiwiki-discount-hack

#### Stand up wiki.greptilian.com

FIXME: I want the ikiwiki srcdir to be writable by pdurbin but for now only root can. At least this gets the wiki back up.

    bash modules/server1/files/wikisetup
