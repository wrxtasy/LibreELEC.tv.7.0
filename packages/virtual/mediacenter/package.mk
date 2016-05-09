################################################################################
#      This file is part of OpenELEC - http://www.openelec.tv
#      Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
#
#  OpenELEC is free software: you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation, either version 2 of the License, or
#  (at your option) any later version.
#
#  OpenELEC is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with OpenELEC.  If not, see <http://www.gnu.org/licenses/>.
################################################################################

PKG_NAME="mediacenter"
PKG_VERSION=""
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://www.libreelec.tv"
PKG_URL=""
PKG_DEPENDS_TARGET="toolchain $MEDIACENTER"
PKG_PRIORITY="optional"
PKG_SECTION="virtual"
PKG_SHORTDESC="Mediacenter: Metapackage"
PKG_LONGDESC=""

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

if [ "$MEDIACENTER" = "kodi" ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET $MEDIACENTER-theme-$SKIN_DEFAULT"

  for i in $SKINS; do
    PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET $MEDIACENTER-theme-$i"
  done

# some python stuff needed for various addons
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET Pillow"
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET simplejson"
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET pycrypto"
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET xmlstarlet"

# other packages
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET LibreELEC-settings"

# PVR Addons
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET pvr.argustv"
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET pvr.demo"
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET pvr.dvblink"
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET pvr.dvbviewer"
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET pvr.filmon"
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET pvr.hts"
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET pvr.hdhomerun"
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET pvr.iptvsimple"
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET pvr.mediaportal.tvserver"
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET pvr.mythtv"
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET pvr.nextpvr"
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET pvr.njoy"
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET pvr.pctv"
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET pvr.stalker"
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET pvr.vbox"
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET pvr.vdr.vnsi"
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET pvr.vuplus"
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET pvr.wmc"

# visualization addons
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET visualization.spectrum"
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET visualization.waveform"
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET visualization.shadertoy"
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET visualization.wavforhue"

# screensaver addons
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET screensaver.shadertoy"

fi
