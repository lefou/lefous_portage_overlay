# Copyright (c)  2005 by Tobias Roeser
# Distributed under the terms of the GNU General Public License v2

#inherit eutils

DESCRIPTION="_The_ German HTML/XHTML/CSS/XML/DHTML/CGI/Perl/JavaScript Documentation from Stefan Müntz as (Microsoft Compiled Helpfile, CHM)"
HOMEPAGE="http://aktuell.de.selfhtml.org/extras/selfchm.htm"
SRC_URI="http://www.dieterraber.net/selfhtml/${PN}.${PV}.zip http://www.unet.univie.ac.at/~a9105535/${PN}.${PV}.zip http://www.meta-text.net/${PN}.${PV}.zip"
LICENSE="selfhtml"
KEYWORDS="x86"
SLOT="0"
IUSE=""

src_compile() { :; }

src_install() {
    dohtml -a chm ${WORKDIR}/selfhtml-${PV}.chm
}
