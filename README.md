# ACQ400RELEASE
- ACQ400 firmware releases from 2019 on. 
- If your starting release predates March 1, 2019 do not go ahead, please follow special instructions:
- https://github.com/D-TACQ/ACQ400RELEASE/blob/master/README.md#additional-instructions-for-upgrading-acq4xx--firmware-pre-march-1-2019-

# Note on SD card
- All firmware is held on SD card, regular FAT32 format, no need to format a shop-bought card, 32GB or smaller.
- SD cards larger than 64GB may be used, provided they are preformatted so that the first partition is 32GB.
- The SD card is mounted on the running Linux system as /mnt/ and this is the "top-level" of the file system in the examples below. 
- If you were to mount the same card on Windows, it would likely be at something like "E:\\" and on a regular Linux desktop perhaps /run/media/user/xxx

 # INSTRUCTIONS
   # Backup!
  0. Note any custom packages you have activated (FIRMWARE web page) 
  
  - The update won't touch any customization you have in /mnt/local/, but if you haven't already backed up /mnt/local, now would be a good time
   
    - scp -r root@UUT/mnt/local MYPC/UUT
    
   # Online method: recommended new from R418: release comprises two images
    - acq400-418-yyymmddhhmmss.tar
    - fpga-418-yyymmddhhmmss.img

  1. Download the release to a PC. Use a browser, wget won't work with https://
  
    - eg The 418 release:
     https://github.com/D-TACQ/ACQ400RELEASE/releases/download/v418/acq400-418-20210912185848.tar
     https://github.com/D-TACQ/ACQ400RELEASE/releases/download/v418/fpga-418-20210912185848.img

  2. Free memory on the UUT
  
    first reboot the UUT so that there's no unwanted state.
    ssh root@UUT 'set.sys /dev/acq400.0.knobs/jettison_buffers_from 20'  

  3. copy the files to the UUT. nb: only the .tar file goes to /tmp..

        ```bash
        scp acq400*tar root@UUT:/tmp
        scp fpga*img root@UUT:/mnt/ko
        ```

  4. log in to the UUT

        ```bash
        ssh root@UUT
        ```

  5. Validate

        ```bash
        sha1sum /mnt/ko/fpga*img /tmp/acq400*tar
       ```

    compare sha1 result with value posted on the RELEASE page on github and only proceed if it's the same..

  6. run the upgrade

        ```bash
        tar xvf /tmp/acq400*tar -C /mnt ./bin
        /mnt/bin/update_release /tmp/acq400*tar
        ```

  7. restore any custom packages that were previously  activated from the current stock.  eg

        ```bash
        ssh root@UUT 'mv /mnt/packages.opt/35-custom_multievent-1909021107.tgz /mnt/packages'
        ```
  
  8. reboot  # sync ensures that data is flushed to SD.
 
        ```bash 
        ssh root@UUT 'sync;sync;reboot'
        ```
  
   # For a fresh SD card
  release now comprises two images
  
    - acq400-418-yyymmddhhmmss.tar
    - fpga-418-yyymmddhhmmss.img   

  0. Make sure the SD card is completely blank. DO NOT write on top of an existing SD image.
  
  1. untar the release image acq400-NNN-yyymmddhhmmss.tar to the toplevel of the SD card
 
  2. copy the release image fpga-NNN-yyymmddhhmmss.img to newly created subdirectory "ko" on the SD card

  3. restore the "local" subdirectory from backup.

  4. restore any custom packages that were previously  activated from the current stock, by moving or copying from subdirectory packages.opt to packages, eg:

        ```bash
        mv /mnt/packages.opt/35-custom_multievent-1909021107.tgz /mnt/packages
        ```
 
   # Initialization files in /mnt/local
  
  1. sysconfig. 
  
These are defaults for the current payload. If the payload changes, or perhaps the sysconfig is simply out of date, you can re-generate the current factory defaults from here:
   https://github.com/D-TACQ/acq400_sysconfig

  2. Calibration
  
Calibration files are held in /mnt/local/cal/Exxxxx.xml where xxxx is the serial number of the module.
If you are missing a calibration file, please ask D-TACQ for a replacement copy.

  3. Patch files
  
We try to avoid patch files on shipment, but sometimes it's necessary. in particular

     # /mnt/local/acq420fmc.ko 
     
     is a patch driver and must/will be blown away by the release
     
     # /mnt/local/ACQxxx_TOP_aa_bb*.bit.gz 
     
     is a patch FPGA image. if one is fitted to your system, please contact D-TACQ for update advice.
     
  4. all other files in /mnt/local
  
All other files in /mnt/local "belong to the user" and are untouched by upgrade.

  # EPICS4
The standard release runs EPICS7. Normal EPICS4 utilities like "pvinfo" are available as default.
The embedded IOC is linked to "qsrv" to provide access to all records using pva as well as the default ca
 
 # Additional instructions for upgrading acq4xx- firmware (pre March 1, 2019) :
 
 1. edit /mnt/local/sysconfig/acq400.sh and append this as the final line (to temporarily supercede any other NBUF= lines)
```
NBUF=10
```

2. sync;sync;reboot

The unit no comes up with sufficient free memory to do the upgrade, proceed as above

3. On rebooting after upgrade, remove the NBUF=10 statement from ACQ400.sh

Firmware beginning acq400- rather than acq4xx- from March 1 2019 automatically reclaims the memory on upgrade.
  
  
