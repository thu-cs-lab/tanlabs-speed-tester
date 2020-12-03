#
# This file is the serial-config recipe.
#

SUMMARY = "Simple serial-config application"
SECTION = "PETALINUX/apps"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
RDEPENDS_${PN} = "bash"

SRC_URI = "file://src/ \
       file://prog_artix.sh \
	   file://Makefile \
		  "

S = "${WORKDIR}"

do_compile() {
	     oe_runmake
}

do_install() {
	     install -d ${D}${bindir}
	     install -m 0755 serial-config ${D}${bindir}
		 install -m 0755 prog_artix.sh ${D}${bindir}
}
