# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

EAPI="2"
inherit eutils

MY_PN="DbVisualizer"
#MY_PV="${PV//./_}"
MY_P="${MY_PN}-${PV}"


DESCRIPTION="Universal database tool"
#https://www.dbvis.com/product_download/dbvis-9.5.7/media/dbvis_unix_9_5_7.tar.gz
#SRC_URI="http://www.dbvis.com/download/registerDownload.jsp?prodid=71&product=DbVisualizer&version=${PV}&version_type=current&target_os=unix&with_jre=false&filename=dbvis_unix_${MY_PV}.tar.gz&type=UNIX+(tar.gz+archive)&installer=%2fproduct_download%2fdbvis-${PV}%2fmedia%2fdbvis_unix_${MY_PV}.tar.gz -> dbvis_unix_${MY_PV}.tar.gz"
SRC_URI="https://www.dbvis.com/product_download/dbvis-${PV}/media/dbvis_unix_${PV//./_}.tar.gz"

HOMEPAGE="http://www.dbvis.com/"
LICENSE="free-noncomm"
SLOT="9"
KEYWORDS="~amd64 ~x86"

RDEPEND=">=virtual/jre-1.6"

IUSE=""

S=${WORKDIR}/${MY_PN}

src_install() {
	dodir opt
	cp -r ${S} ${D}/opt/${MY_P}
	dosym /opt/${MY_P}/dbvis /usr/bin/dbvis-9
}
