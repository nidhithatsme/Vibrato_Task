# -*- mode: ruby -*-
# vi: set ft=ruby :

# General project settings
#################################

# IP Address for the host only network
ip_address = "172.11.11.11"

# The project name is base for directories, hostname and alike
project_name = "myapp"

# MySQL and PostgreSQL password - feel free to change it to something
# more secure (Note: Changing this will require you to update the index.php example file)
database_password = "root"

# Vagrant configuration
#################################

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
 # Define VM box to use
  config.vm.box = "ubuntu/trusty64"
  config.vm.network "forwarded_port", guest:80, host:4567
 
 config.vm.network "private_network", ip: "11.11.11.1"
  config.vm.provider "virtualbox" do |vb|
    vb.memory = 2048
    vb.cpus = 2
  end
  
 # Set share folder
  config.vm.synced_folder "./" , "/var/www/" + project_name + "/", :mount_options => ["dmode=777", "fmode=666"]

 # Enable and configure chef solo
 config.vm.provision :chef_solo do |chef|
  chef.cookbooks_path = "cookbooks"
  chef.add_recipe "apt"
  chef.add_recipe "apache2"
#  chef.add_recipe "php"
#  chef.add_recipe "php::module_mysql"
#  chef.add_recipe "apache2::mod_php5"
#  chef.add_recipe "mysql::server"

  chef.json = {
   "apache" => {
     "default_site_enabled" => true
    }
#    "mysql" => {
#    "server_debian_password" => "root",
#     "server_root_password" => "root",
#     "server_repl_password" => "root"
#    }
   }
  end
 end
