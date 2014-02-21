# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

inherit java-pkg-2

MY_PN=apache-${PN%%-bin}
MY_PV=${PV/3.0.0_alpha/3.0-alpha-}
MY_PV=${MY_PV/3.0.0_beta/3.0-beta-}
MY_PV=${MY_PV/3.0.0/3.0}
MY_P="${MY_PN}-${MY_PV}"

DESCRIPTION="Project Management and Comprehension Tool for Java"
# http://www.apache.org/dyn/closer.cgi?path=/maven/binaries/apache-maven-3.0-alpha-5-bin.tar.gz
# http://www.apache.org/dyn/closer.cgi/maven/binaries/apache-maven-3.0-bin.tar.gz
SRC_URI="mirror://apache/maven/binaries/${MY_P}-bin.zip"
HOMEPAGE="http://maven.apache.org/"
LICENSE="Apache-2.0"
SLOT="3.0"
KEYWORDS="amd64 ~ppc x86"

RDEPEND=">=virtual/jdk-1.5
	app-admin/eselect-maven"

IUSE=""

S="${WORKDIR}/${MY_P}"

MAVEN=${PN}-${SLOT}
MAVEN_SHARE="/usr/share/${MAVEN}"

src_unpack() {
	unpack ${A}

	rm -v "${S}"/bin/*.bat || die
}

# TODO we should use jars from packages, instead of what is bundled
src_install() {
	dodir "${MAVEN_SHARE}"
	cp -Rp bin boot conf lib "${D}/${MAVEN_SHARE}" || die "failed to copy"

	java-pkg_regjar "${D}/${MAVEN_SHARE}"/lib/*.jar

	dodoc NOTICE.txt README.txt || die

	dodir /usr/bin
	dosym "${MAVEN_SHARE}/bin/mvn" /usr/bin/mvn-${SLOT}
}
