# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit kde
need-kde 3.2
SLOT="0"
LICENSE="GPL-2"
#KEYWORDS="~amd64 ~x86"
KEYWORDS="amd64 x86"
IUSE=""
RESTRICT="nomirror $RESTRICT"

DESCRIPTION="KDE window decoration engine.."
HOMEPAGE="http://www.kde-look.org/content/show.php?content=29935"
SRC_URI="http://www.kde-look.org/content/files/29935-${P}.tar.bz2"


