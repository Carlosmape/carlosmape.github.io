---
layout: post
title: Fixing broken rooted tablet
description: Retaking an old project to degoogle an Android tablet that ends with a paperweight
tags: ["Android"]
---

# State of the art
Some time ago, I tried to root and de-google an old tablet. Just for fun and check by my self the process. Also I want to check if the Gapps consumes more resources (indeed more battery) and I could give more battery life to my device.

I allowed to install custom [TWRP](https://twrp.me/about/) recovery system. After that I allowed rooted with [Magisk](https://themagisk.com/). All this knowledge comes from a huge research in internet (Reddit, XDA, and other Android forums). And some try-error. Once rooted, the first thing I done, was to create a system backup using TWRP. All seemed to be nice! Time to play with a rooted tabled and try to "de-google" it!

I started by downloading some app removal for root (I dont know the name, I simply searched in Play Store and tryed some of them). It is worth to mention that I removed some apps, rebooted the device and tested if all were working again. I begin to remove known useless applications i.e.: Vendor pre-installed applications such as one called "Lenovo Tab 4 10" that just shows an usage demo, some useless games, and third party applications such as Amazon and Netflix. I discovered some hidden applications pre-installed by the manufacturer such as some japanese packages and a wierd launcher. I properly remove all of them.

Some time late, in a further research I proposed to remove Google applications and services (each application leads me to investigate if there were Android applications or not). OK! I removed Maps, Gmail and even some other applcations such as account manager and Google Services!!. Time to make an "stable" backup. I turned on the tablet and entered to Recovery Mode (TWRP) to make a system backup. Ups, at this point the troubles begin... I dont know how or why, TWRP failed the backup process... I tried several times but the process always unexpected exited.

I tried to reboot the tablet again. Manufacturer's logo appears, all right. Android initializes and displays the lock screen, fine! Unfortunately for me, sudenly the device restarted. Initializes Android again and the same situation: few seconds after display the lock screen, the tablet reboots again.

Obviously, my maind says to me: quickly! restore to the latest maked backup!!. I started TWRP again, went to backup process, selected the properly backup image and wait until it finished the process. Rebooted the tablet again... and ... the issue appears again, the trouble was not fixed. I converted the old tablet in a paperweight.

# Some time later
In this weekend I have some free time to literarly waste by researching and may be not fix the tab. 

First of all, I tried to restore the old system backups. Not just one, all of them, from the newer to the older. Nothing different happens, the tablet keeped broken.

Let's do something different (may be my backups were corrupted or were including the origin of the issue): I started to look for an original ROM image from the manufacturer but I did not find anything. Instead I found an unofficial [Lineage OS ROM image](https://forum.xda-developers.com/t/rom-unofficial-9-0-tbx304f-l-x-lineageos-16-0-for-lenovo-tab4-10.4199623/page-2) compatible with my tablet. It is not official becouse Lineage OS Community has not this tablet in [their compatible devices list](https://wiki.lineageos.org/devices/). Nice! Why I should not try to install this room instead of the original manufacturer's one? Yeah, it is an unofficial image... it is not trusted and properly tested, but... What difference does it make if the tablet was already broken?. 

I uploaded the image to my tablet SD card. Booted the tablet in Recovery mode but... what the heck? TWRP does not initializes. All the time, the tablet where running in the Recovery Menu. Oookay, no problem, lets reinstall TWRP throw fashboot Android's SDK command tool.

Once installed, I enter on TWRP install menu, selected the Lineage OS ROM and waited to TWRP finished the process... But an `/data` partiton error appears in the installation log. So I researched about this error and found a tutorial to fix it. Apparently, `/data` partition was become corrupted, to fix it was needed to format the partition to another data format (in this case ext2) and format again to the original data format (ext4). If this format will fix the system partition, why not this fix my original trouble? I restarted the tablet (once again) and surprisingly, Android started from the scratch (such as if I recently bought it!) Android asks from permissions and so on. An What I have in my hands!? Android were working properly again!!

At this point it was close to 3:00 A.M and I was tired but excited to know if I could (may be) install Lineage OS. I thought: last opportunity, if it does not work, I will go to sleep and may be another day will try to restore the system again. I rebooted one more time, started againt TWRP and try the final opportunity. The process finished properly this time, no error logs and an atractive button "Reboot" that were saying "push me" and... 

Tablet restarts and I saw the loading screen of Lineage OS! How wonderful when everything works first time... right? Too late to geek in to Lineage OS, time to sleep.
(To be continued)
