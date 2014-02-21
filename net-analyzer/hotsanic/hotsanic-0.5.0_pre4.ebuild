# Copyright 1999-2003 Gentoo Technologies, Inc.
# Distributed under the terms of the GNU General Public License v2
# $Header: $

NP="HotSaNIC-${PV}"
RESTRICT="nostrip"
S=${WORKDIR}/HotSaNIC
DESCRIPTION="Hotsanic HTML overview to System and Network Information Center"
HOMEPAGE="http://www.hotsanic.org"
# SRC_URI="http://hotsanic.sourceforge.net/archive/HotSaNIC-0.5/${NP}.tgz"
SRC_URI="http://www.gurkensalat.com/hotsanic/${NP}.tgz"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86" # should probably be marked ~ when you submit it
IUSE=""
DEPEND="
	dev-lang/perl
	>=net-analyzer/rrdtool-1.0.42-r1
	>=net-analyzer/net-snmp-5.0.6-r1
	>=media-gfx/imagemagick-5.5.6-r1
	>=sys-devel/patch-2.5.9
	>=net-www/apache-1.3.27"
RDEPEND="${DEPEND}"


src_install() {

	keepdir /home/httpd/htdocs/hotsanic
	keepdir /var/log/hotsanic

	# hotsanic default settings (WEBDIR variable modified from original source)
	patch < ${FILESDIR}/${PVR}/settings.default.patch || die

	# hotsanic snmp works fine fit ucd-snmp, but requires a small patch for net-snmp
	# patch < ${FILESDIR}/${PVR}/HotSaNIC.pm.patch

	# remove the CVS files
	find ${S} -name CVS         | xargs rm -rf
	find ${S} -name .cvsignore  | xargs rm -f
	find ${S} -name Makefile.am | xargs rm -f

	# remove some mot unnecessary stuff
	rmdir ${S}/var
	rmdir ${S}/log
	rm    ${S}/install-sh
	rm    ${S}/missing
	rm    ${S}/mkinstalldirs

	# Install the remainder
	dodir /opt/hotsanic
	cp -a * ${D}/opt/hotsanic/

	# hotsanic service loader
	exeinto /etc/init.d
	newexe ${FILESDIR}/${PVR}/hotsanic hotsanic || die

	insinto /opt/hotsanic
	doins "${S}/.settings.default"

	# Install the documentation - not sure if that's the right way to go...

	rm -rf ${D}/opt/hotsanic/Documentation
	dodoc Documentation/*
}


pkg_postinst() {
	einfo
	einfo "Before starting hotsanic you need to run"
	einfo
	einfo "ebuild /var/db/pkg/net-analyzer/hotsanic-${PV}/hotsanic-${PV}.ebuild config"
	einfo
	einfo "In case you use use a web browser different than apache or"
	einfo "your root web directory is different than /home/httpd/htdocs"
	einfo "change the setting WEBDIR=\"/home/httpd/htdocs/hotsanic\""
	einfo "in the file /opt/hotsanic/settings"
	einfo
	einfo "Read documentation in /opt/hotsanic/Documentation or just visit"
	einfo "http://www.hotsanic.org/"
	einfo
	einfo "Type 'rc-update add hotsanic default' to load hotsanic at startup."
	einfo
	einfo "In case you get the following error message:"
	einfo " * Could not get dependency info for \"hotsanic\"! "
	einfo
	einfo "Carry out the following command to solve the dependency:"
	einfo "# depscan.sh"
	einfo
	einfo "It might take a couple of minutes (15) before the first web pages"
	einfo "are generated. You might force this by carrying out the comands: "
	einfo "	# cd /opt/hotsanic"
	einfo "	# ./diagrams"
	einfo "	# ./makeindex.pl"
	einfo "	# ./rrdtimer -i"
	einfo
	einfo "Do this as well if you donnot see the graphics the first time"
	einfo
}

pkg_prerm() {
	einfo
	einfo "Stopping service hotsanic"
	/etc/init.d/hotsanic stop
	einfo
}

pkg_postrm() {
	einfo
	einfo "To remove all traces of hotsanic you will need to remove the files"
	einfo "in /opt/hotsanic/, /home/httpd/htdocs/hotsanic and /var/log/hotsanic."
	einfo
}

pkg_config() {
	einfo "Running /opt/hotsanic/setup.pl"
	cd /opt/hotsanic
	/opt/hotsanic/setup.pl
	einfo
	einfo "(1/3) /opt/hotsanic/diagrams"
	/opt/hotsanic/diagrams
	einfo "(2/3) /opt/hotsanic/makeindex.pl"
	/opt/hotsanic/makeindex.pl
	einfo "(3/3) /opt/hotsanic/rrdtimer -i"
	/opt/hotsanic/rrdtimer -i
	einfo
	einfo "Done. "
	einfo
	einfo "Start HotSaNIC by the command:"
	einfo "	# /etc/init.d/hotsanic start"
	einfo
	einfo "Make sure apache is running and then monitor your system at"
	einfo "http://localhost/hotsanic/"
	einfo
	einfo "It might take a couple of minutes (15) before the first web pages"
	einfo "are generated. You might force this by carrying out the comands: "
	einfo "	# cd /opt/hotsanic"
	einfo "	# ./diagrams"
	einfo "	# ./makeindex.pl"
	einfo "	# ./rrdtimer -i"
	einfo
	einfo "Do this as well if you donnot see the graphics the first time"
	einfo
	einfo "If you use the SNMP module pls check the functions"
	einfo "'sub snmp_sysbulk' and 'sub snmp_sysquery' in /opt/hotsanic/HotSaNIC.pm"
	einfo "in case your remote host uses a snmp protocol different than version 2"
	einfo
	einfo "Don't forget to place hotsanic in your default runlevel"
	einfo "Type 'rc-update add hotsanic default' to load hotsanic at startup."
	einfo
	einfo "In case you get the following error message:"
	einfo " * Could not get dependency info for \"hotsanic\"! "
	einfo
	einfo "Carry out the following command to solve the dependency:"
	einfo "# depscan.sh"
	einfo
}

