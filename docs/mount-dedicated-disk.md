# Mount disks.

These are the steps to mount a disk in Ubuntu.

First we identify the disks to be mounted. We see the mounted disks (*sda* y *sdb*) so the disk to mount is *sdc*. This can change in any machine.

```sh
 df -h
```

This shows the available disks filtering by the one we want to mount. If it does not appear you should check if it was created correctly in the Azure portal.

```sh
dmesg | grep SCSI
```

First we say we want a new partition by writing **n**. Next we say it is going to be a primary partition by writing **p**. Anything else is left by default.

```sh
sudo fdisk /dev/sdc
Command (m for help): n
Command action: p
   e   extended
   p   primary partition (1-4)
Partition number (1-4):
First cylinder (1-621, default 1):
Using default value 1
Last cylinder or +size or +sizeM or +sizeK (1-621, default 621): +384M
```

Create `/data` directory where the disk will be mounted.

```sh
sudo mkdir /data
```

Format the disk in `ext4` (Recomended to use the file system that your OS use)

```sh
sudo mkfs.ext4 /dev/sdc1
```

We get the new disk's UUID (*sdc1*) which we will use later on.

```sh
ls -la /dev/disk/by-uuid/

drwxr-xr-x 2 root root 120 Oct 21 12:24 .
drwxr-xr-x 9 root root 180 Oct 21 12:24 ..
lrwxrwxrwx 1 root root  10 Oct 21 12:24 5207f5ca-2fba-497a-bdc1-748c719908ff -> ../../sda1
lrwxrwxrwx 1 root root  10 Oct 21 12:24 563f929e-ab4b-4741-b0f4-e3843c9a7a6a -> ../../sdc1
lrwxrwxrwx 1 root root  10 Oct 21 12:24 6d74afea-a2d5-4594-a357-72185217eba5 -> ../../sdb1
```

We modify the `fstab` file so that the disk is always mounted on restart.

```sh
sudo vi /etc/fstab 

UUID=5207f5ca-2fba-497a-bdc1-748c719908ff       /        ext4   defaults,discard        0 0
UUID=F631-BECA  /boot/efi       vfat    defaults,discard        0 0
/dev/disk/cloud/azure_resource-part1    /mnt    auto    defaults,nofail,x-systemd.requires=cloud-init.service,comment=cloudconfig       0       2
UUID=563f929e-ab4b-4741-b0f4-e3843c9a7a6a       /data        ext4   defaults        0 2

```

We mount the disk in the designated path.

```sh
sudo mount /data
```

We see it has correctly been mounted.

```sh
 df -h

Filesystem      Size  Used Avail Use% Mounted on
udev            2.0G     0  2.0G   0% /dev
tmpfs           394M  752K  393M   1% /run
/dev/sda1        29G  7.0G   22G  25% /
tmpfs           2.0G     0  2.0G   0% /dev/shm
tmpfs           5.0M     0  5.0M   0% /run/lock
tmpfs           2.0G     0  2.0G   0% /sys/fs/cgroup
/dev/sdc15      105M  3.6M  101M   4% /boot/efi
/dev/sdc1        32G  2.3G   28G   8% /data
/dev/sdb1       7.9G   36M  7.4G   1% /mnt
tmpfs           394M     0  394M   0% /run/user/1000

 ```
