# Copyright 1999-2006 Gentoo Foundation, Inc.
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit rpm kde

MY_P=${P/_p/-}

DESCRIPTION="KDE kio slave for slp (using openslp)"
HOMEPAGE="http://opensuse.org"
LICENSE="GPL-2"
SLOT="0"
IUSE=""
SRC_URI="mirror://opensuse/distribution/SL-OSS-factory/inst-source/suse/src/${MY_P}.src.rpm
	http://lepetitfou.dyndns.org/download/distfiles/${MY_P}.src.rpm"
KEYWORDS="~x86 ~amd64"
RDEPEND="net-libs/openslp"
DEPEND="|| ( kde-base/kapptemplate kde-base/kdesdk )
	${RDEPEND}"

S=${WORKDIR}/${PN}

need-kde 3.4

src_unpack() {
	rpm_src_unpack

	cd ${PN}
	cp -dpR ${KDEDIR}/share/apps/kapptemplate/admin admin
	chmod +x admin/detect-autoconf.pl
}

pkg_postinst()
{
	echo
	einfo "To start using the services provided by kio_slp,"
	einfo "point Konqueror to 'service:/', 'slp:/' and/or 'mdns:/'"
	echo
}
