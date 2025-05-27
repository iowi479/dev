# Dev

## Setup
Clone this repo or use the  ```setup``` executable

### setup git
```bash 
git config --global credential.helper store
git config --global user.email "<email>"
git config --global user.name "<name>"
```

### Setup auto mounts
Sdd credentials to (replace ```<...>```)
```bash
touch ~/.smbcredentials
echo "username=<username>\npassword=<password>" > ~/.smbcredentials
chmod 600 ~/.smbcredentials
```
and (replace ```<...>```)
```bash
mkdir ~/.davfs2/
touch ~/.davfs2/secrets
echo "<Nextcould mountpoint> <username> <password>" > ~/.davfs2/secrets
chmod 600 ~/.davfs2/secrets
```

The ```/etc/fstab``` has to be appended with: (replace ```<username>```)
```
sudo echo "//truenas.alle-schindlers.de/Daten /media/daten cifs credentials=/home/simon/.smbcredentials,uid=1000,gid=1000,auto,rw 0 0 https://nextcloud.alle-schindlers.de/remote.php/dav/files/<username>/ /media/nextcloud davfs _netdev,rw,auto,user,uid=1000,gid=1000 0 0" > /etc/fstab
```

Finally open ```Startup Applications``` and add an entry for the script: ```~/.config/mounter/nextcloud.sh```

## Installing dependencies
use the ```run``` script to install dependencies
```bash
./run.sh
```

## Configuring the environment
use the ```dev-env``` script to copy all configurations
```bash
./dev-env
```

You can also reset the environment using the ```dev-env``` script after running it once
```bash
dev-env
```
