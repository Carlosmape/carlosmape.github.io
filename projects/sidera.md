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

## Quality code VS maintainability in a huge SW system
I started with little analize, design and development features: some new module to integrate, some wrong baheviour to be debugged and fixed and so on.

After about 3 month I felt comfortable with the system and adquired the confidence to not just develop and fix code. I tried to improve each module I worked wth. I love to do the things with good practices, and in such a huge system like SIDERA it is always a hard labour to make developers maintain this level of quality, specially if the developer has a project deadline, I know that. But I tried to rename variables to try get them naminful, refactored some method to keep them maintenable and easily testable (for unit testing).

## GENETEC SDK reimplementation
TODO: Continue With Genetec improvement Use Case

## Catenary energization calculation: a recursive DFS approach to solve the problem

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
