# ACQ400RELEASE
ACQ400 firmware releases from 2019 on

 # INSTRUCTIONS
  0. Note any custom packages you have activated (FIRMWARE web page) 
   0. The update won't touch any customization you have in /mnt/local/, but if you haven't already backed up /mnt/local, now would be a good time
   
    - scp -r root@UUT/mnt/local MYPC/UUT
    
  1. Download the release to a PC. Use a browser, wget won't work with https://
  
    - eg The 129 release:
    - https://github.com/D-TACQ/ACQ400RELEASE/releases/download/v129/acq400-129-20191025111814.tgz
  2. Free memory on the UUT
  
    - ssh root@UUT 'set.sys /dev/acq400.0.knobs/jettison_buffers_from 20'  
  3. copy the file to /tmp eg
  
    -  scp acq400*tgz root@UUT:/tmp
  4. run the upgrade
  
    -  ssh root@UUT '/mnt/bin/update_release /tmp/acq400*tgz'
  5. restore any custom packages that were previously  activated from the current stock.
  
  
