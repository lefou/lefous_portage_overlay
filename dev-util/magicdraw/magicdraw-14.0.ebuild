# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils
DESCRIPTION="MagicDraw Enterprise Edition"

# Homepage, not used by Portage directly but handy for developer reference
HOMEPAGE="http://www.magicdraw.com"

# Point to any required sources; these will be automatically downloaded by
# Portage.
SRC_URI="http://www.magicdraw.eu/files140/MD_UML_140_no_install.zip"

# License of the package.  This must match the name of file(s) in
# /usr/portage/licenses/.  For complex license combination see the developer
# docs on gentoo.org for details.
LICENSE="MagicDraw License"
SLOT="0"
KEYWORDS="~x86"
IUSE=""
RESTRICT="nostrip"

# Build-time dependencies, such as
#    ssl? ( >=dev-libs/openssl-0.9.6b )
#    >=dev-lang/perl-5.6.1-r1
# It is advisable to use the >= syntax show above, to reflect what you
# had installed on your system when you tested the package.  Then
# other users hopefully won't be caught without the right version of
# a dependency.
DEPEND=">=virtual/jre-1.4"

# Run-time dependencies, same as DEPEND if RDEPEND isn't defined:
#RDEPEND=""

# Source directory; the dir where the sources can be found (automatically
# unpacked) inside ${WORKDIR}.  The default value for S is ${WORKDIR}/${P}
# If you don't need to change it, leave the S= line out of the ebuild
# to keep it tidy.
S=${WORKDIR}

INSTALLDIR="/opt/magicdraw"

#src_compile() {
#}

src_install() {
	dodir ${INSTALLDIR}
	cp -R ${S}/* ${D}${INSTALLDIR}
	
	dodoc license.txt 
	dohtml notes.html readme.html

        mkdir script
        cat > script/magicdraw << "EOF"
#!/bin/sh
# Invokes MagicDraw
export MAGICDRAWDIR=THEINSTALLDIR
${MAGICDRAWDIR}/bin/mduml $*
EOF
        sed -i -e "s:THEINSTALLDIR:${INSTALLDIR}:" \
            script/magicdraw

        exeinto /usr/bin
        doexe script/magicdraw

	make_desktop_entry /usr/bin/magicdraw 
}

pkg_postinst() {

	einfo "To start MagicDraw run /usr/bin/magicdraw."
}
