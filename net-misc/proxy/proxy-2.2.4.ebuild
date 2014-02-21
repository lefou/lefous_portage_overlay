# Copyright 1999-2006 Gentoo Technologies, Inc.
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Proxy - Simple port redirector (nice for port forwarding without iptables)"
HOMEPAGE="http://proxy.sourceforge.net/"
SRC_URI="mirror://sourceforge/proxy/${P}.tar.gz http://lepetitfou.dyndns.org/download/distfiles/${P}.tar.gz"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="x86 amd64 ~ppc"
IUSE=""
DEPEND="virtual/glibc"
RDEPEND="virtual/glibc"

src_compile() {
	mv Makefile Makefile.orig
	cat Makefile.orig | sed "s/-Wall -O6/${CFLAGS}/" >Makefile
	emake || die "compile problem"

}

src_install () {
	dobin proxy
	dodoc INSTALL LICENSE README proxy.filters_example
	dodoc ${FILESDIR}/gentoo_init.d_vncproxy_example
	
}

pkg_postinst() {
	echo
	einfo "NOTE: check"
	einfo "/usr/share/doc/${P}/gentoo_init.d_vncproxy_example"
	einfo "for an example startup-script."
	echo
}
