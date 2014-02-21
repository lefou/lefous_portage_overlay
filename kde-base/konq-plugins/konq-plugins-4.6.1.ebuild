# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

#KMNAME="konq-plugins"
inherit kde4-base

DESCRIPTION="Various plugins for konqueror"
HOMEPAGE="http://kde.org/"

LICENSE="GPL-2"
KEYWORDS=""
IUSE="debug tidy"
SRC_URI="ftp://ftp.fu-berlin.de/pub/unix/X11/gui/kde/stable/4.6.1/src/konq-plugins-4.6.1.tar.bz2"

DEPEND="
	$(add_kdebase_dep libkonq)
	tidy? ( app-text/htmltidy )
"
RDEPEND="${DEPEND}
	!kde-misc/konq-plugins[-kdeprefix]
	$(add_kdebase_dep kcmshell)
	$(add_kdebase_dep konqueror)
"

src_configure() {
	mycmakeargs=(
		-DKdeWebKit=OFF
		-DWebKitPart=OFF
		$(cmake-utils_use_with tidy LibTidy)
	)

	kde4-base_src_configure
}
