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

The MIT License (MIT)

Copyright (c) 2015 Florian Lacrampe

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
