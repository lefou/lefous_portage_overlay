# Copyright 1999-2006 Gentoo Technologies, Inc.
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

DESCRIPTION="Native makefiles generator"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"
HOMEPAGE="http://bakefile.sourceforge.net"
LICENSE="GPL-2"
RDEPEND=">=dev-lang/python-2.2.2
	>=sys-devel/autoconf-2.53"
DEPEND="${RDEPEND}"
KEYWORDS="x86"
SLOT="0"
IUSE=""

src_install () {
	einstall
	dodoc AUTHORS COPYING NEWS README THANKS
	dohtml -r doc/html/*
}
