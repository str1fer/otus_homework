Домашнее задание по установке, настройке ZFS.
Список комманд по лабе.
#создание пулов otus* из добавленных дисков
sudo zpool create otus1 mirror /dev/sdb /dev/sdc
sudo zpool create otus2 mirror /dev/sdd /dev/sde
sudo zpool create otus3 mirror /dev/sdf /dev/sdg
sudo zpool create otus4 mirror /dev/sdh /dev/sdi

#добавление алгоритмов сжатия, на каждый пулл разный алгоритм
sudo zfs set compression=lzjb otus1
sudo zfs set compression=lz4 otus2
sudo zfs set compression=gzip-9 otus3
sudo zfs set compression=zle otus4

#заполнение пулов треш файлами
for i in {1..4}; do sudo wget -P /otus$i https://gutenberg.org/cache/epub/2600/pg2600.converter.log; done

#загрузка архива в домашний каталог
sudo wget -O archive.tar.gz --no-check-certificate 'https://drive.google.com/u/0/uc?id=1KRBNW33QWqbvbVHa3hLJivOAt60yukkg&export=download'

#разархивация данного архива
sudo tar -xzvf archive.tar.gz

#Импорт пула в нашу ос 
sudo zpool import -d zpoolexport/ otus

#загрузка файла указанного в задании
sudo wget -O otus_task2.file --no-check-certificate "https://drive.google.com/u/0/uc?id=1gH8gCL9y7Nd5Ti3IRmplZPF1XjzxeRAG&export=download"

#восстановление файловой системы из снапшота
sudo zfs receive otus/test@today < otus_task2.file