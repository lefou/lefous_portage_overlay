# Copyright 2004-2006 André Malo
# Distributed under the terms of the GNU General Public License v2
# $Header$

inherit distutils

DESCRIPTION="A subversion commit notifier written in python"
SRC_URI="http://storage.perlig.de/svnmailer/${P}.tar.bz2"
HOMEPAGE="http://opensource.perlig.de/svnmailer/"
RESTRICT="nomirror"

IUSE=""
SLOT="0"
KEYWORDS="x86"
LICENSE="Apache-2.0"
DEPEND=">=dev-lang/python-2.3"
RDEPEND="${DEPEND}
	dev-util/subversion
	"

DOCS="CHANGES NOTICE CREDITS"

src_install() {
	distutils_src_install

	cd "${S}"
	cp -r docs/* "${D}/usr/share/doc/${PF}" || die
}
