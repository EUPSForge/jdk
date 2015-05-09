# EupsPkg config file. Sourced by 'eupspkg'

URL="http://download.oracle.com/otn-pub/java/jdk/8u40-b26/jdk-8u40-linux-x64.tar.gz"

TARBALL=$(basename "$URL")

prep()
{
	mkdir -p tarballs
	cd tarballs

	curl -# -j -k -L -H \
		"Cookie: oraclelicense=accept-securebackup-cookie" \
		"$URL" > "$TARBALL"
}

config() { :; }
build() { :; }

install()
{
	clean_old_install

	(
		# Just expand the tarball into the install directory
		PKGDIR="$PWD"

		mkdir -p "$PREFIX"
		cd "$PREFIX"

		tar xzf "$PKGDIR/tarballs/$TARBALL" --strip-components 1
	)

	install_ups
}
