# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils
DESCRIPTION="A collection of sone usefull shorthand tools for Gentoo administation"
HOMEPAGE="http://lepetitfou.dyndns.org/projects/gentoo"
SRC_URI="http://lepetitfou.dyndns.org/download/${PN}/${P}.tar.bz2"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE="paludis"

RDEPEND="
	app-shells/bash
	dev-lang/perl
	paludis? ( >=sys-apps/paludis-0.16.2 )
	!paludis? ( sys-apps/portage )
	"

src_unpack() {
	unpack ${A}

	cd ${S}
	if use paludis ; then
        	sed -i "s/^\(GENTOOLKIT_LEFOU_BACKEND=\).*$/\1paludis/" gentoolkit-lefou.conf
	else
        	sed -i "s/^\(GENTOOLKIT_LEFOU_BACKEND=\).*$/\1portage/" gentoolkit-lefou.conf
        fi
}

src_install() {
	exeinto /usr/sbin
	newexe eunstable.sh eunstable 
	dosym eunstable /usr/sbin/eunmask
	dosym eunstable /usr/sbin/efullunmask
	dosym eunstable /usr/sbin/enokeyword
	newexe emaskclean.pl emaskclean
	newexe eupdate-unstable.pl eupdate-unstable

	insinto /etc
	doins gentoolkit-lefou.conf	

	dodoc README
}

pkg_postinst() {
	einfo "Please configure the portage backend and your architecture "
	einfo "by editing /etc/gentoolkit-lefou.conf"
}
