#!/bin/bash
#Folder that was extracted from ISO
cd /PATH/TO/FOLDER/rhel-server-7.8-x86_64-dvd/
#Taking info from folder & creating ISO DO NOT CHANGE "RHEL-7.8 Server.x86_64" UNLESS YOU KNOW THE VOLUME ID!!!!
mkisofs -untranslated-filenames -volid "RHEL-7.8 Server.x86_64" -J -joliet-long -rational-rock -translation-table -input-charset utf-8 -b isolinux/isolinux.bin -c isolinux/boot.cat -no-emul-boot -boot-load-size 4 -boot-info-table -eltorito-alt-boot -e images/efiboot.img -no-emul-boot -o /home/caleb.kingsbury/Desktop/rhel-server-7.8-DGMT.iso -graft-points /home/caleb.kingsbury/Desktop/rhel-server-7.8-x86_64-dvd
#Makes it uefi bootable
isohybrid --uefi /PATH/TO/ISO/rhel-server-7.8-DGMT.iso
