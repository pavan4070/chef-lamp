name 'lamp'
maintainer 'The Authors'
maintainer_email 'you@example.com'
license 'All Rights Reserved'
description 'Installs/Configures lamp'
long_description 'Installs/Configures lamp'
version '1.1.1'
chef_version '>= 12.1' if respond_to?(:chef_version)

depends 'apache2', '~> 8.14.2'
depends 'mysql', '~> 11.0.4'
depends 'database', '~> 6.1'
depends 'mysql2_chef_gem', '~> 2.0'
# The `issues_url` points to the location where issues for this cookbook are
# tracked.  A `View Issues` link will be displayed on this cookbook's page when
# uploaded to a Supermarket.
#
# issues_url 'https://github.com/<insert_org_here>/lamp/issues'

# The `source_url` points to the development reposiory for this cookbook.  A
# `View Source` link will be displayed on this cookbook's page when uploaded to
# a Supermarket.
#
# source_url 'https://github.com/<insert_org_here>/lamp'
