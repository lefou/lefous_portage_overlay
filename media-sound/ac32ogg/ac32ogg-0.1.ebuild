# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils
DESCRIPTION="Usefull shell scripts to convert AC3/VOB-audio to ogg vorbis"
HOMEPAGE="https://lepetitfou.dyndns.org/wiki/bin/view/Werkstatt"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"

src_compile() { :; }

src_install() {
	exeinto /usr/bin
	newexe ${FILESDIR}/ac32ogg-0.1.sh ac32ogg
	dosym ac32ogg /usr/bin/vob2ogg
}
