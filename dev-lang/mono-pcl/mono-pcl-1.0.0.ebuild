# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-util/premake/premake-4.3-r1.ebuild,v 1.5 2013/05/26 07:25:11 ago Exp $

EAPI=5

inherit versionator eutils

DESCRIPTION="PCL Libraries required for Roslyn"
HOMEPAGE="https://github.com/mono/roslyn"
SRC_URI="http://storage.bos.xamarin.com/bot-provisioning/PortableReferenceAssemblies-2014-04-14.zip"

LICENSE="Apache-2.0"
SLOT=$(get_major_version)
KEYWORDS="~amd64 ~ppc ~x86 ~arm"
IUSE=""

DEPEND="app-arch/unzip"
RDEPEND=""

S="${WORKDIR}"

#S="${WORKDIR}/${PREMAKEVER}"

src_unpack() {
    unpack ${A}
	mkdir -p usr/lib/mono/xbuild-frameworks/.NETPortable/v4.5/Profile
	mv PortableReferenceAssemblies-2014-04-14/v4.5/Profile/Profile7 usr/lib/mono/xbuild-frameworks/.NETPortable/v4.5/Profile/
    rm -Rf PortableReferenceAssemblies-2014-04-14
}

src_install() {
    cp -a ${S}/usr ${D}
}

