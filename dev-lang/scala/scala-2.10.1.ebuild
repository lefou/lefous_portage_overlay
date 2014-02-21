inherit eutils multilib portability java-pkg-2 versionator

PROJECT_DISTR="scala-2.10.1"

SLOT="0"
LICENSE="BSD"
DESCRIPTION="Scala Programming language targeting the Java Virtual Machine (JVM)"
HOMEPAGE="http://www.scala-lang.org"
SRC_URI="http://www.scala-lang.org/downloads/distrib/files/${PROJECT_DISTR}.tgz"

DEPEND=">=virtual/jdk-1.6
"

S=${WORKDIR}

SCALA_BINARIES=(scala scalac scaladoc scalap fsc)

src_install() {
	declare SCALA_INSTALL_DIR=/opt/

	dodir ${SCALA_INSTALL_DIR}
	cp -R ${PROJECT_DISTR}/ "${D}"${SCALA_INSTALL_DIR} || die "Unable to install"

	java-pkg_dojar "${PROJECT_DISTR}"/lib/*.jar
	java-pkg_dojar "${PROJECT_DISTR}"/misc/scala-devel/plugins/*.jar

	dodir /usr/bin
	for b in ${SCALA_BINARIES[*]}
	do
	   dosym "${SCALA_INSTALL_DIR}/${PROJECT_DISTR}/bin/${b}" /usr/bin/${b}
	done
}
