# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

inherit subversion kde

ESVN_REPO_URI="https://lepetitfou.dyndns.org/svn/kthinkbat/kthinkbat-kicker/trunk/"
ESVN_BOOTSTRAP=""

DESCRIPTION="A ThinkPad Battery Viewer Applet"
HOMEPAGE="https://lepetitfou.dyndns.org/KThinkBat"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE="tpsmapi"

DEPEND=""
RDEPEND="tpsmapi? ( app-laptop/tp_smapi )"

need-kde 3.3

S=${WORKDIR}/${PN/-svn}

src_unpack() {
	subversion_src_unpack
}

src_compile() {
	make -f Makefile.cvs
	kde_src_compile
}

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
