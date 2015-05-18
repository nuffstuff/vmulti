Vagrant.configure("2") do |config|


  config.vm.define "web" do |web|
    web.vm.box = "apache"

    web.vm.box = "ubuntu/trusty64"
    web.vm.hostname = "web.dev"
    web.vm.network "private_network", ip: "192.168.99.101"
    web.vm.network "forwarded_port", guest: 80, host: 8888

    web.vm.provision :puppet do |puppet|
      puppet.manifests_path = "web/manifests"
      puppet.manifest_file = "init.pp"
      puppet.module_path = "web/modules"
    end

 end

  config.vm.define "db" do |db|

    db.vm.box = "ubuntu/trusty64"
    db.vm.network "private_network", ip: "192.168.99.102"
    db.vm.network "forwarded_port", guest: 3306, host: 3306
    db.vm.hostname = "mysql.dev"


    db.vm.provision :puppet do |puppet|
      puppet.manifests_path = "db/manifests"
      puppet.manifest_file = "init.pp"
      puppet.module_path = "db/modules"
    end

  end


  config.vm.define "jenkins" do |jenkins|
    jenkins.vm.box = "jenkins"

    jenkins.vm.box = "ubuntu/trusty64"
    jenkins.vm.network "private_network", ip: "192.168.99.103"
    jenkins.vm.hostname = "jenkins.dev"


    jenkins.vm.provision :puppet do |puppet|
      puppet.manifests_path = "jenkins/manifests"
      puppet.manifest_file = "init.pp"
      puppet.module_path = "jenkins/modules"
    end

  end

end
