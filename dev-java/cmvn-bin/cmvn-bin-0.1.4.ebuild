# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

MY_PN="cmvn"

DESCRIPTION="Comfigured Maven"
SRC_URI="http://cmvn.tototec.de/svn/cmvn/releases/cmvn/${MY_PN}-executable-${PV}.jar"
HOMEPAGE="http://cmvn.tototec.de/"
LICENSE="Apache-2.0"
KEYWORDS="~amd64 ~x86"
SLOT="0"
RDEPEND=">=virtual/jdk-1.6"
IUSE=""

src_unpack() {
	echo > /dev/null
}

CMVN_SHARE="/usr/share/${MY_PN}-${PV}"

src_install() {
	dodir "${CMVN_SHARE}/lib"
	cp ${DISTDIR}/${A} "${D}/${CMVN_SHARE}/lib" || die "Failed to copy ${A} to ${CMVN_SHARE}"

	dodir "${CMVN_SHARE}/bin"
	cat > "${D}/${CMVN_SHARE}/bin/${MY_PN}.sh" << EOF
#!/bin/sh
# pass all arguments to cmvn with $@
exec java -jar ${CMVN_SHARE}/lib/${A} \$@
EOF
	fperms +x "${CMVN_SHARE}/bin/${MY_PN}.sh"

	dodir /usr/bin
	dosym "${CMVN_SHARE}/bin/${MY_PN}.sh" /usr/bin/${MY_PN}
}
