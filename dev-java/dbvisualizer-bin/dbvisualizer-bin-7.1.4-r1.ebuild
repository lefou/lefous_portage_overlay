# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

EAPI="2"
inherit eutils

MY_PN=DbVisualizer
MY_PV=${PV//./_}
MY_P=${MY_PN}-${PV}
DOWNLOADFILE="dbvis_unix_${MY_PV}.tar.gz"


DESCRIPTION="Universal database tool"
#http://www.dbvis.com/download/registerDownload.jsp?prodid=71&product=DbVisualizer&version=7.1.4&version_type=current&target_os=unix&with_jre=false&filename=dbvis_unix_7_1_4.tar.gz&type=UNIX+(tar.gz+archive)&installer=%2fproduct_download%2fdbvis-7.1.4%2fmedia%2fdbvis_unix_7_1_4.tar.gz
RESTRICT="fetch"
#SRC_URI="http://www.dbvis.com/download/registerDownload.jsp?prodid=71&product=DbVisualizer&version=${PV}&version_type=current&target_os=unix&with_jre=false&filename=dbvis_unix_${MY_PV}.tar.gz&type=UNIX+(tar.gz+archive)&installer=%2fproduct_download%2fdbvis-${PV}%2fmedia%2fdbvis_unix_${MY_PV}.tar.gz -> dbvis_unix_${MY_PV}.tar.gz"
SRC_URI="${DOWNLOADFILE}"

HOMEPAGE="http://www.dbvis.com/"
LICENSE="free-noncomm"
SLOT="7"
KEYWORDS="amd64 x86"

RDEPEND=">=virtual/jre-1.6"

IUSE=""

#S=${WORKDIR}/${MY_P}

pkg_nofetch() {
    einfo "Please download '${DOWNLOADFILE}'"
    einfo "from ${HOMEPAGE} and place them in ${DISTDIR}"
}

src_install() {
	dodir opt
	cp -r ${MY_P} ${D}/opt/${MY_P}
	dosym /opt/${MY_P}/dbvis /usr/bin/dbvis-7
}
