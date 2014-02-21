# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

inherit kde

#S=${WORKDIR}/${PN}

DESCRIPTION="A ThinkPad Battery Viewer Applet"
HOMEPAGE="https://lepetitfou.dyndns.org/KThinkBat"
SRC_URI="http://lepetitfou.dyndns.org/download/kthinkbat/src/kthinkbat-0.2.x/${P}.tar.bz2"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="x86 amd64"
IUSE="tpsmapi"

DEPEND=""
RDEPEND="tpsmapi? ( app-laptop/tp_smapi )"

need-kde 3.3

src_install() {
	kde_src_install
	dodoc COPYING* Contributors README
}

pkg_postinst() {
	einfo
	einfo "On ThinkPads, KThinkBat can make use of the SMAPI BIOS."
	einfo
	einfo "If you want to use this feature, make sure you have"
	einfo "the kernel module tp_smapi (from app-laptop/tp_smapi)"
	einfo "loaded."
	einfo
	einfo "To autoload this kernel module at system startup type"
	einfo
	einfo "  # echo \"tp_smapi\" >> /etc/modules.autoload.d/kernel-2.6"
	einfo

	buildsycoca
}

