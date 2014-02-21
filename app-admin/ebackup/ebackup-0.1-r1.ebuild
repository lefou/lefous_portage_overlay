# Copyright 1999-2006 Gentoo Foundation, Inc.
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils
DESCRIPTION="A small backup script with configuration by lefou"
HOMEPAGE="https://lepetitfou.dyndns.org/TobiasRoeser"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="x86"
IUSE=""

src_compile() { :; }

src_install() {
	exeinto /usr/bin
	newexe ${FILESDIR}/ebackup-0.1.sh ebackup
}
