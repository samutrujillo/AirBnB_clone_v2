#!/usr/bin/python3
"""Module to compress files
"""
from fabric.api import local
from datetime import datetime


def do_pack():
    date_time = date_time.now()
    compress = "web_static_{}.tgz".format(date_time.strftime("%Y%m%d%H%M%S"))
    local("mkdir versions/")
    try:
        local("tar -cvzf versions/{} web_static".format(compress))
        return "versions/{}".format(compress)
    except:
        return None
