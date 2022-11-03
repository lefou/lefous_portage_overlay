# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=6
inherit eutils
# A well-used example of an eclass function that needs eutils is epatch. If
# your source needs patches applied, it's suggested to put your patch in the
# 'files' directory and use:
#
#   epatch "${FILESDIR}"/patch-name-here
#
# eclasses tend to list descriptions of how to use their functions properly.
# take a look at /usr/portage/eclass/ for more examples.

# Short one-line description of this package.
DESCRIPTION="The LPR and cupswrapper driver for the Brother MFC-9450CDN"
HOMEPAGE="http://welcome.solutions.brother.com/BSC/public/eu/de/de/model_top/colorlasermfc/mfc9450cdn_all.html?reg=eu&c=de&lang=de&prod=mfc9450cdn_all"
SRC_URI="http://www.brother.com/pub/bsc/linux/dlf/BR9450_2_GPL.ppd.gz"
LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

#DEPEND=""
RDEPEND="${DEPEND}"

# Source directory; the dir where the sources can be found (automatically
# unpacked) inside ${WORKDIR}.  The default value for S is ${WORKDIR}/${P}
# If you don't need to change it, leave the S= line out of the ebuild
# to keep it tidy.
#S=${WORKDIR}/${P}

S=${WORKDIR}

src_unpack() {
        unpack BR9450_2_GPL.ppd.gz
}

src_install() {
        insinto /usr/share/Brother-MFC-9459CDN
        doins BR9450_2_GPL.ppd
}
