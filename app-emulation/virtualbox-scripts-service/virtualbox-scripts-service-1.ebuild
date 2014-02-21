# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit eutils
DESCRIPTION="Start-stop scripts for (headless) VirtualBox virtual machines"

HOMEPAGE="http://lepetitfou.dyndns.org/redmine/projects/lefousportageoverlay/"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="x86 amd64"
IUSE=""

RDEPEND="app-emulation/virtualbox-modules
	|| ( app-emulation/virtualbox app-emulation/virtualbox-bin )"

S=${WORKDIR}

src_configure() { :; }

src_compile() { :; }

src_install() {
	newinitd ${FILESDIR}/virtualbox.init virtualbox
	newconfd ${FILESDIR}/virtualbox.example.conf virtualbox.example
}

