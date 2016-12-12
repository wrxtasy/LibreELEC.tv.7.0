#!/bin/sh

################################################################################
#      This file is part of LibreELEC - https://libreelec.tv
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

[ -z "$SYSTEM_ROOT" ] && SYSTEM_ROOT=""
[ -z "$BOOT_ROOT" ] && BOOT_ROOT="/flash"
[ -z "$BOOT_PART" ] && BOOT_PART=$(df "$BOOT_ROOT" | tail -1 | awk {' print $1 '})
if [ -z "$BOOT_DISK" ]; then
  case $BOOT_PART in
    /dev/sd[a-z][0-9]*)
      BOOT_DISK=$(echo $BOOT_PART | sed -e "s,[0-9]*,,g")
      ;;
    /dev/mmcblk*)
      BOOT_DISK=$(echo $BOOT_PART | sed -e "s,p[0-9]*,,g")
      ;;
  esac
fi

# mount $BOOT_ROOT r/w
  mount -o remount,rw $BOOT_ROOT

# update Device Tree Blobs
  for all_dtb in /flash/*.dtb /flash/DTB; do
    dtb=$(basename $all_dtb)
    if [ -f $SYSTEM_ROOT/usr/share/bootloader/$dtb ]; then
      echo "*** updating Device Tree Blob: $dtb ..."
      cp -p $SYSTEM_ROOT/usr/share/bootloader/$dtb $BOOT_ROOT
    fi
  done

if [ -f $SYSTEM_ROOT/usr/share/bootloader/boot-logo.bmp.gz ]; then
  echo "*** updating boot logo ..."
  cp -p $SYSTEM_ROOT/usr/share/bootloader/boot-logo.bmp.gz $BOOT_ROOT
fi

echo "*** updating u-boot for Odroid on: $BOOT_DISK ..."

if ! [ -f $BOOT_ROOT/boot.ini.old ]; then
  echo "*** backing up boot.ini & updating bootloader ..."
  mv $BOOT_ROOT/boot.ini $BOOT_ROOT/boot.ini.old
  cp -p $SYSTEM_ROOT/usr/share/bootloader/boot.ini.new $BOOT_ROOT/boot.ini
fi


dd if=$SYSTEM_ROOT/usr/share/bootloader/u-boot of=$BOOT_DISK conv=fsync bs=1 count=112
dd if=$SYSTEM_ROOT/usr/share/bootloader/u-boot of=$BOOT_DISK conv=fsync bs=512 skip=1 seek=1

# monkey patch boot.ini for updated kernel
  sed -i 's|setenv odroidp1  "no_console_suspend hdmimode=${m} m_bpp=${m_bpp} vout=${vout} disablehpd=${hpd}"|setenv odroidp1 "no_console_suspend vout=${vout},enable hdmimode=${m} m_bpp=${m_bpp} cvbsmode=nocvbs"|' /flash/boot.ini
  sed -i 's|setenv odroidp2  "${disableuhs} consoleblank=0|setenv odroidp2 "mac=${ethaddr} ${disableuhs} consoleblank=0|' /flash/boot.ini
  sed -i 's|setenv timer   "fdt addr 0x1000000; fdt rm /timer"|#|' /flash/boot.ini

# mount $BOOT_ROOT r/o
  sync
  mount -o remount,ro $BOOT_ROOT
