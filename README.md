# Dev


## Setup
clone this repo or use the ```setup``` executable

### setup git
```bash 
git config --global credential.helper store
git config --global user.email "<email>"
git config --global user.name "<name>"
```

### setup mounts
add credentials
```text
username=<username>
password=<password>
```

to
```bash
touch ~/.smbcredentials
chmod 600 ~/.smbcredentials
```

and
```text
<Nextcould mountpoint> <username> <password>
```
to
```bash
mkdir ~/.davfs2/
touch ~/.davfs2/secrets
chmod 600 ~/.davfs2/secrets
```
The ```/etc/fstab``` has to be appended with:
```
//truenas.alle-schindlers.de/Daten /media/daten cifs credentials=/home/simon/.smbcredentials,uid=1000,gid=1000,auto,rw 0 0
https://nextcloud.alle-schindlers.de/remote.php/dav/files/<username>/ /media/nextcloud davfs user,rw,auto,uid=1000,gid=1000 0 0
```

## installing dependencies
use the ```run``` script to install dependencies
```bash
./run.sh
```

## configuring the environment
use the ```dev-env``` script to copy all configurations
```bash
./dev-env
```

you can also reset the environment using the ```dev-env``` script after runnig it once
```bash
dev-env
```
