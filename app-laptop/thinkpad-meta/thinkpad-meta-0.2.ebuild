# Copyright 2005 Tobias Roeser
# Distributed under the terms of the GNU General Public License v2
# see at https://lepetitfou.dyndns.org/wiki/bin/view/Werkstatt/KThinkBat

# This is a Thinkpad meta package

inherit eutils

DESCRIPTION="Meta-ebuild to merge all nessesarry ebuild for a IBM ThinkPad Laptop"
HOMEPAGE="https://lepetitfou.dyndns.org"
# SRC_URI=""
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="x86"
IUSE="acpi kde tpsmapi hdaps"

DEPEND="acpi? ( app-laptop/ibm-acpi ) \
	!acpi? ( app-laptop/thinkpad app-laptop/tpctl ) \
        app-laptop/laptop-mode-tools \
	sys-power/hibernate-script \
	tpsmapi? ( >=app-laptop/tp_smapi-0.16 ) \
	kde? ( >=app-laptop/kthinkbat-0.1.5_beta2 ) \
	hdaps? ( app-laptop/hdapsd kde? ( >=app-laptop/khdapsmon-0.1 ) ) \
	"
