# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

EAPI="3"

inherit kde4-base

DESCRIPTION="A KDE program for users of AVMs Fritz!Box to get call signaling and other functions."
HOMEPAGE="http://www.joachim-wilke.de/kfritz.htm"
SRC_URI="http://www.joachim-wilke.de/dl.htm?ct=gz&dir=${PN}&file=${PN}_${PV}.orig.tar.gz"
SLOT=0
KEYWORDS="x86 amd64"

S=${WORKDIR}/${PN}

DEPEND=">=dev-libs/libindicate-qt-0.2.2 
	dev-libs/openssl"
RDEPEND="${DEPEND}"

src_unpack() {
	kde4-base_src_unpack
	epatch ${FILESDIR}/${P}-cmake.patch
}
