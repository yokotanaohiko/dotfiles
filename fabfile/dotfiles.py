#!/usr/local/bin/python
# -*- codings:utf-8 -*-

import cuisine as cs
import fabric.api as fb
from fabric.decorators import task,parallel
from fabric.contrib.files import exists

@fb.task
def cent_setup():
    with cs.mode_sudo() :
        if not cs.package_ensure_yum('zsh',update=True) :
            cs.run('chsh -s /bin/zsh')
        if not cs.package_ensure_yum('git',update=True) :
            cs.run('git config --global user.name "yokotanaohiko"')
            cs.run('git config --global user.email iam4570@yahoo.co.jp')
        cs.package_ensure_yum('vim-enhanced',update=True)
        cs.package_ensure_yum('gcc',update=True)
        cs.package_ensure_yum('make',update=True)

@fb.task
def ubuntu_setup():
    with cs.mode_sudo():
        if not cs.package_ensure_apt('zsh',update=True) :
            cs.run('chsh -s /bin/zsh')
        if not cs.package_ensure_apt('git',update=True) :
            pass
        cs.package_ensure_apt('vim-enhansed',update=True)
        cs.package_ensure_apt('gcc',update=True)
        cs.package_ensure_apt('make',update=True)

def ant_setup() :
    with cs.mode_sudo() :
        cs.package_ensure_yum('ant',update=True)

def maven_serup(ver="3.2.1") :

    cs.run("wget http://ftp.riken.jp/net/apache/maven/binaries/apache-maven-%s-bin.tar.gz" % ver)
    cs.run("xzvf apache-maven-%s-bin.tar.gz" % ver)
    cs.run("ln -s ~/apache-maven-%s /usr/share/maven3" % ver)

    

@fb.task
def setup(os_name="") :
    if os_name :
        if os_name == "centos" :
            print("centos setup")
            cent_setup()
        if os_name == "ubuntu" :
            print("ubuntu setup")
            ubuntu_setup()

    if not exists('~/dotfiles') :
        cs.run('git clone https://github.com/yokotanaohiko/dotfiles.git')
	with cs.mode_sudo() :
		cs.run('rm -r .vim')
		cs.run('rm .vim*')
		cs.run('rm .zshrc*')

    with cs.cd('~/dotfiles') :
        cs.run('./setup.sh ; true')

	cs.run('vim -c NeoBundleInstall -c q')
    
