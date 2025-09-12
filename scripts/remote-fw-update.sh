#!/usr/bin/env -S bash # -x

version=${1:-627}

echo "Download firmware files for release ${version}"
tar_file=`awk '/tar/ {print $2};' chksums.${version}`
img_file=`awk '/img/ {print $2};' chksums.${version}`

for f in ${tar_file} ${img_file};
do
	echo ""
	wget -q --show-progress -c -N https://github.com/D-TACQ/ACQ400RELEASE/releases/download/v${version}/${f}
done

echo "Checking firmware files checksums."
if ( sha1sum --check chksums.${version} )
then
	echo "Checksums OK, proceeding with F/W upgrade."
else
	echo "Checksums BAD, exit"
	exit 1
fi

echo "Backing up activated optional packages list."
ssh root@dtacq 'ls /mnt/packages' > pack_list

echo "Backing up /mnt/local."
ssh root@dtacq 'tar cvzf mnt_local.tgz /mnt/local'
scp root@dtacq:mnt_local.tgz .

echo "Rebooting d-tacq. Sleep 60 seconds."
ssh root@dtacq reboot
sleep 60

echo "Installing new firmware files on d-tacq."
ssh root@dtacq 'set.sys /dev/acq400.0.knobs/jettison_buffers_from 20'
scp ${tar_file} root@dtacq:/tmp
scp ${img_file} root@dtacq:/mnt/ko

ssh root@dtacq 'tar xvf /tmp/acq400*tar -C /mnt ./bin'
ssh root@dtacq '/mnt/bin/update_release /tmp/acq400*tar'

sleep 60
echo "Reinstalling ssh key, optional packages and /mnt/local content."
ssh-copy-id root@dtacq
ssh root@dtacq rm '/mnt/packages/15-custom_sshkeys-*'
ssh root@dtacq rm '/mnt/packages.opt/15-custom_sshkeys-*'
ssh root@dtacq tar -cvzf /mnt/packages.opt/15-custom_sshkeys-`date +'%y%m%d%H%M%S'`.tgz /root/.ssh/authorized_keys

scp mnt_local.tgz root@dtacq:
ssh root@dtacq 'tar -xvzf mnt_local.tgz --directory=/'

packages_list=$(cat pack_list | awk -F- '{print $1"-"$2};')
for p in ${packages_list};
do
	if [ `ssh root@dtacq ls /mnt/packages/${p}* 2> /dev/null | wc -l ` == 1 ]
	then
		echo "Package ${p} already in /mnt/packages"
	else
		if [ `ssh root@dtacq ls /mnt/packages.opt/${p}* 2> /dev/null | wc -l ` == 1 ]
		then
			ssh root@dtacq "mv /mnt/packages.opt/${p}* /mnt/packages"
		else
			echo "********* PACKAGE ${p} NOT FOUND **********"
	        fi	
	fi
done

echo "Rebooting d-tacq in 10 seconds."
sleep 10
ssh root@dtacq 'sync;sync;reboot'
exit 0
