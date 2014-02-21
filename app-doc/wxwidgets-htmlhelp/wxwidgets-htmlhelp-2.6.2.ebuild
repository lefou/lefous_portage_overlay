# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

DESCRIPTION="The HTML-Help (chm) Manual for wxGTK"
HOMEPAGE="http://www.wxwidgets.com/"
SRC_URI="mirror://sourceforge/wxwindows/wxWidgets-${PV}-HTMLHelp.zip"
LICENSE="wxWinLL-3"
SLOT="2.6"
KEYWORDS="x86"

S="${WORKDIR}/wxWidgets-${PV}"

src_compile() { :; }

src_install() {
    dohtml -a chm docs/htmlhelp/*.chm
}
