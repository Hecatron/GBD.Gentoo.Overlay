# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-util/premake/premake-4.3-r1.ebuild,v 1.5 2013/05/26 07:25:11 ago Exp $

EAPI=5

inherit versionator eutils

PREMAKEVER="premake-5.0-alpha1"

DESCRIPTION="A makefile generation tool"
HOMEPAGE="http://industriousone.com/premake"
SRC_URI="mirror://sourceforge/premake/${PREMAKEVER}-src.zip"

LICENSE="BSD"
SLOT=$(get_major_version)
KEYWORDS="~amd64 ~ppc ~x86 ~arm"
IUSE=""

DEPEND="app-arch/unzip"
RDEPEND=""

S="${WORKDIR}/${PREMAKEVER}"

src_prepare() {
    epatch "${FILESDIR}/http/1.patch"
	epatch "${FILESDIR}/http/2.patch"
	epatch "${FILESDIR}/http/3.patch"
	epatch "${FILESDIR}/http/4.patch"
	epatch "${FILESDIR}/http/5.patch"
	epatch "${FILESDIR}/http/6.patch"
	epatch "${FILESDIR}/http/7.patch"
	epatch "${FILESDIR}/http/8.patch"
}

src_compile() {
	emake -C build/gmake.unix/
}

src_install() {
	dobin bin/release/premake5
}
