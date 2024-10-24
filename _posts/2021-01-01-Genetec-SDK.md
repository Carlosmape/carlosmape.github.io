---
layout: post
title: Genetec SDK integration in SIDERA
description: New features, but improving existent code, always
tags: ['Best practices', 'Proactivity', 'Problem resolution', 'Proficiency']
categories: ['SICE', 'Professional project']
os: ['Windows']
languages: ['C++', 'C#']
ides: ['Visual Studio']
ddbb: ['SQL Server']
---
# GENETEC SDK
One of my first task in [SICE](/career/#sice-its-2021now) was to integrate Intrussion Access detection systems (from GENETEC's SDK) in [SIDERA](./sidera). My firsts steps, obviously, were: to fromally design this new integration describing the functionality, the investigating the SDK and studying the way to include in our platform. After that, development process could be started.

## Development process
This module of the application was very old, and may be one of the first external system integrated in [SIDERA](./sidera). [GENETEC](https://www.genetec.com/) is such a security software, in this case, to manage and monitorize CCTV cameras. [SIDERA](./sidera) working as a SCADA, integrate their SDK to have the state of the cameras synchronized. GENETEC is a complex system and it can be intuited in the code. A lot of time, a bunch of people modifying, fixing (and undo)... This module includes a GENETEC SDK wrapper library written in .NET C# and a C++ service that used it and communicates with [SIDERA](./sidera).

For this interoperability, I discovered a file contained 3k code lines. 3k lines of incomprehensible code. Complex (windows) system calls. The trouble is that it used Window's C#/C++ COM interoperability, a way to integrate .NET (C#) libraries in C++ but that converts the .NET method invocations in a dark entity with low mainability and a lot of duplicated code. This approach forces the developer to convert each method invocation parameter in Window's compatible types, encode and decode method params/returning values and a lot of things, from my point of view, unnecessary with current technology.
I tried first to suppress these duplication by extracting (as far I could) common code to new functions. I fixed as well, old features and approaches of the C++ service side: DDBB queries scattered in multiple files, configuration parameters not validated and "bad managed" and another minor changes involved to our platform calls.

After done this, inmediatly I started with the new devices integration itself. All was done and the service improved a lot (i.e: I could reduce the COM invocations class almost at a 25%). It was time to test the integration. For this, I needed the field devices of the GENETEC's AIC system (Numeric pads to unlock doors, doors with card readers, intrusion detection devices such as  open/close contactors and so on.) But we have not these devices already, so the test & validation process had to be postponed.

After some month later, we had the devices available in a test laboratory. I could test that the system received the doors and devices states. But the client asked us for a last minute change. We used a polling approach to retrieve the devices' states, but (I overlooked it during the design phase) IACS is critical equipment that has to do with security, state changes had to be subscription-based to ensure they were made in real time.

## Approach change in-time
At this point I found a turning point. COM interoperability allows event subscription to .NET library, but in a redundant and non-intuitive way. We had more than plenty of time to finish this integration task, so I tried to expend the needed time to revert the situation and supress COM and use [C/CLR](https://learn.microsoft.com/en-us/dotnet/standard/clr) compatibility layer instead. This approach improved the types extensibility and another bunch of improvements related to code intuitivity, readability and, in general, mainability improvements. I did the change and the event-suscription based approach (keeping old polling approach as well to keep compatibility with other projects and becouse there are not incompatible approaches).

The trouble comes when I tried to merge my fork of this module to the main branch. It had a lot of changes for a concrete project (that keept increasing the bad-manner code). I asked to the aouthors of these changes to see a way to include them in the changes I worked (the most conflictive were a bunch of new COM calls and an event suscription to retrieve GENETEC server's changes). After talk to some of project's responsibles I noticed that these changes could be done in my approach, so I proceed to replace the entire old module with my new one and begin to include the latest changes done in the old one. At this point, the other project's manager noticed about my changes and propossed a meeting with another project managers and me. They explained that this concrete poject was in a ver advanced stage, had passed FAT and soon they would pass the SAT tests. Due to these project's deadline, they asked me to revert all my changes, even my project manager, told me to revert all the improvement and implement the integration in to the old module approach which I flatly refused due to I consider that changes as a huge improvement of the module.

## Problem resolution, code cuality promoter
To resolve this situation, I had several meetings with product managers, I wrote a technical notes document justifying the improvement implied by the changes in the new version of the module. The product managers strongly agreed with me, but project's managers keept in their possition (I understand them becouse their job is to ensure compliance with the project requirements, increasing the benefits of the project and my changes would force them to allocate more hours, in this case to testing and validating processes).

I finally reached an agreement with all parties involved. I would merge my changes in a "new" module. New project's will use this version. However I keept the old one until that critical project releases and freeze a project's stable version of the product. Finally, the old approach would be definitively removed from our CVS.

