Vagrant.configure("2") do |config|

	config.vm.box = "ubuntu/trusty64"
	config.ssh.shell = "bash -c 'BASH_ENV=/etc/profile exec bash'"

	config.vm.provider "virtualbox" do |vb|
		["setextradata", :id, "VBoxInternal2/SharedFoldersEnableSymlinksCreate/vagrant", "1"]
	end

	config.vm.provision "shell", inline: <<-END
		apt-get update
	END

	config.vm.provision "docker" do |docker|
		docker.pull_images "debian"
	end

end
