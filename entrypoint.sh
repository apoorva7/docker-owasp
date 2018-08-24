#!/bin/bash

service filebeat start
tail -f /var/log/dpkg.log
