#!/usr/local/bin/python
# -*- codings:utf-8 -*-

import cuisine as cs
import fabric.api as fb
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
def setup() :
    cent_setup()

    if not exists('~/dotfiles') :
        cs.run('git clone https://github.com/yokotanaohiko/dotfiles.git')
    with cs.cd('~/dotfiles') :
        cs.run('./setup.sh ; true')
        cs.run('vim -c NeoBundleInstall -c q')
    
