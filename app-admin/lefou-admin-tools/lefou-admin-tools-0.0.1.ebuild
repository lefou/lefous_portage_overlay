# Copyright 1999-2006 Gentoo Foundation, Inc.
# Distributed under the terms of the GNU General Public License v2
# $Header: $


inherit eutils

DESCRIPTION="A general and gentoo admin meta package compiled by Tobias Roeser"
HOMEPAGE="https://lepetitfou.dyndns.org"
# SRC_URI=""
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="x86"
IUSE=""

DEPEND="app-admin/ebackup
	app-misc/colordiff
	>=app-portage/eix-0.5
	app-portage/genlop
	>=app-portage/gentoolkit-0.2
	>=app-portage/gentoolkit-lefou-0.6.3
	>=app-portage/yacleaner-0.5_beta1
	>=app-portage/portlog-info-0.3.1
	app-text/rcs
	>=dev-util/subversion-1.3
	"
