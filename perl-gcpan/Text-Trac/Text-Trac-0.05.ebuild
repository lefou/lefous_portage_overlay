# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# This ebuild generated by g-cpan 0.15_rc2

inherit perl-module

S=${WORKDIR}/Text-Trac-0.05

DESCRIPTION="No description available"
HOMEPAGE="http://search.cpan.org/search?query=${PN}"
SRC_URI="mirror://cpan/authors/id/M/MI/MIZZY/Text-Trac-0.05.tar.gz"


IUSE=""

SLOT="0"
LICENSE="|| ( Artistic GPL-2 )"
KEYWORDS="~x86"

DEPEND="dev-perl/Test-Base
	dev-perl/Class-Data-Inheritable
	dev-perl/Class-Accessor
	dev-perl/UNIVERSAL-require
	dev-lang/perl"
