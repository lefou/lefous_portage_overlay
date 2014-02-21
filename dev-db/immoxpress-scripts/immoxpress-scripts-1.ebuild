# Copyright 2006 Tobias Roeser, Orange Solution GbR

DESCRIPTION="Init-Scripts for ImmoXpress and the includes Pervasive DB"
HOMEPAGE="http://www.orange-solution.de"
LICENSE="as-is"
SLOT="0"
KEYWORDS="~x86"
IUSE=""
#DEPEND=""
#RDEPEND=""

src_compile() { :; }

src_install() {
	doinitd ${FILESDIR}/psql-gentoo
	doinitd ${FILESDIR}/dtid-gentoo
}
