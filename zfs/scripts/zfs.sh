sudo zpool create otus1 mirror /dev/sdb /dev/sdc
sudo zpool create otus2 mirror /dev/sdd /dev/sde
sudo zpool create otus3 mirror /dev/sdf /dev/sdg
sudo zpool create otus4 mirror /dev/sdh /dev/sdi
sudo zfs set compression=lzjb otus1
sudo zfs set compression=lz4 otus2
sudo zfs set compression=gzip-9 otus3
sudo zfs set compression=zle otus4
for i in {1..4}; do sudo wget -P /otus$i https://gutenberg.org/cache/epub/2600/pg2600.converter.log; done
sudo wget -O archive.tar.gz --no-check-certificate 'https://drive.google.com/u/0/uc?id=1KRBNW33QWqbvbVHa3hLJivOAt60yukkg&export=download'
sudo tar -xzvf archive.tar.gz
sudo zpool import -d zpoolexport/
sudo zpool import -d zpoolexport/ otus
sudo wget -O otus_task2.file --no-check-certificate "https://drive.google.com/u/0/uc?id=1gH8gCL9y7Nd5Ti3IRmplZPF1XjzxeRAG&export=download"
sudo zfs receive otus/test@today < otus_task2.file
#find /otus/test -name "secret_message" /otus/test/task1/file_mess/secret_message
