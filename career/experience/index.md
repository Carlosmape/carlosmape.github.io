---
layout: default
title: Experience
description: Here you have my work experience summary
technologies: ['Networks', 'Algorithms', 'Critical/Real-Time Systems', 'Kinematics', 'SCADA']
os: ['Linux', 'Windows']
languages: ['C++', 'Python', 'C#', 'Shell Scripting', 'JavaScript']
ides: ['Neo-Vim', 'Visual Studio', 'Eclipse']
ddbb: ['SQL Server', 'PostgreSQL', 'TimescaleDB']
---

# Tech Lead, Software Engineer  
## SICE <span class="date">2021/Now</span>
<div class="skills">
    <div class="skill-card backgrounded">ITS</div>
    <div class="skill-card backgrounded">SCADA</div>
    <div class="skill-card backgrounded">C++</div>
    <div class="skill-card backgrounded">C# .NET</div>
    <div class="skill-card backgrounded">SQL</div>
    <div class="skill-card backgrounded">Python</div>
    <div class="skill-card backgrounded">Sockets</div>
    <div class="skill-card backgrounded">Multi-threading</div>
    <div class="skill-card backgrounded">Windows Services</div>
    <div class="skill-card backgrounded">Visual Studio</div>
    <div class="skill-card backgrounded">Neo-Vim</div>
</div>
At [SICE](https://www.sice.com/), I started as a **Software Engineer** specializing in **critical/real-time systems** and **low-level programming**, particularly in the development and maintenance of the SCADA system **SIDERA**. My main responsibilities included developing and maintaining C++ and C# .NET modules that communicate through **sockets** and process data from SQL-based databases.

I was involved in multiple modules, including **OCS** (a recursive **DFS algorithm** for calculating the energization status of railway catenary sections) and **SIDERA’s integration** with external data providers and consumers.  
**Used technology: C++, C# .NET Framework, SQL, Python, Batch-scripting, Multi-threading, Sockets, Windows Services, Visual Studio**

As a **Software Analyst**, I coordinated back-end developments and collaborated with various departments (e.g., front-end, traffic engineering, AI, and machine learning). I was responsible for customer meetings, documentation (system architecture, test cases), and ensuring project requirements were met.

## Remarkable projects and use cases
<div class="posts">
    {% for usecase in site.categories['SICE'] %}
        {% include post-card.html %}
    {% endfor %}
</div>

<hr>

# Software Engineer  
## GMV <span class="date">2019/2021</span>
<div class="skills">
    <div class="skill-card backgrounded">ITS</div>
    <div class="skill-card backgrounded">Defense</div>
    <div class="skill-card backgrounded">C++</div>
    <div class="skill-card backgrounded">Python</div>
    <div class="skill-card backgrounded">Cross-platform Compilation</div>
    <div class="skill-card backgrounded">Linux Daemons</div>
    <div class="skill-card backgrounded">Multi-threading</div>
    <div class="skill-card backgrounded">Oscilloscope</div>
    <div class="skill-card backgrounded">Eclipse</div>
    <div class="skill-card backgrounded">SQL</div>
</div>
At [GMV](https://www.gmv.com/), I worked as a **Software Developer** and collaborated on several key projects. My first project involved developing an **electrical and mechanical subway simulator** for **Madrid's Metro**, applying complex **kinematic** and **electrical calculations** to model minimum train frequencies and other physical calculations.  
**Used technology: C# .NET Framework, SQL, Multi-threading, Sockets, Windows Services, Visual Studio**

In my second project, I worked on [SENDA](https://www.gmv.com/en-es/products/defense-and-security/senda), a **positioning system** for the Spanish army's new ship. I first contributed to the **Testing Team** (using **Google Test** and **PyTest**) and later took on a larger role by handling the **data recording system** for **INS, GPS, Galileo PRS**, and other positioning devices. I focused on **low-level decoding** of device messages and maintained **critical/real-time system** practices.  
**Used technology: C++, Python, Bash-scripting, Cross-platform compilers (Make/CMake), Linux Daemons, Eclipse, Oscilloscope**

## Remarkable projects and use cases
<div class="posts">
    {% for usecase in site.categories['GMV'] %}
        {% include post-card.html %}
    {% endfor %}
</div>

<hr>

# Software Engineer  
## InfoGestión <span class="date">2017/2019</span>
<div class="skills">
    <div class="skill-card backgrounded">CMMS</div>
    <div class="skill-card backgrounded">ERP</div>
    <div class="skill-card backgrounded">C# .NET</div>
    <div class="skill-card backgrounded">SQL</div>
    <div class="skill-card backgrounded">ASP.NET</div>
    <div class="skill-card backgrounded">JavaScript</div>
    <div class="skill-card backgrounded">HTML5</div>
    <div class="skill-card backgrounded">CSS3</div>
    <div class="skill-card backgrounded">Windows Services</div>
    <div class="skill-card backgrounded">IIS</div>
</div>
At [InfoGestión SLU](https://www.infogestionslu.com/), I started my career as a **Full Stack Software Engineer**. I primarily worked on **SAGE 50** plugins to meet specific client needs, providing me with a full understanding of the **software product life-cycle**.  
**Used technology: C# .NET Framework, SQL**

In addition, I developed .NET desktop applications related to ERP systems, where I worked on **multithreading**, **Windows services**, and **SQL query optimizations**. I also contributed to client interactions, translating their needs into software requirements.  
**Used technology: C# .NET Framework, Windows Services, SQL**

Furthermore, I assisted in maintaining **Nadilux**, a **CMMS** system written in **ASP.NET**, and worked on terminals connected to **Bluetooth printers** and customer information systems.  
**Used technology: ASP.NET, JavaScript, CSS3, HTML5, IIS, SQL**

## Remarkable projects and use cases
<div class="posts">
    {% for post in site.categories['Infogestión'] %}
        {% include post-card.html %}
    {% endfor %}
</div>

