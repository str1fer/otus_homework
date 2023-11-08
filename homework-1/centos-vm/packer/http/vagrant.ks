# Подтверждаем лицензионное соглашение
eula --agreed

# Указываем язык нашей ОС
lang en_US.UTF-8
# Раскладка клавиатуры
keyboard us
# Указываем часовой пояс
timezone UTC+3

# Включаем сетевой интерфейс и получаем ip-адрес по DHCP
network --bootproto=dhcp --device=link --activate
# Задаём hostname otus-c8
network --hostname=otus-c8

# Указываем пароль root пользователя
rootpw vagrant
authconfig --enableshadow --passalgo=sha512
# Создаём пользователя vagrant, добавляем его в группу Wheel
user --groups=wheel --name=vagrant --password=vagrant --gecos="vagrant"

# Включаем SELinux в режиме enforcing
selinux --enforcing
# Выключаем штатный межсетевой экран
firewall --disabled

firstboot --disable

# Указываем набор пакетов
%packages --default
@^minimal
@core
chrony
sudo
%end

# Выбираем установку в режиме командной строки
text
# Указываем адрес, с которого установщик возьмёт недостающие компоненты
url --url="http://mirror.centos.org/centos/8-stream/BaseOS/x86_64/os/"

# System bootloader configuration
bootloader --location=mbr --append="ipv6.disable=1 crashkernel=auto"

skipx
logging --level=info
zerombr
clearpart --all --initlabel
# Автоматически размечаем диск, создаём LVM
autopart --type=lvm
# Перезагрузка после установки
reboot
