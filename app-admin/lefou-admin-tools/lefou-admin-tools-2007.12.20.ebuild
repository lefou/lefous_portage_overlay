# Copyright 1999-2006 Gentoo Foundation, Inc.
# Distributed under the terms of the GNU General Public License v2
# $Header: $


inherit eutils

DESCRIPTION="A general and gentoo admin meta package compiled by Tobias Roeser"
HOMEPAGE="https://lepetitfou.dyndns.org"
# SRC_URI=""
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND=">=app-misc/colordiff-1.0.6a-r1
	>=app-portage/eix-0.10.2
	>=app-portage/gentoolkit-0.2
	>=app-portage/gentoolkit-lefou-0.6.7
	>=app-portage/portage-utils-0.1.28
	>=app-portage/elogv-0.6.1
	>=dev-util/svk-1.08
	>=app-text/rcs-5.7-r3
	>=dev-util/subversion-1.4.5
	>=app-admin/confcat-0.1
	"
