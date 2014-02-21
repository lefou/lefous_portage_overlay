## Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

inherit java-pkg-2

MY_PN=${PN/-bin/}
MY_P=${MY_PN}-${PV}

DESCRIPTION="Helper tool from OPS4J to easily start OSGi plattforms."
HOMEPAGE="http://wiki.ops4j.org/confluence/display/ops4j/Pax+Runner"
SRC_URI="http://repo1.maven.org/maven2/org/ops4j/pax/runner/pax-runner-assembly/${PV}/pax-runner-assembly-${PV}-jdk15.zip"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""
DEPEND=">=virtual/jdk-1.5"
RDEPEND=">=virtual/jre-1.5"

src_install() {
	insinto /usr/share/${MY_P}/bin
	doins ${MY_P}/bin/${MY_P}.jar
	exeinto /usr/share/${MY_P}/bin
	doexe ${MY_P}/bin/pax-run.sh
	dosym /usr/share/${MY_P}/bin/pax-run.sh /usr/bin/pax-run
}
