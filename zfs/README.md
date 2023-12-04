### Домашнее задание по установке, настройке ZFS.
## Список комманд по лабе.

#переход в режим супер пользователя.
```console
sudo -i
```

#создание пулов otus* из добавленных дисков
```console
zpool create otus1 mirror /dev/sdb /dev/sdc
zpool create otus2 mirror /dev/sdd /dev/sde
zpool create otus3 mirror /dev/sdf /dev/sdg
zpool create otus4 mirror /dev/sdh /dev/sdi
```
#добавление алгоритмов сжатия, на каждый пулл разный алгоритм
```console
zfs set compression=lzjb otus1
zfs set compression=lz4 otus2
zfs set compression=gzip-9 otus3
zfs set compression=zle otus4
```

#заполнение пулов треш файлами
```bash
for i in {1..4}; do wget -P /otus$i https://gutenberg.org/cache/epub/2600/pg2600.converter.log; done
```
#загрузка архива в домашний каталог
```console
wget -O archive.tar.gz --no-check-certificate 'https://drive.google.com/u/0/uc?id=1KRBNW33QWqbvbVHa3hLJivOAt60yukkg&export=download'
```

#разархивация данного архива
```console
tar -xzvf archive.tar.gz
```

#Импорт пула в нашу ос 
```console
zpool import -d zpoolexport/ otus
```
#загрузка файла указанного в задании
```console
wget -O otus_task2.file --no-check-certificate "https://drive.google.com/u/0/uc?id=1gH8gCL9y7Nd5Ti3IRmplZPF1XjzxeRAG&export=download"
```
#Восстановление файловой системы из снапшота
```console
sudo zfs receive otus/test@today < otus_task2.file
```