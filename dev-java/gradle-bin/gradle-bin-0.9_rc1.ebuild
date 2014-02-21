# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

inherit java-pkg-2

MY_PN=${PN%%-bin}
MY_PV=${PV/_rc/-rc-}
MY_P="${MY_PN}-${MY_PV}"

DESCRIPTION="A better way to build."
# http://dist.codehaus.org/gradle/gradle-0.9-rc-1-bin.zip
#SRC_URI="mirror://apache/maven/binaries/${MY_P}-bin.tar.gz"
SRC_URI="http://dist.codehaus.org/gradle/${MY_P}-bin.zip"
HOMEPAGE="http://www.gradle.org/"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86"

RDEPEND=">=virtual/jdk-1.5"

IUSE=""

S="${WORKDIR}/${MY_P}"

GRADLEDIR=/usr/share/${MY_P}

src_unpack() {
	unpack ${A}

	rm -v "${S}"/bin/*.bat || die
}

# TODO we should use jars from packages, instead of what is bundled
src_install() {
	dodir ${GRADLEDIR}
	cp -Rp bin lib "${D}/${GRADLEDIR}" || die "failed to copy"

	java-pkg_regjar "${D}/${GRADLEDIR}"/lib/*.jar "${D}/${GRADLEDIR}"/lib/plugins/*.jar

	dodoc LICENSE NOTICE changelog.txt getting-started.html || die

	dodir /usr/bin
	dosym "${GRADLEDIR}/bin/gradle" /usr/bin/gradle
}
