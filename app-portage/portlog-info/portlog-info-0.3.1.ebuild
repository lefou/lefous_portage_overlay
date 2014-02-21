# Copyright 1999-2004 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Analyzer for /var/log/portage log files."
HOMEPAGE="http://tdegreni.free.fr/gentoo/portlog-info"
#SRC_URI="http://tdegreni.free.fr/gentoo/${PN}"
LICENSE="GPL-2"
KEYWORDS="~x86"
SLOT="0"
DEPEND=""

src_install() {
	exeinto /usr/bin
	newexe ${FILESDIR}/portlog-info-${PV} portlog-info
}
