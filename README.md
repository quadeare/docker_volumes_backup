# Docker volumes backup

This script allows you to backup all volumes from a container in a tar.gz file

## Backup a container

```sh
$ ./backup-docker.sh [Your container]
```

### Example

```sh
$ ./backup-docker.sh mysql
$ Backup docker s volume(s) from : mysql
$ Pause docker container : mysql
$ Backup datas from mysql container
$ Unpause docker container : mysql
$ Output file name : mysql_31-Aug-2015_21-16-35.tar.gz
$ Done.
```

## Restore a container

Run your docker container

```sh
$ docker run --volumes-from [Your container] -v $(pwd):/backup ubuntu bash -c "tar xf /backup/[Backup_file].tar.gz"
```

### Example

```sh
$ docker run --name mysql -e MYSQL_ROOT_PASSWORD=my-secret-pw -d mysql:tag
```

```sh
$ docker stop mysql
$ docker run --volumes-from mysql -v $(pwd):/backup ubuntu bash -c "tar xf /backup/mysql_31-Aug-2015_21-16-35.tar.gz"
$ docker start mysql
```

<br /><br />

## LICENSE

This script is licensed under the MIT Open Source license. For more information, see the LICENSE file in this repository.
