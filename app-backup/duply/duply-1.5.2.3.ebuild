# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils
DESCRIPTION="Duply is a shell front end for the duplicity backup tool duplicity"
HOMEPAGE="http://sourceforge.net/projects/ftplicity/"
SRC_URI="mirror://sourceforge/ftplicity/${PN}_${PV}.tgz"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
	app-shells/bash
	app-backup/duplicity
	"

S=${WORKDIR}/${PN}_${PV}

src_install() {
	exeinto /usr/bin
	newexe duply duply

	dodoc gpl.txt INSTALL.txt
}

