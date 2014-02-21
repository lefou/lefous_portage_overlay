# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

#inherit java-pkg-2

DESCRIPTION="Build Tool for Java"
SRC_URI="http://lepetitfou.dyndns.org/download/${PN}/${PN}-0.0.x/${P}.zip"
HOMEPAGE="http://lepetitfou.dyndns.org/redmine/jackbuild"
LICENSE="Apache-2.0"
SLOT="1"
KEYWORDS="~amd64 ~ppc ~x86"

RDEPEND=">=virtual/jdk-1.5"

IUSE=""

JACKBUILD_SHARE="/usr/share/${P}"


# TODO we should use jars from packages, instead of what is bundled
src_install() {
	dodir "/usr/share"
	cp -Rp "${S}" "${D}/${JACKBUILD_SHARE}" || die "failed to copy"
	chmod +x "${D}/${JACKBUILD_SHARE}/bin/jackbuild.sh"

	# java-pkg_regjar "${D}/${JACKBUILD_SHARE}"/lib/*.jar

	dodir /usr/bin
	dosym "${JACKBUILD_SHARE}/bin/jackbuild.sh" /usr/bin/jackbuild
}
