---
layout: post
title: Genetec SDK Integration in SIDERA
description: New features, but improving existing code, always
categories: ['Professional', 'SICE']
tags: ['Best practices', 'Proactivity', 'Problem resolution', 'Proficiency']
os: ['Windows']
languages: ['C++', 'C#']
technologies: ['Networking', 'Unit Testing']
ides: ['Visual Studio']
ddbb: ['SQL Server']
---

# GENETEC SDK
One of my first tasks at [SICE](/career/experience/) was to integrate intrusion access detection systems from the **Genetec SDK** into the [SIDERA](/projects/sidera) platform. My first steps involved formally designing the integration, investigating the SDK, and studying how to incorporate it into our platform. Once the research phase was complete, the development process could begin.

## Development Process
The module for this integration was quite old—one of the first external systems integrated into SIDERA. [Genetec](https://www.genetec.com/) is a comprehensive security software solution, in this case, used for managing and monitoring CCTV cameras. SIDERA, acting as a SCADA system, integrates Genetec’s SDK to synchronize the camera states within its interface.

This module had undergone many changes over time, making the code complex and hard to maintain. The integration relied on a **Genetec SDK wrapper** written in **.NET (C#)**, with a **C++ service** that communicated with SIDERA.

### Challenges in the Legacy Code
The most challenging part was discovering a file containing **3,000 lines of tangled code**. It was a mix of complex Windows system calls and **C#/.NET COM interoperability**, which allowed the C++ service to call .NET methods. However, this approach led to a lot of duplicated code, as each method had to encode and decode parameters between C++ and .NET compatible types.

To improve this, I:
- **Reduced code duplication**: I extracted common logic into reusable functions where possible.
- **Improved maintainability**: Cleaned up scattered SQL queries across multiple files, validated configuration parameters, and made improvements in error handling and system calls.

As a result, I was able to reduce the size of the COM interop class by about **25%**, making the codebase much cleaner.

### New Feature Integration
Once the code cleanup was done, I started the actual device integration. This involved adding new Genetec AIC (Access Intrusion Control) devices, such as numeric keypads, card readers, and intrusion detection sensors.

However, the testing phase hit a snag because we didn't have access to the physical Genetec devices. This delayed the testing and validation process until the devices became available in a test lab months later. During the testing phase, everything worked as expected, but the client requested a **last-minute change**: instead of **polling** for device states, we needed to implement a **subscription-based** model to handle real-time state changes—a critical requirement for security systems.

## Approach Change: Real-Time Event Subscription
At this point, I had to shift my approach. While COM interoperability technically allows for event subscription, it does so in a non-intuitive, redundant manner. Since we had enough time to complete the integration, I decided to eliminate COM entirely and switch to using the **C++/CLR compatibility layer**.

This new approach:
- Simplified type handling.
- Improved code **readability** and **maintainability**.
- Allowed for **event-driven communication** in a cleaner and more robust way.

I kept the old **polling approach** as well, to maintain compatibility with other projects, even though both approaches could coexist.

## Integration Challenges
The real challenge came when I tried to merge my new module into the main branch. There were significant changes made by other developers for an ongoing project that relied on the old codebase. These changes included new COM calls and an event subscription system to retrieve updates from the Genetec server. After discussing with the project managers, I realized these changes could be implemented within my new approach. So, I proceeded to replace the entire old module with my improved version.

However, the other project's manager raised concerns. The project was in an advanced stage, having already passed FAT (Factory Acceptance Testing) and was preparing for SAT (Site Acceptance Testing). Due to tight deadlines, they requested that I **revert all my changes** and continue using the old module for the sake of project stability.

## Problem Resolution: Advocating for Code Quality
To resolve this conflict, I arranged several meetings with both product and project managers. I also wrote a **technical document** detailing the improvements brought by my changes, explaining how they would benefit the platform in the long run.

The product managers were on board with my approach, recognizing the long-term benefits of improved code quality and maintainability. However, the project managers were understandably focused on meeting their deadlines and avoiding disruptions that could increase testing and validation efforts.

In the end, we reached a compromise:
- I would merge my changes into a **new version of the module**.
- Future projects would use the improved version, while the old version would remain intact until the critical project was completed.
- Once that project was delivered, we would deprecate the old codebase and fully transition to the new, cleaner module.

## Conclusion
This experience reinforced the importance of **balancing code quality with project deadlines**. By being proactive and demonstrating the long-term value of my changes, I was able to introduce significant improvements without jeopardizing ongoing projects. This case also highlighted the importance of clear communication and compromise in collaborative development environments.

