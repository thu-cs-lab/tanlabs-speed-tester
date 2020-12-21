#
# This file is the tanlabs-speed-tester-backend recipe.
#

SUMMARY = "Simple tanlabs-speed-tester-backend application"
SECTION = "PETALINUX/apps"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

SRC_URI = "file://Makefile \
	   file://src \
	   file://include \
	   file://scripts \
		  "

S = "${WORKDIR}"

do_compile() {
	     oe_runmake
}

do_install() {
	     install -d ${D}${bindir}
	     install -m 0755 tanlabs-speed-tester-backend ${D}${bindir}
	     install -m 0755 scripts/*.sh ${D}${bindir}
}
