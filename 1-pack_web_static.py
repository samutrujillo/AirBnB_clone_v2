#!/usr/bin/python3
"""Module to compress files
"""
from fabric.api import local
from datetime import datetime


def do_pack():
    """This method is to compress all files
    """
    date_time = datetime.now()
    compress = "web_static_{}.tgz".format(date_time.strftime("%Y%m%d%H%M%S"))
    local("mkdir -p versions/")
    try:
        comp_file = local("tar -cvzf versions/{} web_static/".format(compress))
        return "versions/{}".format(compress)
    except:
        return None
