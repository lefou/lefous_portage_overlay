# Distributed under the terms of the GNU General Public License v2
# $Header$

inherit kde

DESCRIPTION="kio slave to fulltext search files using CLucene"
SRC_URI="mirror://sourceforge/kio-clucene/${P}.tar.gz"
HOMEPAGE="http://kioclucene.objectis.net/"

LICENSE="GPL-2"
SLOT="0"

# No idea which arches are supported.
# If you test this on an arch besides x86 and it works, please send
# an e-mail to either rohan.pm@gmail.com or xavier.helluy@web.de
KEYWORDS="~x86"

RDEPEND="dev-cpp/clucene"

# According to homepage, KDE 3.4 at least is required
need-kde 3.4

src_compile()
{
	# uses SCons to build, but does not require it; usual ./configure and make
	# work somewhat, but ./configure doesn't use --prefix, so can't use econf.
	./configure || die "configure failed"
	emake || die "emake failed!"
}

pkg_postinst()
{
	einfo "To start using kio-clucene, point Konqueror at 'clucene:/' ."
	einfo "You can also use the 'cl:<some query>' shortcut after setting up"
	einfo "some indices.\n"
	
	einfo "If you are currently logged in to KDE, please log out and log back"
	einfo "in again before attempting to use kio-clucene."
}
