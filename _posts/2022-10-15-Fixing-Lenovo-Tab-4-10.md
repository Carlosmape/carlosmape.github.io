---
layout: post
title: Fixing a Broken Rooted Tablet
description: Reviving an old project to de-google an Android tablet that ended up as a paperweight
categories: ['Personal']
tags: ['Curiosity', 'Resilience', 'Problem resolution']
os: ['Android']
---

# State of the Art

Some time ago, I took on a personal challenge to root and "de-Google" an old Android tablet—just to experiment and learn about the process. My goal was to explore the potential for better battery life by removing resource-hungry Google apps and services. Additionally, I wanted to deepen my understanding of Android customizations and its ecosystem.

I started by installing the **TWRP** recovery system, followed by rooting the tablet with **Magisk**, which I had researched extensively through forums like Reddit and XDA. With these tools in place, I proceeded cautiously, ensuring I created backups of the system as I went along. The initial process was straightforward, and I was excited to see the tablet working after successfully rooting it.

## Removing Pre-installed Apps

My first task was to remove bloatware and Google applications. I used various root-enabled app removal tools I found in the Play Store, testing and verifying the stability of the tablet after each step. I carefully removed useless vendor applications (such as demo apps and pre-installed games), followed by third-party apps like **Amazon** and **Netflix**. I even uncovered some hidden applications pre-installed by the manufacturer and removed them to streamline the system.

Once I had cleared the basic apps, I aimed for a more ambitious goal: to remove all **Google services**. This included applications like **Maps**, **Gmail**, **Google Account Manager**, and **Google Services Framework**. After this, I created a **stable backup** of the modified system—confident that the tablet was now truly "de-Googled"!

## Encountering Trouble: A Broken Tablet

However, my excitement was short-lived. When I attempted to reboot the tablet and enter recovery mode to perform another backup, the device kept restarting, stuck in a boot loop. I tried to restore the latest backup through TWRP, but to my dismay, the problem persisted. Despite multiple attempts to fix the issue, I had inadvertently turned my once-functional tablet into a **paperweight**.

## A New Approach: Reviving the Tablet

After some time, I returned to the project, determined to fix the issue. I began by restoring all the old system backups—starting with the most recent and working backward. But the device still refused to boot. It was clear that the backups were either corrupted or included the source of the issue.

Then, during my research, I discovered an **unofficial LineageOS ROM** compatible with my tablet. While LineageOS wasn’t officially supported for my device, I saw an opportunity. The tablet was already bricked, so what did I have to lose? I decided to take a risk and install the unofficial ROM, hoping it would bring my tablet back to life.

## Overcoming Obstacles: Persistence Pays Off

I began by transferring the ROM to the tablet’s SD card and booting the device into recovery mode. Unfortunately, TWRP wasn’t initializing. No problem—I reinstalled TWRP using the **fastboot** command through Android's SDK tools. Once reinstalled, I selected the ROM and attempted to install it. However, an error related to the **/data** partition appeared, halting the process.

Undeterred, I researched the error and found a solution. The **/data** partition had become corrupted, so I needed to reformat it. Following the instructions, I reformatted the partition to the **ext2** format and then back to **ext4**, the original format. I hoped this would resolve the issue, but I wasn’t entirely sure.

To my surprise, after rebooting, Android started up from scratch, just as if it were a brand-new device. The tablet asked for permissions, and everything seemed to work as expected. Excited yet cautious, I decided to give LineageOS one last shot.

## Success: LineageOS Installed

Around 3:00 A.M., I tried again to install LineageOS. This time, everything went smoothly: no error logs, and the process finished successfully. I pressed "Reboot," and there it was—the **LineageOS** loading screen appeared! It was a thrilling moment of success, especially after all the setbacks I had encountered.

As excited as I was, it was time to sleep. The project had been a great learning experience and a test of my **curiosity**, **problem-solving skills**, and **resilience**.

(To be continued…)


