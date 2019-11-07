# ACQ400RELEASE
ACQ400 firmware releases from 2019 on

 # INSTRUCTIONS
   # Backup!
  0. Note any custom packages you have activated (FIRMWARE web page) 
  - The update won't touch any customization you have in /mnt/local/, but if you haven't already backed up /mnt/local, now would be a good time
   
    - scp -r root@UUT/mnt/local MYPC/UUT
    
   # Online method: recommended
  1. Download the release to a PC. Use a browser, wget won't work with https://
  
    - eg The 129 release:
     https://github.com/D-TACQ/ACQ400RELEASE/releases/download/v129/acq400-129-20191025111814.tgz
  2. Free memory on the UUT
  
    - ssh root@UUT 'set.sys /dev/acq400.0.knobs/jettison_buffers_from 20'  
  3. copy the file to /tmp eg
  
    - scp acq400*tgz root@UUT:/tmp
  4. run the upgrade
  
    - ssh root@UUT '/mnt/bin/update_release /tmp/acq400*tgz'
  5. restore any custom packages that were previously  activated from the current stock.
  
   # For a fresh SD card

  0. Make sure the SD card is completely blank. DO NOT write on top of an existing SD image.
  
  1. untar the release to the toplevel of the SD card

  2. restore the "local" subdirectory from backup.

 
    # Initialization files in /mnt/local
  
  1. sysconfig. 
  
These are defaults for the current payload. If the payload changes, or perhaps the sysconfig is simply out of date, you can re-generate the current factory defaults from here:
   https://github.com/D-TACQ/acq400_sysconfig

  2. Calibration
  
Calibration files are held in /mnt/local/cal/Exxxxx.xml where xxxx is the serial number of the module.
If you are missing a calibration file, please ask D-TACQ for a replacement copy.

  3. Patch files
  
We try to avoid patch files on shipment, but sometimes it's necessary. in particular

     /mnt/local/acq420fmc.ko is a patch driver and must/will be blown away by the release
     /mnt/local/ACQxxx_TOP_aa_bb*.bit.gz is a patch FPGA image. if one is fitted to your system, please contact D-TACQ for update advice.
  4. all other files in /mnt/local
  
All other files in /mnt/local "belong to the user" and are untouched by upgrade.


 
  
  
