# Copyright 1999-2006 Gentoo Technologies, Inc.
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Generates LaTeX Letters"
HOMEPAGE="http://lepetitfou.dyndns.org/"
SRC_URI="http://lepetitfou.dyndns.org/download/distfiles//${P}.tar.bz2"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE="kde"
DEPEND="dev-lang/python
	>=dev-python/wxpython-2.4
	virtual/tetex"

src_install() {
	make DESTDIR=${D} install || die
	dodoc README

	if use kde ; then
	    einfo "Installing KDE-Shortcut...."
	    insinto /usr/share/applnk/Application/
	    doins dinbrief.desktop
	fi
}
