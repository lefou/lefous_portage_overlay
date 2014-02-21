# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils kde

DESCRIPTION="KDE 3 user interface for Strig search engine"
HOMEPAGE="http://www.vandenoever.info/software/strigi/"
SRC_URI="http://www.vandenoever.info/software/strigi/${P}.tar.bz2"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

RDEPEND=">=app-misc/strigi-0.5.1 >=app-text/poppler-0.5.4"

DEPEND=">=dev-util/cmake-2.4 ${RDEPEND}"

#S="${WORKDIR}/${P}"

need-kde 3.5

src_compile() {
	cmake -D CMAKE_INSTALL_PREFIX=/usr . || die "cmake failed"
	emake || die "emake failed"
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
}
