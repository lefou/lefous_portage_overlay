# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils
DESCRIPTION="Usefull shell scripts to convert AC3/VOB-audio to ogg vorbis"
HOMEPAGE="https://lepetitfou.dyndns.org/wiki/bin/view/Werkstatt"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="x86"

RDEPEND=">=media-video/transcode-0.6.10 >=media-sound/vorbis-tools-1.0"

src_compile() { :; }

src_install() {
	exeinto /usr/bin
	newexe ${FILESDIR}/ac32ogg-${PV}.sh ac32ogg
	dosym ac32ogg /usr/bin/vob2ogg
}
