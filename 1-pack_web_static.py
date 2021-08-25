#!/usr/bin/python3
"""Module to compress files
"""
from fabric.api import local
from datetime import datetime
import os, stat


def do_pack():
    compress = "web_static_{}{}{}{}{}{}.tgz".format(datetime.now().year,
                                                    datetime.now().month,
                                                    datetime.now().day,
                                                    datetime.now().hour,
                                                    datetime.now().minute,
                                                    datetime.now().second)
    if not os.path.isdir('versions'):
        os.mkdir('versions')
    print("Packing web_static to versions/{}".format(compress))
    local("tar -cvzf versions/{} web_static".format(compress))
    size = os.path.getsize("versions/{}".format(compress))
    print("web_static packed: versions/{} -> {}Bytes".format(compress, size))
    os.chmod("versions/{}".format(compress), 436)
    return "versions/{}".format(compress)
