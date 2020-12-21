#
# This file is the binaries recipe.
#

SUMMARY = "Simple binaries application"
SECTION = "PETALINUX/apps"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

SRC_URI = "file://bird \
           file://birdcl \
		   file://thinrouter_top.bit \
		   file://fib_shuffled.txt \
           file://html \
	"

S = "${WORKDIR}"

do_install() {
	install -d ${D}/${bindir}
	install -d ${D}/var
	install -m 0755 ${S}/bird ${D}/${bindir}
	install -m 0755 ${S}/birdcl ${D}/${bindir}
    install ${S}/thinrouter_top.bit ${D}/var/
    install ${S}/fib_shuffled.txt ${D}/var/
    mkdir -p ${D}/var/www
    cp -r /home/vivado/project/project-spec/meta-user/recipes-apps/binaries/files/html ${D}/var/www/
}
