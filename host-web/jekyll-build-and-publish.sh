host=user@host.com        # user@host.com
domain=domain.com         # domain.com
root=$host:$domain        # root website folder
source=~/Websites/$domain # jekyll source
destination=$source/_site # jekyll destination
build=$destination/*      # contents of build folder

# Build the website.
jekyll build --source $source --destination $destination

# Copy the website to your host.
scp -r $build $root