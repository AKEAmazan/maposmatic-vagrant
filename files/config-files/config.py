#!/usr/bin/env python
# coding: utf-8

import os

# Optional: if you need to extend the Python search path, then write
# something like the following:
# os.environ['PYTHONPATH'] = ('%s:%s' %
#     ('/path/to/lib/python/site-packages',
#      os.environ.get('PYTHONPATH', '')))

# Path to your OCitySMap installation
OCITYSMAP_PATH = '@INSTALLDIR@/ocitysmap'

# Log file for MapOSMatic. Leave empty for stderr.
MAPOSMATIC_LOG = None

# Log level (lower is more verbose)
# 50: critical
# 40: error
# 30: warning
# 20: info
# 10: debug
#  0: not set (discouraged)
MAPOSMATIC_LVL = 20
