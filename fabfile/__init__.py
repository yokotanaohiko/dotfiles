#!/usr/local/bin/python
# -*- codings:utf-8 -*-



import cuisine as cs
import fabric.api as fb
from fabric.colors import *
import dotfiles
fb.env.hosts = ['job@ikuro.tokyo']
#fb.env.hosts = ['nayokota-s1.ssk.ynwm.yahoo.co.jp','nayokota.anj.ssk.ynwm.yahoo.co.jp']

@fb.task
def hello():
    with cs.cd('/usr/java') :
        status = cs.run('java && echo OK ; true')
        with cs.mode_sudo() :
            if status.endswith('OK') :
                cs.run('rpm -Uvh jre-7u7-linux-i586.rpm')
            else :
                cs.run('rpm -ivh jre-7u7-linux-i586.rpm')
    cs.run(green('echo "Hello World"'))

@fb.task
def java_install():
    cs.package_ensure_yum("java-1.7.0-openjdk-devel.x86_64")


@fb.task
def test_method(): 
    with cs.mode_local() :

        print(green("hello")+red("world")+blue("desu")+yellow("testest"))
