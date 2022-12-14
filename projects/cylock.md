---
layout: default
title: Cylock 
description: An IoT solution to keept your bike tracked and localized (anti-theft system)
---

# Cylock
Cyclock is the final project I developed for [Android development diploma](/career/#android-development-diploma-20182019). This page will explain in further detail my experience developing the project and will not cover specific technical specifications.

Here you can [download the original project report](/assets/docs/Cylock_report.pdf) (it is in spanish).

## Overview
What I was looking for this IoT application solution, was centered on two main topics: user experience and low-cost.
I could be a low-cost device (the IoT part) in order to allow any bike user to buy it and to  provide the user a good usage experience avoiding some specific concepts, easy to configure and work with.

### Architecture

![MQTT Architecture schema](/assets/img/cylock_mqtt_architecture.png)

The elements in the architecture (rougly speaking) are 3: 
One one hand there is an embdeed system (IoT) **written in C++**. Acting as MQTT Publisher.
On the other hand, to control the device there is an Android Application (Cylock) **written in Java**, using Android Studio. Acting as MQTT Subscriber.
Finally Firebase application that will be acting as MQTT Broker.

### IoT device
It is a simple embdeed device composed by an Arduino Nano, a SIM800L GPRS module to give the Arduino Geolocation and Internet capabilities by using a SIM card. An finally a Li-Ion battery.

![IoT schema](/assets/img/cylock_iot.jpg)

The features to be implemented on each device will be very modular:
 - Arduino Nano (microcontroller): Will be the respoinsible to manage the SIM800L module, by initialize it, periodically ask for it's georeference and prepare the MQTT messages to notify the Android application end point.
   In other hand, this device will implement 2 different modes: The **stand by mode** (that will retrieve GPS positions in a wider period of time in order to save battery). The **on movement mode** that will reduce the period in wich the device will ask for GPS positions. The device will change between these two modes depeinding on GPS point increment threshold, in order to avoid changing between these modes during GPS known-error or known deviation.
 - SIM800L (GSM 2G module): The only purpose of this device is to provide GPS and Internet access.

### Cylock (Android App)
This application will be the endpoint to link with the IoT device. This will be receiving messages incoming by suscribing to MQTT. 

![Cylock application](/assets/img/cylock_app.png)

The main goal of the application is to set up "the alarm system", to knwo (if it is armed) if the bike is parked or if there is an attempted theft by keeping the following flow-diagram: 

![Cylock application flow](/assets/img/cylock_flow_diagram.png)

Also calculates some metrics (a saved CO2/fuel calculator based on the registered activity) and allows the user to see a kind of activity log.

The application counts with a live tutorial to let the user know the main features by taking a tour of the basic functionalities.

## Thoughts
The biggest difficulty I faced was to develop the IoT device and make a choice of which module will be used:
 - Ubiquity
	Firstly, I was looking for a non SIM card dependant GPS device (I could find some one) that's right. But these kind of devices do not provides Internet access. Instead of givin Internet to the device, I studied another alternatives like use of any Bluetooth/Wifi dongle such as ESP8266. But these device's distance capabilities has no sense for this application. What if a user parked the bike more than 10 meters away of itself? Even more, what if the user is inside a building, at the office or at home? The properly solution was use a GSM module instead. This way unlocks the ubiquity trouble but requires the user to purchase a SIM card with an internet access tariff wich worsens the user experience.
 - IoT device logic
	Secondly, SIM800L is a GSM 2G module is not programmable itself. It is managed with in-time AT commands. It requires to be goberned by another microcontroller such, in this case, Arduino Nano, which sent the needed AT commands to the module when they are needed. This module provides a 2G internet capabilities wich counts with 64Kbps which whould be enough to send JSON messages to the MQTT Broker (Firebase server). To improve the net performance could be replaced easily by another module of the SIM* family (wich also will accpet the same AT commands)

