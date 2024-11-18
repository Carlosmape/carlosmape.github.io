---
layout: post
title: Catenary Energization Algorithm for SIDERA
description: A high-performance algorithm using DFS
categories: ['Professional', 'SICE']
tags: ['Performance', 'Curiosity', 'Best practices']
os: ['Windows']
languages: ['C++']
technologies: ['Algorithm']
ides: ['Visual Studio']
ddbb: ['SQL Server']
---

# Catenary Energization Calculation (A Recursive DFS Approach)
The **OSC** (Overhead Catenary System) is a Windows service written in **C++11**, leveraging [smart pointers](https://en.cppreference.com/book/intro/smart_pointers) for memory management and high performance. Its main goal is to monitor the real-time **energization status** of catenary sections along the railway, ensuring operational safety.

Below is a portion of the electrical schema calculated in this project:

![OSC Schema](/assets/img/SIDERA_OCS_Schema.png)

## Problem Scope
To solve the problem of determining whether a catenary section is energized, three key components (referred to as "nodes") are involved:
- **Feeders**: Power sources that also act as disconnector switches.
- **Disconnectors**: Electrical switches controlling the flow of current.
- **Catenary Sections**: The overhead wires supplying power to trains.

Each of these nodes can be in one of three **energization states**:
- **Energized**: Receiving and potentially propagating electrical current.
- **De-energized**: Not receiving any electrical current.
- **Mismatch**: Indeterminate status due to incomplete or unknown information.

For feeders and disconnectors, there are also **switch states**:
- **Opened**: Prevents the flow of electricity.
- **Closed**: Allows the flow of electricity (if the node is energized).
- **Mismatch**: Unknown switch state, treated as closed for safety reasons (assuming the worst-case scenario).

## Proposed Solution
The algorithm calculates the energization status of each node using a **Depth-First Search (DFS) algorithm**, recursively exploring neighboring nodes until a base condition is met. The goal is to propagate the status of a node (energized or not) by determining the status of its adjacent nodes.

- For **feeders**, the algorithm checks voltage and current values against predefined thresholds.
- For **other nodes**, the algorithm checks the nearest feeder. If the feeder is energized and the disconnector between the nodes is closed, the current node is also energized.

If an adjacent node's status is unknown, the algorithm repeats the process for the adjacent node recursively until it either finds a node with a known status or determines that the node is not energized.

## Recursive DFS Implementation
To achieve optimal performance and maintain real-time responsiveness, the algorithm uses **recursion**.

### Base Conditions (Stopping Recursion)
The recursion halts when one of the following base conditions is met:

1. **Node is already calculated**:
   - If energized, propagate this status back up the recursion chain (**base case**).
   - If de-energized, continue checking other adjacent nodes to ensure none are energized (**recursive call**).

2. **Node is not yet calculated**:
   - Recursively check adjacent nodes until a known status is found or all nodes are confirmed de-energized (**recursive call**).

### Debugging the Recursive Algorithm
Debugging a recursive algorithm can be challenging, especially when the base case is not always straightforward. To ensure the algorithm terminated correctly in all scenarios, I implemented tracing during the debugging process.

Below is a snapshot from one of the trace logs used to validate the algorithm's behavior:

![OCS trace](/assets/img/SIDERA_OCS_Debug_trace.jpg)

## Performance Analysis
The algorithm's worst performance occurs during the **initial execution**, as it must traverse all nodes. However, in subsequent executions, many nodes will already have known statuses, allowing the recursion depth to be significantly reduced.

Additionally, the algorithm is designed to **react to real-time status changes** in the SCADA system. For instance, if a disconnector changes its switch state, the algorithm recalculates the status of the adjacent nodes, ensuring the system remains up-to-date without requiring a full re-calculation.

## Conclusion
By utilizing the recursive DFS approach, we ensure an efficient, real-time calculation of the catenary energization status while maintaining system safety. The use of **C++11 smart pointers** improves memory management, and the system’s performance optimizes over time as nodes are pre-calculated, reducing the need for deep recursive calls.

