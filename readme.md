# Configure greptilian.com infrastructure with Vagrant

By using Vagrant, I can quickly iterate on the Puppet configs for my home server (server1.greptilian.com). Manifests are first applied to the Vagrant VM where bugs are worked out. Then changes are commited to this repo and applied to the production VM.

## How to reprovision server1.greptilian.com

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
    modules/server1/files/usr/sbin/server1-puppet-apply.sh

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

### Patch and reboot

    yum -y update && reboot

### Bugs

If I don't reboot I have to restart iptables so port 80 gets opened up... I shouldn't have to... since iptables is subscribed to `/etc/sysconfig/iptables` and a refresh is triggered...

    notice: /Stage[last]/Last/Service[iptables]/ensure: ensure changed 'stopped' to 'running'
    notice: /Stage[last]/Last/Service[iptables]: Triggered 'refresh' from 1 events
