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

PKG_NAME="script.dvb.driver"
PKG_VERSION="1.6"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="OSS"
PKG_SITE="http://www.libreelec.tv"
PKG_DEPENDS_TARGET=""
PKG_PRIORITY=""
PKG_SECTION=""
PKG_SHORTDESC="script.dvb.driver"
PKG_LONGDESC="script.dvb.driver"

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

make_target() {
  : # nothing to do here
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/share/kodi/addons/$PKG_NAME/resources
  cp -rP $PKG_DIR/addon/* $INSTALL/usr/share/kodi/addons/$PKG_NAME

  if [ "$TARGET_ARCH" = x86_64 ]; then
    cp $PKG_DIR/resources/settings_generic.xml $INSTALL/usr/share/kodi/addons/$PKG_NAME/resources/settings.xml
  fi

  if [ "$TARGET_ARCH" = aarch64 ]; then
    cp $PKG_DIR/resources/settings_aarch64.xml $INSTALL/usr/share/kodi/addons/$PKG_NAME/resources/settings.xml
  fi
}
