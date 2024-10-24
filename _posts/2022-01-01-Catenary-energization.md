---
layout: post
title: Catenary energization algorithm for SIDERA
description: A high performance algorithm using DFS
categories: ['Professional', 'Use case', 'SICE']
tags: ['Performance', 'Innovation', 'Best practices']
os: ['Windows']
languages: ['C++']
technologies: ['Algorithm']
ides: ['Visual Studio']
ddbb: ['SQL Server']
---
## Catenary energization calculation (a recursive DFS approach to solve the problem)
OSC is a windows service that is written using C++ 11 standard to take advantage of the [Smart Pointers](https://en.cppreference.com/book/intro/smart_pointers). The main goal is to real time check the satate of energization of catenary sections along the railway. Following image is a portion of the entire electrical schema to be calculated in this project:

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


