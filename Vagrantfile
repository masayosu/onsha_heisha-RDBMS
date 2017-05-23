# -*- mode: ruby -*-
# vi: set ft=ruby :

PERL_VERSION="5.24.1"
Vagrant.configure("2") do |config|
  config.vm.box = "boxcutter/centos73"
  config.vm.provision "shell", privileged: false, inline: <<-SHELL
    sudo yum install -y gcc git vim
    if [ ! -e ~/.plenv ]; then
        git clone https://github.com/tokuhirom/plenv.git ~/.plenv
        echo 'export PATH="$HOME/.plenv/bin:$PATH"' >> ~/.bashrc
        echo 'eval "$(plenv init -)"' >> ~/.bashrc
        source ~/.bashrc
        git clone https://github.com/tokuhirom/Perl-Build.git ~/.plenv/plugins/perl-build/
        plenv install #{PERL_VERSION}
        plenv global #{PERL_VERSION}
    fi
 SHELL
end
