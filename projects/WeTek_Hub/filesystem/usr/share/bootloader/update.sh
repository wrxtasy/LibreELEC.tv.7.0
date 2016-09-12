#!/bin/sh

################################################################################
#  This program is free software: you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation, either version 2 of the License, or
#  (at your option) any later version.
#
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with this program.  If not, see <http://www.gnu.org/licenses/>.
################################################################################

[ -z "$SYSTEM_ROOT" ] && SYSTEM_ROOT=""
[ -z "$BOOT_ROOT" ] && BOOT_ROOT="/flash"

# mount $BOOT_ROOT r/w
  mount -o remount,rw $BOOT_ROOT

# update Device Tree Blobs
#  for dtb in gxbb_p200_1G_wetek_hub.dtb dtb.img; do
  for dtb in dtb.img; do 
   if [ -f $SYSTEM_ROOT/usr/share/bootloader/$dtb ]; then
      echo "*** updating Device Tree Blob: $dtb ..."
      cp -p $SYSTEM_ROOT/usr/share/bootloader/dtb.img $BOOT_ROOT
    fi
  done

# mount $BOOT_ROOT r/o
  sync
  mount -o remount,ro $BOOT_ROOT
