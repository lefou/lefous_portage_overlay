# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# This ebuild generated by g-cpan 0.14.0_rc3

inherit perl-module

S=${WORKDIR}/SVN-RaWeb-Light-0.6.0

DESCRIPTION="No description available"
HOMEPAGE="http://search.cpan.org/search?query=${PN}"
SRC_URI="mirror://cpan/authors/id/S/SH/SHLOMIF/SVN-RaWeb-Light-0.6.0.tar.gz"


IUSE=""

SLOT="0"
LICENSE="|| ( Artistic GPL-2 )"
KEYWORDS="~x86"

DEPEND="
	>=virtual/perl-Test-Simple-0.62
	>=dev-perl/IO-stringy-2.110
	>=dev-perl/Class-Accessor-0.25
	>=virtual/perl-CGI-3.20
"
RDEPEND="${DEPEND}"
