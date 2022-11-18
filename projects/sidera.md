---
layout: default
title: SIDERA
description: An ITS solution SCADA
---

# SIDERA
SIDERA is an SCADA which I took part of. If you are interested to know SIDERA, here is an introductory video

<iframe frameborder="0" src="//fast.wistia.net/embed/iframe/1udndnopro " style="width: 100%; height: 600px;" msallowfullscreen="msallowfullscreen" oallowfullscreen="oallowfullscreen" webkitallowfullscreen="webkitallowfullscreen" mozallowfullscreen="mozallowfullscreen" allowfullscreen="allowfullscreen" name="wistia_embed" class="wistia_embed" scrolling="no" allowtransparency="true"></iframe>

## State of the art (Context)
SIDERA has been one of the most largest software product I had taken part of. When I started to work here was very difficult for me to understand the whole system (including the way to work in SICE as company). It is a huge ecosystem of SW and HW infraestructure, manages from, we can say "front-end" or "client" applications, to field devices installed in tunnels, roads, railways etc. 

More over, it count with a robust software engineer procedure: design, development, test, deployment is not the only way. In paralel, there are QA, CI, cibersecurity audits while software engineers are doing their work. But it is also, the product development is driven by so many different projects (of different nature, from tunnels to freeways) with very different requirements each other.

## First steps in SIDERA
I started with little analize, design and development features: some new module to integrate, some wrong baheviour to be debugged and fixed and so on.

After about 3 month I felt comfortable with the system and adquired the confidence to not just develop and fix code. I tried to improve each module I worked wth. I love to do the things with good practices, and in such a huge system like SIDERA it is always a hard labour to make developers maintain this level of quality, specially if the developer has a project deadline, I know that. But I tried to rename variables to try get them naminful, refactored some method to keep them maintenable and easily testable (for unit testing).

# Notable tasks and uses cases

## GENETEC SDK (best practice advocacy use case)
One of my first task in SICE was to integrate Intrussion Access detection systems (from GENETEC's SDK) in SIDERA. My firsts steps, obviously, were: to fromally design this new integration describing the functionality, the investigating the SDK and studying the way to include in our platform. After that, development process could be started.

### Development process
This module of the application was very old, and may be one of the first external system integrated in SIDERA. [GENETEC](https://www.genetec.com/) is such a security software, in this case, to manage and monitorize CCTV cameras. SIDEA working as a SCADA, integrate their SDK to have the state of the cameras synchronized. GENETEC is a complex system and it can be intuited in the code. A lot of time, a bunch of people modifying, fixing (and undo)... This module includes a GENETEC SDK wrapper library written in .NET C# and a C++ service that used it and communicates with SIDERA.

For this interoperability, I discovered a file contained 3k code lines. 3k lines of incomprehensible code. Complex (windows) system calls. The trouble is that it used Window's C#/C++ COM interoperability, a way to integrate .NET (C#) libraries in C++ but that converts the .NET method invocations in a dark entity with low mainability and a lot of duplicated code. This approach forces the developer to convert each method invocation parameter in Window's compatible types, encode and decode method params/returning values and a lot of things, from my point of view, unnecessary with current technology.
I tried first to suppress these duplication by extracting (as far I could) common code to new functions. I fixed as well, old features and approaches of the C++ service side: DDBB queries scattered in multiple files, configuration parameters not validated and "bad managed" and another minor changes involved to our platform calls.

After done this, inmediatly I started with the new devices integration itself. All was done and the service improved a lot (i.e: I could reduce the COM invocations class almost at a 25%). It was time to test the integration. For this, I needed the field devices of the GENETEC's AIC system (Numeric pads to unlock doors, doors with card readers, intrusion detection devices such as  open/close contactors and so on.) But we have not these devices already, so the test & validation process had to be postponed.

After some month later, we had the devices available in a test laboratory. I could test that the system received the doors and devices states. But the client asked us for a last minute change. We used a polling approach to retrieve the devices' states, but (I overlooked it during the design phase) IACS is critical equipment that has to do with security, state changes had to be subscription-based to ensure they were made in real time.

### Approach change in-time
At this point I found a turning point. COM interoperability allows event subscription to .NET library, but in a redundant and non-intuitive way. We had more than plenty of time to finish this integration task, so I tried to expend the needed time to revert the situation and supress COM and use [C/CLR](https://learn.microsoft.com/en-us/dotnet/standard/clr) compatibility layer instead. This approach improved the types extensibility and another bunch of improvements related to code intuitivity, readability and, in general, mainability improvements. I did the change and the event-suscription based approach (keeping old polling approach as well to keep compatibility with other projects and becouse there are not incompatible approaches).

The trouble comes when I tried to merge my fork of this module to the main branch. It had a lot of changes for a concrete project (that keept increasing the bad-manner code). I asked to the aouthors of these changes to see a way to include them in the changes I worked (the most conflictive were a bunch of new COM calls and an event suscription to retrieve GENETEC server's changes). After talk to some of project's responsibles I noticed that these changes could be done in my approach, so I proceed to replace the entire old module with my new one and begin to include the latest changes done in the old one. At this point, the other project's manager noticed about my changes and propossed a meeting with another project managers and me. They explained that this concrete poject was in a ver advanced stage, had passed FAT and soon they would pass the SAT tests. Due to these project's deadline, they asked me to revert all my changes, even my project manager, told me to revert all the improvement and implement the integration in to the old module approach which I flatly refused due to I consider that changes as a huge improvement of the module.

### Problem resolution, code cuality promoter
To resolve this situation, I had several meetings with product managers, I wrote a technical notes document justifying the improvement implied by the changes in the new version of the module. The product managers strongly agreed with me, but project's managers keept in their possition (I understand them becouse their job is to ensure compliance with the project requirements, increasing the benefits of the project and my changes would force them to allocate more hours, in this case to testing and validating processes).

I finally reached an agreement with all parties involved. I would merge my changes in a "new" module. New project's will use this version. However I keept the old one until that critical project releases and freeze a project's stable version of the product. Finally, the old approach would be definitively removed from our CVS.


## Catenary energization calculation (a recursive DFS approach to solve the problem)

OSC subsystem is a windows service that is written using C++ 11 standard to take advantage of the [Smart Pointers](https://en.cppreference.com/book/intro/smart_pointers). The main goal is to real time check the satate of energization of catenary sections along the railway. Following image is a portion of the entire electrical schema to be calculated in this project:

![OSC Schema](/assets/img/SIDERA_OCS_Schema.png)

There are 3 different actors (from now, nodes) to solve this problem: 
 - Feeders (a sort of disconnector switch that acts as power supply as well)
 - Disconnector (comon electrical switch)
 - Catenary sections

On one hand, there are 3 possible states:
 - Energized (the node is receiving, and could propagete, electrical current)
 - De-energized (the node is not receiving any electrical current)
 - Mismatch (the node has an indeterminate status)

 For Feeders and Disconnector, the switch state could be in:
  - Opened (it is not allowing to propagate electricity)
  - Closed (it allows to propagate electricity, if it is energized, of course)
  - Mismatch (the switch status is unkown, for example because the SCADA could not communicate with it. This state will be treated, preventively and for safety, as if the status is closed)

### Proposed solution
They way to check a concrete node electrical status is to checkin their adjacent status by **DFS algorithm**. 
If it is a Feeder, just check it Voltaje and Current parameters and compare them with threshold values. If it is a near-to-Feeder node, the algorithm will check if the feeder is energized and if it switch status is closed (if so, then the current node is energized). In other words, the algorithm should ensure the node is not energized anyway.

If the adjacent node is not calculated, the process should repeat with their adjacents and so on until find an already calculated node or until the current node is not energized anyway. Thus, I decided to use **recursion** approach to solve this problem to improve algorithm performance and make it as "real time" calculation as possible. 

#### Algorithm cases (recursion conditions)
There is a base conditions that prevents the algorithm recursion and returns a direct value:

 - This node is **not calculated**:
	- *Check adjacents* energization status **Recursive call**

 - This node is **already calculated**:
    - If it is *energized, propagete back it's value* **Base case**
	- If it is *not energized*, propagate back as well, but the "parent" call shall *check another adjacents* to ensure no one is energized **Recursive call**

#### Debugging
The debugging process of any recursive algorithm must be carried out in a thorough manner. Moreover as in this case that the recursion base case is not as clear as in simple recursion implementations. I made some traces (during the debug) to ensure the case base is reached at any case.

![OCS trace](/assets/img/SIDERA_OCS_Debug_trace.jpg)

### Performance analysis
The worse performance is the first algorithm launch, because it will walk throught entire nodes at the first time. In other hand, for subsecuently executions, some nodes will be already calculated, so the recursion deep will be much shorter than the previous executions. 

The algorithm is subscribed to any node status change in the SCADA. I.e: if a Disconnector node changes it switch status, it will recalculate adjacents nodes (to check if their values shall change or not)

# Thoughts
TODO: Improvement Proposals for problems detected during the development of this project
