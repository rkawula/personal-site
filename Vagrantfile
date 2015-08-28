# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
  config.vm.box = "ubuntu/trusty64"

  config.vm.provider :virtualbox do |vb|
      vb.customize ["modifyvm", :id, "--memory", "2048"]
  end

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine.
  config.vm.network "forwarded_port", guest: 3000, host: 3000


  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #

  # Define a Vagrant Push strategy for pushing to Atlas. Other push strategies
  # such as FTP and Heroku are also available. See the documentation at
  # https://docs.vagrantup.com/v2/push/atlas.html for more information.
  # config.push.define "atlas" do |push|
  #   push.app = "YOUR_ATLAS_USERNAME/YOUR_APPLICATION_NAME"
  # end

  config.vm.provision :chef_solo do |chef|
      chef.cookbooks_path = ["cookbooks", "site-cookbooks"]
      chef.add_recipe "apt"
      chef.add_recipe "nodejs"
      chef.add_recipe "ruby_build"
      chef.add_recipe "libffi-dev"
      chef.add_recipe "rbenv::user"
      chef.add_recipe "rbenv::vagrant"
      chef.add_recipe "vim"
      chef.add_recipe "mysql::server"
      chef.add_recipe "mysql::client"

      chef.json = {
        rbenv: {
	      user_installs: [{
	        user: 'vagrant',
	        rubies: ["2.2.1"],
	        global: "2.2.1",
	        gems: {
	          "2.2.1" => [
	            { name: "bundler" }
	           ]
	        }
	      }]
	    },
        mysql: {
	      server_root_password: ''
	    }
      }
    end
end
