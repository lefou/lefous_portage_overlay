# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Cat files and Strip all lines with comment."

HOMEPAGE="http://lepetitfou.dyndns.org/"
#SRC_URI="ftp://foo.bar.com/${P}.tar.gz"
LICENSE="as-is"
SLOT="0"
KEYWORDS="x86"
IUSE=""
DEPEND="sys-apps/sed"
RDEPEND="${DEPEND}"
#S="${WORKDIR}/${P}"

src_unpack() {
	cd {$}
	cat > confcat << EOF
#!/bin/sed -f
s/#.*// 
/^\s*$/d
EOF
	}

src_install() {
	dobin confcat
}
