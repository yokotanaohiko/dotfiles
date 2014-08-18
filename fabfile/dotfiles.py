#!/usr/local/bin/python
# -*- codings:utf-8 -*-

import cuisine as cs
import fabric.api as fb
from fabric.decorators import task,parallel
from fabric.contrib.files import exists
@task
@parallel
def setup() :
    if not exists('~/dotfiles') :
        cs.run('git clone https://github.com/yokotanaohiko/dotfiles.git')
    with cs.cd('~/dotfiles') :
        cs.run('./setup.sh ; true')
        cs.run('vim -c NeoBundleInstall -c q')
    
