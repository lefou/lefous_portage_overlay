# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

MY_PN="sbuild"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="SBuild is a very fast, powerful and flexible build tool"
SRC_URI="http://sbuild.org/uploads/sbuild/${PV}/${MY_P}-dist.zip"
HOMEPAGE="http://sbuild.org/"
LICENSE="Apache-2.0"
KEYWORDS="~amd64 ~x86"
SLOT="0"
RDEPEND=">=virtual/jdk-1.6"
IUSE=""

S="${WORKDIR}/${MY_P}"

SBUILD_HOME="/usr/share/${MY_P}"

src_install() {
	cd "${S}"

	rm "bin/sbuild.bat"

	insinto "${SBUILD_HOME}/lib"
	doins lib/*
	insinto "${SBUILD_HOME}/doc"
	doins doc/*
	dodoc doc/*
	exeinto "${SBUILD_HOME}/bin"
	doexe bin/*

	dodir /usr/bin
	dosym "${SBUILD_HOME}/bin/${MY_PN}" /usr/bin/${MY_PN}
	dosym "${SBUILD_HOME}/bin/${MY_PN}-debug" /usr/bin/${MY_PN}-debug

        dodir /usr/share
        dosym ${SBUILD_HOME} /usr/share/${MY_PN}
}
