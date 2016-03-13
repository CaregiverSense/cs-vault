Vagrant.configure("2") do |config|

	config.vm.box = "ubuntu/trusty64"
	config.ssh.shell = "bash -c 'BASH_ENV=/etc/profile exec bash'"

	config.vm.provider "virtualbox" do |vb|
		["setextradata", :id, "VBoxInternal2/SharedFoldersEnableSymlinksCreate/vagrant", "1"]
	end

	# update packages, install jsawk and resty
	config.vm.provision "shell", inline: <<-END
		apt-get update
		curl -L http://github.com/micha/resty/raw/master/resty > /usr/local/bin/resty
		curl -L http://github.com/micha/jsawk/raw/master/jsawk > /usr/local/bin/jsawk
		echo ". resty" >> /etc/profile.d/startup.sh
		chmod 755 /etc/profile.d/startup.sh /usr/local/bin/*
	END

	config.vm.provision "docker" do |docker|
		docker.pull_images "debian"
	end

end
