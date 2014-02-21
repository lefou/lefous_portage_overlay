# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit subversion eutils

ESVN_REPO_URI="https://lepetitfou.dyndns.org/svn/gentoo/gentoolkit-lefou/trunk/"
ESVN_BOOTSTRAP=""

DESCRIPTION="A collection of sone usefull shorthand tools for Gentoo administation"
HOMEPAGE="http://lepetitfou.dyndns.org/projects/gentoo"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE="paludis"
PROPERTIES="interactive"

RDEPEND="
	app-shells/bash
	dev-lang/perl
	paludis? ( >=sys-apps/paludis-0.16.2 )
	!paludis? ( sys-apps/portage )
	"

src_unpack() {
	subversion_src_unpack

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
