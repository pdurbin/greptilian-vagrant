#/bin/bash

usage() {
  echo "Usage: $0 --force and --destroy are both scary!"
  exit 1;
}

destroy() {
  # are you SURE about this??
  rm -rf ~/docs ~/docs.git ~/public_html
  exit 0;
}

do_setup() {
    #set -x
    git config --global user.name 'wikiuser'
    git config --global user.email wikiuser@ikiwiki-server
    cd ~
    mkdir ~/docs
    cd ~/docs
    git init
    git remote add origin ~/docs.git
    git config branch.master.merge refs/heads/master
    git config branch.master.remote origin
    echo foo > index.mdwn
    git add index.mdwn
    git commit -m 'Initial commit' index.mdwn 
    cd ~
    mkdir ~/docs.git
    cd ~/docs.git
    git init --bare --shared
    git --bare fetch ~/docs master:master
    cd
    ikiwiki --setup docs.setup 
}

case "$1" in
  --force|-f)
    do_setup
    exit 0;
    ;;
  --destroy|-d)
    destroy
    exit 0;
    ;;
  *)
    usage
    ;;
esac
