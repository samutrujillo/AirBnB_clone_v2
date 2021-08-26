#!/usr/bin/python3
"""Module to compress files
"""
from fabric.api import local
from datetime import datetime


def do_pack():
    '''Function that generates the .tgz archives '''
    # if versions folder does not exist
    local('mkdir -p versions/')

    date_time = datetime.now()
    str_date = date_time.strftime('%Y%m%d%H%M%S')
    archive_path = 'versions/web_static_' + str_date + '.tgz'

    # Generates the .tgz archive
    try:
        tar_file = local('tar -cvzf {} web_static/'.format(archive_path))
        return archive_path
    except:
        return None
