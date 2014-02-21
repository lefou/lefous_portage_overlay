# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

EAPI="3"

inherit kde4-base

DESCRIPTION="KDE Personal WebServer is a utility made to ease file sharing in KDE"
HOMEPAGE="http://kde-apps.org/content/show.php/KDE+Personal+WebServer?content=120462"
SRC_URI="http://kde-apps.org/CONTENT/content-files/120462-${PN}.tar.gz"
SLOT=0
KEYWORDS="~x86 ~amd64"

S=${WORKDIR}/${PN}

