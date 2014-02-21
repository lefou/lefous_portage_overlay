# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils
DESCRIPTION="MagicDraw Community Edition"

# Homepage, not used by Portage directly but handy for developer reference
HOMEPAGE="http://www.magicdraw.com"

# Point to any required sources; these will be automatically downloaded by
# Portage.
SRC_URI="http://download.eu.nomagic.com/files95/MD_UML_95_CE_no_install.zip"

# License of the package.  This must match the name of file(s) in
# /usr/portage/licenses/.  For complex license combination see the developer
# docs on gentoo.org for details.
LICENSE="MagicDraw License"

# The SLOT variable is used to tell Portage if it's OK to keep multiple
# versions of the same package installed at the same time.  For example,
# if we have a libfoo-1.2.2 and libfoo-1.3.2 (which is not compatible
# with 1.2.2), it would be optimal to instruct Portage to not remove
# libfoo-1.2.2 if we decide to upgrade to libfoo-1.3.2.  To do this,
# we specify SLOT="1.2" in libfoo-1.2.2 and SLOT="1.3" in libfoo-1.3.2.
# emerge clean understands SLOTs, and will keep the most recent version
# of each SLOT and remove everything else.
# Note that normal applications should use SLOT="0" if possible, since
# there should only be exactly one version installed at a time.
# DO NOT USE SLOT=""! This tells Portage to disable SLOTs for this package.
SLOT="0"

# Using KEYWORDS, we can record masking information *inside* an ebuild
# instead of relying on an external package.mask file.  Right now, you
# should set the KEYWORDS variable for every ebuild so that it contains
# the names of all the architectures with which the ebuild works.  All of
# the official architectures can be found in the keywords.desc file which 
# is in /usr/portage/profiles/.  Usually you should just set this to "~x86".  
# The ~ in front of the architecture indicates that the package is new and 
# should be considered unstable until testing proves its stability.  Once 
# packages go stable the ~ prefix is removed.  So, if you've confirmed that 
# your ebuild works on x86 and ppc, you'd specify: KEYWORDS="~x86 ~ppc"
# For binary packages, use -* and then list the archs the bin package
# exists for.  If the package was for an x86 binary package, then
# KEYWORDS would be set like this: KEYWORDS="-* x86"
# DO NOT USE KEYWORDS="*".  This is deprecated and only for backward
# compatibility reasons.
KEYWORDS="~x86"

IUSE=""

# A space delimited list of portage features to restrict. man 5 ebuild
# for details.  Usually not needed.
#RESTRICT="nostrip"

# Build-time dependencies, such as
#    ssl? ( >=dev-libs/openssl-0.9.6b )
#    >=dev-lang/perl-5.6.1-r1
# It is advisable to use the >= syntax show above, to reflect what you
# had installed on your system when you tested the package.  Then
# other users hopefully won't be caught without the right version of
# a dependency.
DEPEND=""

# Run-time dependencies, same as DEPEND if RDEPEND isn't defined:
#RDEPEND=""

# Source directory; the dir where the sources can be found (automatically
# unpacked) inside ${WORKDIR}.  The default value for S is ${WORKDIR}/${P}
# If you don't need to change it, leave the S= line out of the ebuild
# to keep it tidy.
S=${WORKDIR}

INSTALLDIR="/opt/magicdrawCE"

#src_compile() {
#}

src_install() {
	dodir ${INSTALLDIR}
	cp -R ${S}/* ${D}${INSTALLDIR}
	
	dodoc license.txt 
	dohtml notes.html readme.html

        mkdir script
        cat > script/magicdrawCE << "EOF"
#!/bin/sh
# Invokes MagicDraw
export MAGICDRAWDIR=THEINSTALLDIR
${MAGICDRAWDIR}/bin/mduml $*
EOF
        sed -i -e "s:THEINSTALLDIR:${INSTALLDIR}:" \
            script/magicdrawCE

        exeinto /usr/bin
        doexe script/magicdrawCE
		
}

pkg_postinst() {

	einfo "To start MagicDrawCE run /usr/bin/magicdrawCE."
}