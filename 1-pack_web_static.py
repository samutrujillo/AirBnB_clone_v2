#!/usr/bin/python3
"""Module to compress files
"""
from fabric.api import local
from datetime import datetime


def do_pack():
    compress = "web_static_{}{}{}{}{}{}.tgz".format(datetime.now().year,
                                                    datetime.now().month,
                                                    datetime.now().day,
                                                    datetime.now().hour,
                                                    datetime.now().minute,
                                                    datetime.now().second)
    local("mkdir versions/")
    try:
        local("tar -cvzf versions/{} web_static".format(compress))
        return "versions/{}".format(compress)
    except:
        return None
