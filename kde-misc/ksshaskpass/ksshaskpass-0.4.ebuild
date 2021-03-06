# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

inherit kde cmake-utils

DESCRIPTION="A KDE version of ssh-askpass with KWallet support"
HOMEPAGE="http://hanz.nl/"
LICENSE="GPL-2"
SLOT="0"
IUSE=""

SRC_URI="http://www.kde-apps.org/CONTENT/content-files/50971-${P}.tar.gz"
KEYWORDS="~amd64 ~x86"

need-kde 3.5

DOCS="COPYING ChangeLog INSTALL TODO"
