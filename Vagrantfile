# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

	BOX_IMAGE = "ubuntu/jammy64"
	
	BASE_NETWORK = "10.10.20"

	PROXY_ENABLE = true && Vagrant.has_plugin?("vagrant-proxyconf")
	PROXY_HTTP = "http://10.0.2.2:5865"
	PROXY_HTTPS = "http://10.0.2.2:5865"
	PROXY_EXCLUDE = "localhost,127.0.0.1"
	
	SSH_INSERT_KEY = true
	PROVISION_UPDATE_FILE = "./scripts/provision_update.sh"
	PROVISION_APACHE_FILE = "./scripts/provision_apache.sh"
	PROVISION_PHP_FILE = "./scripts/provision_php.sh"
	PROVISION_MYSQL_FILE = "./scripts/provision_mysql.sh"
	PROVISION_CONFDB_FILE = "./scripts/provision_confdb.sh"
	PROVISION_PHP_FILE
	
	SHARED_FOLDER = "./www/"

	config.vm.define "web" do |subconfig|
		subconfig.vm.box = BOX_IMAGE
		subconfig.vm.hostname = "mmweb.cpt.local"
		
		subconfig.vm.network "private_network", ip: "#{BASE_NETWORK}.10",virtualbox__intnet: true
		subconfig.vm.network "forwarded_port", guest: 80, host: 9080
		
		subconfig.vm.provider "virtualbox" do |vb|
			vb.name = "MMWeb"
			vb.memory = "1024"
			vb.cpus = 1
		end
		
		if PROXY_ENABLE == true
			subconfig.proxy.http = PROXY_HTTP
			subconfig.proxy.https = PROXY_HTTPS
			subconfig.proxy.no_proxy = PROXY_EXCLUDE
		end
		
		subconfig.ssh.insert_key = SSH_INSERT_KEY
		subconfig.vm.provision "shell", path: PROVISION_UPDATE_FILE
		subconfig.vm.provision "shell", path: PROVISION_APACHE_FILE
		subconfig.vm.provision "shell", path: PROVISION_PHP_FILE
		subconfig.vm.synced_folder SHARED_FOLDER, "/var/www/html/"

	end
	
	config.vm.define "db" do |subconfig|
		subconfig.vm.box = BOX_IMAGE
		subconfig.vm.hostname = "mmdb.cpt.local"
		
		subconfig.vm.network "private_network", ip: "#{BASE_NETWORK}.15",virtualbox__intnet: true
		
		subconfig.vm.provider "virtualbox" do |vb|
			vb.name = "MMDb"
			vb.memory = "1024"
			vb.cpus = 1
		end
		
		if PROXY_ENABLE == true 
			subconfig.proxy.http = PROXY_HTTP
			subconfig.proxy.https = PROXY_HTTPS
			subconfig.proxy.no_proxy = PROXY_EXCLUDE
		end
		
		subconfig.ssh.insert_key = SSH_INSERT_KEY
		subconfig.vm.provision "shell", path: PROVISION_UPDATE_FILE
		subconfig.vm.provision "shell", path: PROVISION_MYSQL_FILE
		subconfig.vm.provision "shell", path: PROVISION_CONFDB_FILE

		
	end
end