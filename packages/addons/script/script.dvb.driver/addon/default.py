################################################################################
#      This file is part of LibreELEC - https://LibreELEC.tv
#      Copyright (C) 2016 Team LibreELEC
#
#  LibreELEC is free software: you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation, either version 2 of the License, or
#  (at your option) any later version.
#
#  LibreELEC is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with LibreELEC.  If not, see <http://www.gnu.org/licenses/>.
################################################################################

# YES I know that I have zero clue about python
# If someone could improve this mess - PRs are very welcome !

import os
import time

# create downloads folder at an fresh install
# otherwise the folder would be created at first smb access

if not os.path.exists("/storage/downloads"):
  os.makedirs("/storage/downloads")

# functions

def reboot():
	time.sleep(1)
	os.system("reboot")

def tbs():
	LF = open('/storage/downloads/dvb-drivers.txt', 'w')
	LF.write('4.4.13-tbs')
	LF.close()
	reboot()

def tbsdvbc():
	LF = open('/storage/downloads/dvb-drivers.txt', 'w')
	LF.write('4.4.13-tbs-dvbc')
	LF.close()
	reboot()

def crazycat():
	LF = open('/storage/downloads/dvb-drivers.txt', 'w')
	LF.write('4.4.13-crazycat')
	LF.close()
	reboot()

def ljalves():
	LF = open('/storage/downloads/dvb-drivers.txt', 'w')
	LF.write('4.4.13-ljalves')
	LF.close()
	reboot()

def ljalvescc():
	LF = open('/storage/downloads/dvb-drivers.txt', 'w')
	LF.write('4.4.13-ljalves-cc')
	LF.close()
	reboot()

def tbs_oss():
	LF = open('/storage/downloads/dvb-drivers.txt', 'w')
	LF.write('4.4.13-tbs-oss')
	LF.close()
	reboot()

def mediabuild():
	LF = open('/storage/downloads/dvb-drivers.txt', 'w')
	LF.write('4.4.13-media_build')
	LF.close()
	reboot()

def dvbsky():
	LF = open('/storage/downloads/dvb-drivers.txt', 'w')
	LF.write('4.4.13-dvbsky')
	LF.close()
	reboot()

def digital_devices():
	LF = open('/storage/downloads/dvb-drivers.txt', 'w')
	LF.write('4.4.13-digital_devices')
	LF.close()
	reboot()

def digital_devices_cc():
	LF = open('/storage/downloads/dvb-drivers.txt', 'w')
	LF.write('4.4.13-digital_devices-cc')
	LF.close()
	reboot()

try:
	args = ' '.join(sys.argv[1:])
except:
	args = ""

if args == 'tbs':
	tbs()
elif args == 'tbsdvbc':
	tbsdvbc()
elif args == 'crazycat':
	crazycat()
elif args == 'ljalves':
	ljalves()
elif args == 'ljalvescc':
	ljalvescc()
elif args == 'tbs_oss':
	tbs_oss()
elif args == 'mediabuild':
	mediabuild()
elif args == 'dvbskyc':
	dvbsky()
elif args == 'digital_devices':
	digital_devices()
elif args == 'digital_devices_cc':
	digital_devices_cc()
else:
	xbmc.executebuiltin('Addon.OpenSettings(script.dvb.driver)')
