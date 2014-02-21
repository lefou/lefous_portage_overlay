# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header:$

inherit kde

DESCRIPTION="OpenGL image viewer KIPI plugin"
HOMEPAGE="http://www.kde-apps.org/content/show.php/?content=52276"
LICENSE="GPL-2"
SLOT="0"
IUSE=""

MY_PN=${PN//kipi-/kipi_}

SRC_URI="http://www.titlis.org/${MY_PN}-${PV}.tar.gz"
KEYWORDS="~amd64 ~x86"

S=${WORKDIR}/${MY_PN}-${PV//./_}

need-kde 3.5
