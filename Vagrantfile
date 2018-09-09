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
  config.vm.network "forwarded_port", guest:80, host:80
 
 config.vm.network "private_network", ip: ip_address
  config.vm.provider "virtualbox" do |vb|
    vb.memory = 2048
    vb.cpus = 2
  end
 
 # Enable Berkshelf support
  config.berkshelf.enabled = true
 #config.berkshelf.berksfile_path = "./Berksfile"
  
 # Set share folder
  config.vm.synced_folder "./" , "/var/www/" + project_name + "/", :mount_options => ["dmode=777", "fmode=666"]

 # Enable and configure chef solo
  config.vm.provision :chef_solo do |chef|
    chef.add_recipe "app::packages"
    chef.add_recipe "php"
    chef.add_recipe "app::vhost"
    chef.add_recipe "memcached"
    chef.add_recipe "app::db"
    chef.json = {
      :app => {
        # Project name
        :name           => project_name,

        # Name of MySQL database that should be created
        :db_name        => "dbname",

        # Server name and alias(es) for Apache vhost
        :server_name    => project_name + ".local",
        :server_aliases =>  [ "www." + project_name + ".local" ],

        # Document root for Apache vhost
        :docroot        => "/var/www/" + project_name + "/public",

        # General packages
        :packages   => %w{ vim git screen curl },
		
		# PHP packages
        #:php_packages   => %w{ php5-mysqlnd php5-curl php5-mcrypt php5-memcached php5-gd }
		
      },
      :mysql => {
        :server_root_password   => database_password,
        :server_repl_password   => database_password,
        :server_debian_password => database_password,
        :bind_address           => ip_address,
        :allow_remote_root      => true
      }
    }
  end
 end
