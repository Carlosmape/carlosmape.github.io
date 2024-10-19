---
layout: default
title: Experience
description: Here you have my work experience summary
---

## SICE (ITS) <span class="date">2021/Now</span>
### C++ Software engineer
I work for an end client [SICE](https://www.sice.com/) as a **Software Engineer**. About what I was expecting for this role, was mainly to change the defense sector, however I was looking for keep in the sames technologies and practices I did in my last work: **critical/real-time systems and low level programming**. And keep adquiring business Knowledge and improvin all my tech and soft skills.

My labour in SICE as a **software developer** is to maintain an SCADA (called [SIDERA](https://www.sice.com/en/video/sidera-general-overview)) written mostly in C++ but with some C# .NET Framework modules that communicates each other using sockets and consumes information from the system throw SQL-like DDBB in the firsts spteps of the software engineer life-cycle. I participate in multiple SIDERA's modules such as OCS (a recursive DFS algirthm to calculate energization status of railway catenary sections), SIDERA integration with external data providers/consumers etc.  
**Used technology: C++, C# .NET Framework, SQL, Python, Batch-scripting, Multi-threading, Sockets, Windows Services, Visual Studio**

Adittionally I took the role of **software analyst** in the product's back-end, to help my project manager to coordinate projects and developments with other departments such as front-end, traffic engineering (data-scientist, AI and machine learning departments), design technical solutions and facilite developers labour. In this role I took care of leading with costumer meetings, coorginating back-end developments and doing documentation tasks such as System Architecture designing, tasks supervisions, Test Cases desiging and supervising compliance of the project's requirements. 

### Remarkable projects and use cases
<div class="posts">
    {% for post in site.categories['SICE'] %}
        {% include post-card.html %}
    {% endfor %}
</div>


## GMV (ITS, defense) <span class="date">2019/2021</span>
### C++ Software engineer
This was my second work experience. When I applied to [GMV](https://www.gmv.com/), I was looking for a larger company to previous one, to try join in a bigger software team where I could learn some software engineering practices, such as development methodologies, participate in code revisions, meetings and so on.

In my first project as **software developer**, I worked for Madrid's Metro: an electrical/mechanical subway simulator, I applied kinematics and electrical calculations, minimum train frequency in a line etc. And another physical complex calculations.
**Used technology: C# .NET Framework, SQL, Multi-threading, Sockets, Windows Services, Visual Studio**

My second project in the company was [SENDA](https://www.gmv.com/en-es/products/defense-and-security/senda), a positioning system for a spanish army new ship. Without going into much detail, I firstrly participated in the Testing Team (Google Test, PyTest), once created first tests suite version, the project's manager, lead me to took care of an entire recording system, to record different positioning device's raw data in order to generate a testing bench for my aeronautical team mates, who were developing the advanced positioning algorithms. I worked in a fork of the original code (C++), within crytical/real time system practices, I integrated INS, GPS, Galileo PRS and other devices, with low level decoding of these device's messages. 
**Used technology: C++, Python, Bash-scripting, Cross-platform compilers (Make/CMake), Linux Daemons, Eclipse, Oscilloscope**

### Remarkable projects and use cases
<div class="posts">
    {% for post in site.categories['GMV'] %}
        {% include post-card.html %}
    {% endfor %}
</div>

## InfoGestión (business management software) <span class="date">2017/2019</span>
### C++ Software Engineer
This was my very first work experience. Just recently finished my Informatics Degree, I was lookng for a little company, to learn the basics of a business and where I could develop some applications that could be used by someone. Then I joined to [Infogestión SLU](https://www.infogestionslu.com/)

In this company I worked as **Full Stack Software Engineer** learning all the software product lyfe-cycle. As a [SAGE's](https://www.sage.com/) partner I mainly development of some SAGE 50 plugins adjusting to the needs of our costumers. 
**Used technology: C# .NET Framework, SQL**

Secondly I designed and implemented another .NET desktop applications related to that ERP where I could practice with multithreading, window services and SQL queries optimizations.In both tasks I learned to lead with costumers trying to traduce their needs to software requirements.   
**Used technology: C# .NET Framework, Windows Services, SQL**

In the background I helped to maintain an own product, a CMMS (Computerized Maintenance Management Sofware) called [Nadilux](https://www.nadilux.com/) written in ASP/NET. I could work with customer information terminals and bluetooth printers.  
**Used technology: ASP/NET, JS, CSS3, HTML5, IIS, SQL**

### Remarkable projects and use cases
<div class="posts">
    {% for post in site.categories['Infogestión'] %}
        {% include post-card.html %}
    {% endfor %}
</div>
