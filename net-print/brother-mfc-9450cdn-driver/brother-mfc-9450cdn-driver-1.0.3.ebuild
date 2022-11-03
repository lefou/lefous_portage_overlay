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
SRC_URI="http://www.brother.com/pub/bsc/linux/dlf/mfc9450cdnlpr-1.0.3-1.i386.deb http://www.brother.com/pub/bsc/linux/dlf/mfc9450cdncupswrapper-1.0.3-1.i386.deb http://www.brother.com/pub/bsc/linux/dlf/BR9450_2_GPL.ppd.gz"
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
        mkdir lpr
        mkdir cupswrapper
        (cd lpr && unpack mfc9450cdnlpr-1.0.3-1.i386.deb)
        (cd cupswrapper && unpack mfc9450cdncupswrapper-1.0.3-1.i386.deb)
        unpack ./lpr/data.tar.gz
        unpack ./cupswrapper/data.tar.gz
}

src_install() {
        cp -pPR opt "${D}"/ || die "Installing files failed"
        cp -pPR usr "${D}"/ || die "Installing files failed"
}

pkg_postinst() {
        if [ -e "${ROOT}/usr/lib/cups" ] ; then
		WORKAROUND="NO"
	else
		WORKAROUND="YES"
	fi
	if [ "$WORKAROUND" == "YES" ] ; then
		einfo "Creating symlink for cups"
		ln -s -- "${ROOT}/usr/libexec/cups" "${ROOT}/usr/lib/cups"
	fi
        einfo "Registering LPR Printer DCP-J925DW"
        ${ROOT}/opt/brother/Printers/dcpj925dw/inf/setupPrintcapij dcpj925dw -i
	${ROOT}/opt/brother/Printers/dcpj925dw/cupswrapper/cupswrapperdcpj925dw -i
	if [ "$WORKAROUND" == "YES" ] ; then
		einfo "Removing symlink for cups"
		rm -- "${ROOT}/usr/lib/cups"
	fi
        einfo "For setting the paper type to A4 you can run the following command:"
        einfo "   brprintconf_dcpj925dw -pt A4"
}

pkg_prerm() {
        if [ -e "${ROOT}/usr/lib/cups" ] ; then
		WORKAROUND="NO"
	else
		WORKAROUND="YES"
	fi
	if [ "$WORKAROUND" == "YES" ] ; then
		einfo "Creating symlink for cups"
		ln -s -- "${ROOT}/usr/libexec/cups" "${ROOT}/usr/lib/cups"
	fi
	${ROOT}/opt/brother/Printers/dcpj925dw/cupswrapper/cupswrapperdcpj925dw -e
        ${ROOT}/opt/brother/Printers/dcpj925dw/inf/setupPrintcapij dcpj925dw -e
	if [ "$WORKAROUND" == "YES" ] ; then
		einfo "Removing symlink for cups"
		rm -- "${ROOT}/usr/lib/cups"
	fi
}
