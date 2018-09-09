name              "app"
maintainer        "Nidhi Garg"
maintainer_email  "nidhigarg@outlook.com"
description       "Main entry point"
version           "1.0.0"

recipe "app", "Main entry point"

depends "apache2"
depends "dotdeb"
depends "php"
depends "apt"
depends "openssl"
depends 'mysql', '~> 8.5.1'
depends "database"
depends "mysql2_chef_gem"

%w{ debian ubuntu }.each do |os|
  supports os
end
