$setup = <<SCRIPT
    DEBIAN_FRONTEND=noninteractive add-apt-repository -y ppa:chris-lea/node.js
    DEBIAN_FRONTEND=noninteractive apt-get update
SCRIPT

$dependencies = <<SCRIPT
    DEBIAN_FRONTEND=noninteractive apt-get install -y build-essential git htop tmux pv
    DEBIAN_FRONTEND=noninteractive apt-get install -y postgresql libpq-dev
    DEBIAN_FRONTEND=noninteractive apt-get install -y python-dev libjpeg-dev zlib1g-dev
    DEBIAN_FRONTEND=noninteractive apt-get install -y python-virtualenv virtualenvwrapper
    DEBIAN_FRONTEND=noninteractive apt-get install -y nodejs
SCRIPT

Vagrant.configure('2') do |config|

    config.vm.box = 'ubuntu/trusty64'

    config.ssh.forward_agent = true
    # Forward the dev server port
    config.vm.network :forwarded_port, host: 8000, guest: 8000

    config.vm.provision "shell", inline: $setup
    config.vm.provision "shell", inline: $dependencies
end
