# Get WordPress
tarball=latest.tar.gz
wp=http://wordpress.org/$tarball

wget $wp
extract $tarball
mv wordpress/* ./
rmdir ./wordpress/
rm -f $tarball