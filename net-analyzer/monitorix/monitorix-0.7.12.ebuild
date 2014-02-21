# Copyright (c) 2006 by Tobias Roeser
# Distributed under the terms of the GNU General Public License v2

DESCRIPTION="Monitorix is a free, open source system monitoring tool designed to monitorize as many services as it can"
HOMEPAGE="http://www.monitorix.org/"
SRC_URI="http://www.monitorix.org/${P}.tar.gz http://www.monitorix.org/old_versions/${P}.tar.gz"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND="
	>=dev-lang/perl-5.8
	>=net-analyzer/rrdtool-1.0.50
	net-mail/metamail
	>=www-servers/apache-2.0.50"

RDEPEND="${DEPEND}"

WEB_DIR=/var/www/localhost/monitorix

src_compile() { :; }

src_install() {

	einfo "Installing Monitorix"

	# init script
	exeinto /etc/init.d
	newexe ${FILESDIR}/monitorix.init monitorix

	# configuration
	insinto /etc/monitorix
	doins monitorix.conf

	# main perl script
	exeinto /usr/sbin
	doexe monitorix.pl
	dosed "s:/cgi-bin:/monitorix/cgi-bin:g" /usr/sbin/monitorix.pl

	# web dir
	keepdir ${WEB_DIR}
	fowners apache:apache ${WEB_DIR}
	keepdir ${WEB_DIR}/imgs
	fowners apache:apache ${WEB_DIR}/imgs
	insinto ${WEB_DIR}
	doins logo_top.jpg logo_bot.jpg envelope.png
	fowners apache:apache ${WEB_DIR}/logo_top.jpg ${WEB_DIR}/logo_bot.jpg ${WEB_DIR}/envelope.png

 	# cgi dir
	exeinto ${WEB_DIR}/cgi-bin
	fowners apache:apache ${WEB_DIR}/cgi-bin
	doexe monitorix.cgi
	dosed "s:/cgi-bin:/monitorix/cgi-bin:g" ${WEB_DIR}/cgi-bin/monitorix.cgi
	fowners apache:apache ${WEB_DIR}/cgi-bin/monitorix.cgi

	exeinto ${WEB_DIR}/cgi-bin/monitorix
	fowners apache:apache ${WEB_DIR}/cgi-bin/monitorix
	doexe localhost.cgi
	dosed "s:/cgi-bin:/monitorix/cgi-bin:g" ${WEB_DIR}/cgi-bin/monitorix/localhost.cgi
	fowners apache:apache ${WEB_DIR}/cgi-bin/monitorix/localhost.cgi

	exeinto /var/lib/monitorix/reports/ca
	doexe reports/ca/traffic_report.sh
	insinto /var/lib/monitorix/reports/ca
	doins reports/ca/traffic_report.html 
	insinto /var/lib/monitorix/reports/ca/imgs_email
	doins reports/ca/imgs_email/blank.png reports/ca/imgs_email/logo.jpg reports/ca/imgs_email/signature.png reports/ca/imgs_email/title.jpg

	exeinto /var/lib/monitorix/reports/en
	doexe reports/en/traffic_report.sh
	insinto /var/lib/monitorix/reports/en
	doins reports/en/traffic_report.html
	insinto /var/lib/monitorix/reports/en/imgs_email
	doins reports/en/imgs_email/blank.png reports/en/imgs_email/logo.jpg reports/en/imgs_email/signature.png reports/en/imgs_email/title.jpg
	
	dodir /var/lib/monitorix/usage		

	# cron-job (hidden if service stopped)
	einfo "Installing cron job"
	insinto /etc/cron.d
	newins monitorix.sh .monitorix

	# Apache2 config
	einfo "Installing Apache2 config"
	insinto /etc/apache2/modules.d
	doins ${FILESDIR}/63_monitorix.conf

	dodoc COPYING Changelog Configuration.help README monitorix-apache.conf
}

pkg_postinst() {
	einfo
	einfo "Before you can use monitorix, you have to edit"
	einfo 
	einfo "    /etc/monitorix/monitorix.conf"
	einfo
	einfo "You can start the service with"
	einfo
	einfo "    /etc/init.d/monitorix start"
	einfo
	einfo "More Informations how to configure Monitorix will be found at"
	einfo
	einfo "    /usr/share/doc/${P}/Confuguration.help.gz"
	einfo
}

