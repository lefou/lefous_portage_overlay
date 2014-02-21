# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sys-kernel/module-rebuild/module-rebuild-0.5.ebuild,v 1.4 2006/01/11 14:06:01 gustavoz Exp $

inherit eutils

DESCRIPTION="A utility to rebuild any kernel modules which you have installed."
HOMEPAGE="http://www.gentoo.org/"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 ppc sparc x86"
IUSE="paludis"

RDEPEND="paludis? ( >=sys-apps/paludis-0.14.3 )"

src_unpack() {
	mkdir -p ${S}
	cp ${FILESDIR}/${PN}-0.5 ${S}/${PN}
	if use paludis ; then
		cd ${S}
		epatch ${FILESDIR}/${P}-paludis.patch
	fi
}

src_install() {
	newsbin ${PN} ${PN}
}

