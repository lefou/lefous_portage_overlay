# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/www-apps/redmine/redmine-1.0.3.ebuild,v 1.1 2010/11/04 04:40:36 matsuu Exp $

EAPI="2"
USE_RUBY="ruby18"
inherit eutils confutils depend.apache ruby-ng

DESCRIPTION="Redmine is a flexible project management web application written using Ruby on Rails framework. Placeholder-ebuild to have redmine-dependencies portage-managed."
HOMEPAGE="http://www.redmine.org/"
SRC_URI=""

KEYWORDS="~amd64 ~x86"
LICENSE="GPL-2"
SLOT="0"
IUSE="cvs darcs fastcgi git imagemagick mercurial mysql openid passenger postgres sqlite3 subversion"

ruby_add_rdepend "~dev-ruby/rails-2.3.5:2.3
	>=dev-ruby/coderay-0.7.6.227
	>=dev-ruby/rubygems-1.3.5
	>=dev-ruby/ruby-net-ldap-0.0.4"
ruby_add_rdepend "dev-ruby/activerecord:2.3[mysql?,postgres?,sqlite3?]"
ruby_add_rdepend fastcgi dev-ruby/ruby-fcgi
ruby_add_rdepend imagemagick dev-ruby/rmagick
ruby_add_rdepend openid dev-ruby/ruby-openid
ruby_add_rdepend passenger "=dev-ruby/rack-1.0.1* www-apache/passenger"

RDEPEND="${RDEPEND}
	passenger? ( =dev-ruby/rack-1.0.1* www-apache/passenger )
	dev-ruby/activerecord:2.3[mysql?,postgres?,sqlite3?]
	cvs? ( >=dev-vcs/cvs-1.12 )
	darcs? ( dev-vcs/darcs )
	git? ( dev-vcs/git )
	mercurial? ( dev-vcs/mercurial )
	subversion? ( >=dev-vcs/subversion-1.3 )"
