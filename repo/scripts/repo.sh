sudo -i
sudo wget -P /root https://nginx.org/packages/centos/8/SRPMS/nginx-1.20.2-1.el8.ngx.src.rpm
sudo rpm -i /root/nginx-1.20.2-1.el8.ngx.src.rpm
sudo wget -P /root https://github.com/openssl/openssl/archive/refs/heads/OpenSSL_1_1_1-stable.zip
sudo unzip /root/OpenSSL_1_1_1-stable.zip -d /root
sudo yum-builddep -y /root/rpmbuild/SPECS/nginx.spec
sudo rpmbuild -bb /root/rpmbuild/SPECS/nginx.spec
sudo yum localinstall -y /root/rpmbuild/RPMS/x86_64/nginx-1.20.2-1.el8.ngx.x86_64.rpm
sudo systemctl start nginx
sudo systemctl status nginx
sudo mkdir /usr/share/nginx/html/repo
sudo cp /root/rpmbuild/RPMS/x86_64/nginx-1.20.2-1.el8.ngx.x86_64.rpm /usr/share/nginx/html/repo
sudo wget -p /root https://downloads.percona.com/downloads/percona-distribution-mysql-ps/percona-distribution-mysql-ps-8.0.28/binary/redhat/8/x86_64/percona-orchestrator-3.2.6-2.el8.x86_64.rpm -O /usr/share/nginx/html/repo/percona-orchestrator-3.2.6-2.el8.x86_64.rpm
sudo createrepo /usr/share/nginx/html/repo/