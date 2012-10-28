# Configure greptilian.com infrastructure with Vagrant

As of this writing there's only server1.greptilian.com

Note that git submodules are in use. An error and solution are below.

    [root@localhost greptilian-vagrant]# server1-puppet-apply.sh 
    Could not find class epel for localhost.localdomain at /root/greptilian-vagrant/modules/repos/manifests/init.pp:3 on node localhost.localdomain
    [root@localhost greptilian-vagrant]# 
    [root@localhost greptilian-vagrant]# git submodule init
    Submodule 'modules/epel' (https://github.com/stahnma/puppet-module-epel.git) registered for path 'modules/epel'
    [root@localhost greptilian-vagrant]# 
    [root@localhost greptilian-vagrant]# git submodule update
    Initialized empty Git repository in /root/greptilian-vagrant/modules/epel/.git/
    remote: Counting objects: 54, done.
    remote: Compressing objects: 100% (36/36), done.
    remote: Total 54 (delta 20), reused 49 (delta 15)
    Unpacking objects: 100% (54/54), done.
    Submodule path 'modules/epel': checked out '4fc5b13bc3182af7348ce4878cdc882884c358cb'
    [root@localhost greptilian-vagrant]# 
