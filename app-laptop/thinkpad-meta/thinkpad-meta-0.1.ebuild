# Thinkpad meta package

inherit eutils
DESCRIPTION="Meta-ebuild to merge all nessesarry ebuild for a IBM ThinkPad Laptop"
HOMEPAGE="http://lepetitfou.dyndns.org/"
# SRC_URI=""
LICENSE="GPL-1"
SLOT="0"
KEYWORDS="x86"
IUSE="acpi"

DEPEND="acpi? ( app-laptop/ibm-acpi ) 
	!acpi? ( app-laptop/thinkpad app-laptop/tpctl ) 
        app-laptop/laptop-mode-tools 
	sys-power/hibernate-script"
