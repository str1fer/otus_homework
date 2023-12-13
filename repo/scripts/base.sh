     sudo mkdir -p ~root/.ssh;
     sudo cp ~vagrant/.ssh/auth* ~root/.ssh
     sudo setenforce 0
     sudo systemctl stop firewalld.service
#    sudo systemctl disable firewalld.service
     sudo yum -y install python3
     sudo yum -y install vim
     sudo usermod -aG wheel vagrant
     sudo systemctl enable firewalld --now 
     sudo timedatectl set-timezone Europe/Moscow
     sudo systemctl restart sshd  
     sudo yum -y install redhat-lsb-core
     sudo yum -y install wget
     sudo yum -y install rpmdevtools
     sudo yum -y install rpm-build
     sudo yum -y install createrepo
     sudo yum -y install yum-utils
     sudo yum -y install gcc
