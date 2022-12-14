---
layout: default
title: Senda
description: A positioning-navigation system for Spanish's Army
---

# SENDA
Navigation system and synchronization server for Spanish F-110 frigates
The [SENDA navigation system](https://www.gmv.com/en-es/products/defense-and-security/senda) is [GMV’s](/career/#gmv-its-defense-20192021) advanced navigation and time reference solution for naval systems.

SENDA includes a multi-constellation satellite navigation technology compatible with military and civilian signals and differential global positioning system (DGPS) corrections. It also supports external sensors to provide robust navigation in coverage areas or theaters of operations in the event of GNSS signal denial or seizure.

SENDA has a built-in synchronization server that generates high-precision stable time signals.

# Notable tasks and uses cases

## Unit Testing - My first steps in SENDA
I moved to this project after end my first project in GMV. My first steps was to maintain and improve Google Tests (Unit Testing) for a internal library `aerolib` that implemented all needed functions to work with related aeronautics math (3D linear algebra: vectors, matrices and quaternions operations and related algorithms) implemented with static memory management approach to meet cibersecurity project's requirements.

The testing team focused on automatized test based in some cases in iterative randomly generated test executions to ensure (due to decimals usage) the system will not fail in some cases, defining manageable error thresholds.

## SENDA Recorder
After my first steps in the projec, the project manager entrusted me with the design and development of a *recording system based on SENDA* needed positioning devices. The system was thinked to be placed in [Hespérides (A-33) research vessel](https://en.wikipedia.org/wiki/BIO_Hesperides) to record raw data from each positioning device that will be used in SENDA's system (GNSS compatible: Galileo, GNS, GLONASS, BeiDou, and another auxiliary systems such as IMU, INS...)

In this project I leaded the HW & SW, needed to mount this system deploying the OS, preparing a portable server rack containing all devices to be recorded, the server itself and an UPS to make the system in high availability mode to avoid data lost. 

![SENDA_Recorder_lab_pic](/assets/img/SENDA_Recorder.jpg)

At HW level, I installed and configured some devices using communication protocols such as RS-232, RS-422 and Ethernet, installed some PCI boards in the server such a GPIO module, and another net board interfaces. Also I was the Validation and Verification responsible to ensure adquired hardware worked as expected.

At SW level, on one hand, my goal was to integrate new device's controllers (drivers) in the system, managing low level process of their messages traces. On the other hand, I developed a record-replay module that stores raw binary messages and then indicate the system to reproduce them.

Before ending the project, we did some test mounting the system in a van while the system was recording in order to trust record files after and verify that the data was properly stored in binary format.

![SENDA_Recorder_pic](/assets/img/SENDA_Recorder_rack.jpg)

### Reverse engineering to solve some problem
The most difficult task I faced was to integrate a device with low information. I needed to use reverse engineering technichs to know how some devices worked: using Oscilloscope and error-try approaches to properly decode their packages (with the ICD of the device in hand). After spent many time in the laboratory and some tests, I discovered that it had an error in some message's fields, producing errors during their validation (checksum was not matching with given ones).

I sent a mail to the provider indicating the problem and attaching as many traces as I could. Few time later, provider answer us indicating a bug in the device's firmware. After applied the patch, problem solved.
