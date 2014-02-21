# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

inherit kde

S=${WORKDIR}/${PN}

DESCRIPTION="Kim is a kde service menu which allows to resize, convert, rotate, (...) your images."
HOMEPAGE="http://bouveyron.free.fr/kim/"
SRC_URI="http://bouveyron.free.fr/kim/release/${P}.tar.gz"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND=""
RDEPEND="media-gfx/imagemagick"

need-kde 3.3

KDEINSTDIR=${D}/usr

src_compile() { 
	cp COPYING kim_about.txt
}

src_install() { 

	dobin src/bin/kim* 

	dodoc COPYING 

	insinto /usr/share/apps/kim 
	doins kim_about.txt
	
	insinto /usr/share/apps/kim/slideshow/ 
	doins src/slideshow/*

	insinto /usr/share/apps/kim/galery 
	doins src/galery/*

	insinto /usr/share/apps/konqueror/servicemenus/ 
	doins src/kim*.desktop

}
