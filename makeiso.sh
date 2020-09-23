#!/bin/bash
#################################################################
# You will need to replace "user_account" /w your username      #
# You will need to verify your paths                            #
# You will need to modify for anything else that is not rhel7.8 #
#################################################################
#Folder that was extracted from ISO
cd /home/user_account/Desktop/Folder_of_Extracted_ISO(RHEL7.8Server)/
##############Taking info from folder & creating ISO DO NOT CHANGE "RHEL-7.8 Server.x86_64" UNLESS YOU KNOW THE VOLUME ID!!!!###########
mkisofs -untranslated-filenames -volid "RHEL-7.8 Server.x86_64" -J -joliet-long -rational-rock -translation-table -input-charset utf-8 -b isolinux/isolinux.bin -c isolinux/boot.cat -no-emul-boot -boot-load-size 4 -boot-info-table -eltorito-alt-boot -e images/efiboot.img -no-emul-boot -o /home/user_name/Desktop/RHEL7.8-ks.iso -graft-points /home/username/Desktop/RHEL7.8Server
#Makes it uefi bootable
isohybrid --uefi /home/username/Desktop/RHEL7.8-ks.iso
