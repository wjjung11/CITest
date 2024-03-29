# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "devstack-neutron"

  # The url from where the 'config.vm.box' box will be fetched if it
  # doesn't already exist on the user's system.
  # config.vm.box_url = "http://domain.com/path/to/above.box"
  # config.vm.box_url = "http://files.vagrantup.com/precise64.box"
  config.vm.box_url = "http://172.21.18.11/files/precise64.box"

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # config.vm.network :forwarded_port, guest: 80, host: 8080

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  #config.vm.network :private_network, ip: "10.33.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # eth0�� ������. (Vagrant ���� ����)
  config.vm.network :public_network, ip: "192.168.0.4" #eth1
  #���: 192.168.2.X
  #���: 192.168.4.X
  #���: 192.168.6.X
  #���: 192.168.8.X
  #��  : 192.168.12.X
  #���: 192.168.14.X
  #���: 192.168.16.X
  #���: 192.168.18.X
  #���: 192.168.20.X

  config.vm.network :public_network, ip: "0.0.0.0" #eth2
  config.vm.hostname = "devstack-neutron"

  # If true, then any SSH connections made will enable agent forwarding.
  # Default value: false
  # config.ssh.forward_agent = true

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  config.vm.provider :virtualbox do |vb|
    # Don't boot with headless mode
    vb.gui = false
    # Use VBoxManage to customize the VM. For example to change memory:
    vb.customize ["modifyvm", :id, "--cpus", "4"]
    vb.customize ["modifyvm", :id, "--memory", "4096"]
    #vb.customize ["modifyvm", :id, "--memory", "2048"]
    vb.customize ["modifyvm", :id, "--nicpromisc3", "allow-all"]
  end
  #
  # View the documentation for the provider you're using for more
  # information on available options.

  # Enable provisioning with Puppet stand alone.  Puppet manifests
  # are contained in a directory path relative to this Vagrantfile.
  # You will need to create the manifests directory and a manifest in
  # the file ubuntu12.04_64.pp in the manifests_path directory.
  #
  # An example Puppet manifest to provison the message of the day:
  #
  # # group { "puppet":
  # #   ensure => "present",
  # # }
  # #
  # # File { owner => 0, group => 0, mode => 0644 }
  # #
  # # file { '/etc/motd':
  # #   content => "Welcome to your Vagrant-built virtual machine!
  # #               Managed by Puppet.\n"
  # # }
  #
  #config.vm.provision :puppet do |puppet|
  #  puppet.manifests_path = "manifests"
  #  puppet.manifest_file  = "default.pp"
  #end

  config.vm.provision :puppet do |puppet|
    puppet.options        = "--verbose --debug"
    puppet.facter = {
      "key" => "value",
      "devstack_branch" => "stable/havana",
      "localrc_admin_password" => "1234",
      "localrc_mysql_password" => "1234",
      "localrc_rabbit_password" => "1234",
      "localrc_service_password" => "1234",
      "localrc_service_token" => "1234",
      "localrc_nova_branch" => "stable/havana",
      "localrc_cinder_branch" => "stable/havana",
      "localrc_glance_branch" => "stable/havana",
      "localrc_horizon_branch" => "stable/havana",
      "localrc_keystone_branch" => "stable/havana",
      "localrc_neutron_branch" => "stable/havana",
      "localrc_swift_branch" => "stable/havana",
      "localrc_tempest_branch" => "stable/havana",
      "localrc_host_ip_iface" => "eth1",
      "localrc_public_interface" => "eth2",
      "localrc_public_network_gateway" => "192.168.1.4",
	#���: 192.168.3.X
	#���: 192.168.5.X
	#���: 192.168.7.X
	#���: 192.168.9.X
	#��  : 192.168.13.X
	#���: 192.168.15.X
	#���: 192.168.17.X
	#���: 192.168.19.X
	#���: 192.168.21.X

      "localrc_floating_range" => "192.168.1.0/24",
	#���: 192.168.3.0/24
	#���: 192.168.5.0/24
	#���: 192.168.7.0/24
	#���: 192.168.9.0/24
	#��  : 192.168.13.0/24
	#���: 192.168.15.0/24
	#���: 192.168.17.0/24
	#���: 192.168.19.0/24
	#���: 192.168.21.0/24

      "localrc_q_floating_allocation_pool" => "start=192.168.1.101,end=192.168.1.200",
	#���: "start=192.168.3.101,end=192.168.3.200",
	#���: "start=192.168.5.101,end=192.168.5.200",
	#���: "start=192.168.7.101,end=192.168.7.200",
	#���: "start=192.168.9.101,end=192.168.9.200",
	#��  : "start=192.168.13.101,end=192.168.13.200",
	#���: "start=192.168.15.101,end=192.168.15.200",
	#���: "start=192.168.17.101,end=192.168.17.200",
	#���: "start=192.168.19.101,end=192.168.19.200",
	#���: "start=192.168.21.101,end=192.168.21.200",

      "localrc_network_gateway" => "10.0.0.1",
      "localrc_fixed_range" => "10.0.0.0/24",
      "localrc_flat_interface" => "eth2",
      "localrc_neutron_service" => "true",
      "localrc_heat_service" => "true",
      "localrc_swift_hash" => "66a3d6b56c1f479c8b4e70ab5c2000f5",
      "localrc_api_rate_limit" => "False",
    }
  end

  # Enable provisioning with chef solo, specifying a cookbooks path, roles
  # path, and data_bags path (all relative to this Vagrantfile), and adding
  # some recipes and/or roles.
  #
  # config.vm.provision :chef_solo do |chef|
  #   chef.cookbooks_path = "../my-recipes/cookbooks"
  #   chef.roles_path = "../my-recipes/roles"
  #   chef.data_bags_path = "../my-recipes/data_bags"
  #   chef.add_recipe "mysql"
  #   chef.add_role "web"
  #
  #   # You may also specify custom JSON attributes:
  #   chef.json = { :mysql_password => "foo" }
  # end

  # Enable provisioning with chef server, specifying the chef server URL,
  # and the path to the validation key (relative to this Vagrantfile).
  #
  # The Opscode Platform uses HTTPS. Substitute your organization for
  # ORGNAME in the URL and validation key.
  #
  # If you have your own Chef Server, use the appropriate URL, which may be
  # HTTP instead of HTTPS depending on your configuration. Also change the
  # validation key to validation.pem.
  #
  # config.vm.provision :chef_client do |chef|
  #   chef.chef_server_url = "https://api.opscode.com/organizations/ORGNAME"
  #   chef.validation_key_path = "ORGNAME-validator.pem"
  # end
  #
  # If you're using the Opscode platform, your validator client is
  # ORGNAME-validator, replacing ORGNAME with your organization name.
  #
  # If you have your own Chef Server, the default validation client name is
  # chef-validator, unless you changed the configuration.
  #
  #   chef.validation_client_name = "ORGNAME-validator"
end
