# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit unpacker

# Major version

WXWIDGETS="wxWidgets-3.0.2"

DESCRIPTION="VeraCrypt is a free disk encryption software based on TrueCrypt"
HOMEPAGE="https://veracrypt.codeplex.com"
SRC_URI="https://github.com/veracrypt/VeraCrypt/archive/VeraCrypt_${PV}.tar.gz"

LICENSE="truecrypt-3.0"
SLOT="0"
KEYWORDS="~*"
IUSE=""

RESTRICT="mirror"

#	sys-devel/base-gcc
SHARED_DEPEND="
	>=sys-devel/gcc-4.9.2
	sys-devel/make
	dev-lang/nasm
	dev-ruby/pkg-config
	app-arch/makeself
	sys-fs/fuse
        >=x11-libs/wxGTK-3.0.2:3.0
"
DEPEND="
        ${SHARED_DEPEND}
        app-arch/makeself
"
RDEPEND="${SHARED_DEPEND}"

S=${WORKDIR}
VERADIR=${WORKDIR}/VeraCrypt-VeraCrypt_${PV}

src_compile() {
	cd ${VERADIR}/src
	make || die "Could not make VeraCrypt!"
	return
}

src_install() {
    exeinto /usr/bin
	doexe ${VERADIR}/src/Main/veracrypt || die "Could not create veracrypt executable!"
	insinto /usr/share/pixmaps
	doins "${FILESDIR}"/veracrypt.png || die "Could not copy veracrypt.png"
	return
}

pkg_postinst() {
	xdg-desktop-menu install "${FILESDIR}"/lefou-veracrypt.desktop || die "Could not register a menu item!"
	return
}

pkg_postrm() {
	xdg-desktop-menu uninstall "${FILESDIR}"/lefou-veracrypt.desktop || die "Could not de-register a menu item!"
	return
}

