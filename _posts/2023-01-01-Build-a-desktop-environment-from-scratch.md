---
layout: post
title: My Custom Linux Desktop Environment
description: Building a Linux Desktop Environment from scratch for performance and personalization
categories: ['Personal']
tags: ['Curiosity', 'Resilience']
languages: ['Shell Scripting']
os: ['Linux']
ides: ['Neo-Vim']
---

# Why Build a Custom Linux Desktop Environment?

I embarked on this project to build a performance-oriented **Desktop Environment (DE)** for my Linux setup that is tailored to my needs. My goal was to eliminate unnecessary software, strike a balance between resource consumption and visual aesthetics, and, most importantly, learn how Linux manages the various components of a graphical user interface.

This was not just about aesthetics or performance—it was a deep dive into the workings of Linux, giving me control over every element of my desktop experience.

# Research: What is Ricing?

During my initial research, I came across a phenomenon called "**ricing**." This term, popular in Linux communities like Reddit, refers to the customization of your desktop environment, focusing on creating a unique look and optimizing performance. It's often considered a time black-hole for Linux enthusiasts because of the infinite customization possibilities.

In order to build my own DE from scratch, I realized I needed to research and decide on five essential components:
- **Distribution** (Kernel and app repositories)
- **Display Server** (Protocol that manages input/output and rendering)
- **Window Manager** (Controls window layout and decoration)
- **Compositor** (Manages graphical effects like shadows and transparency)
- **Dock** (Taskbar for managing applications)

These components would allow me to create a minimal and highly efficient environment, where I control the system entirely.

## Choosing a Linux Distribution

While most Linux distributions allow you to build a desktop environment from scratch, it is generally recommended to start with a **CLI-only installation**, meaning no pre-installed desktop environment. This gives you a clean slate to build on.

I decided to go with **Manjaro**. Although **Arch Linux** is a more popular choice for such projects, I opted for Manjaro because it provides the **AUR (Arch User Repository)**, which makes software availability and package management easier. Additionally, Manjaro offers a slightly more stable experience than Arch, which uses bleeding-edge (HEAD) versions of software packages. Manjaro struck a good balance between stability and access to the latest software.

## Choosing a Display Server

The display server is the backbone of any graphical environment—it sits between the hardware and the GUI, controlling inputs (like the keyboard, mouse, and touchpad) and managing how graphics are rendered on the screen. It also allows different applications to interact and share screen real estate.

Currently, **X.org** is the most widely used display server and has excellent compatibility with a wide range of software. Although newer alternatives like **Wayland** are gaining ground, I chose to stick with X.org for its reliability and maturity. Wayland shows promise but hasn't reached full integration with certain third-party applications I rely on.

## Picking a Window Manager

The **Window Manager** is responsible for placing, resizing, and closing application windows. Unlike traditional desktop environments that come with full-fledged window managers like GNOME's **Mutter** or KDE's **KWin**, I was after something lightweight and customizable.

Since I’ve been using **NeoVim** for a while, I have grown accustomed to tiling windows, where applications are arranged automatically in a grid, rather than being stacked on top of one another. This made tiling window managers like **i3**, **Awesome**, and **bspwm** stand out to me.

I finally decided on **bspwm (Binary Space Partitioning Window Manager)** due to its minimalism and flexibility. It offers excellent customizability without compromising on performance. With **sxhkd** (a hotkey daemon), I was able to set up custom keybindings to manage window placement efficiently.

## Hands-On: The Ricing Journey

Once I had all the components, it was time for the real work to begin. And by "work," I mean hours upon hours of **trial and error**—breaking things, fixing them, and breaking them again. This process of tweaking configurations, writing scripts, and applying patches to optimize the desktop environment became a hobby in itself.

Here’s a breakdown of what the process entailed:
- **Tiling Configuration**: I spent significant time setting up **bspwm** to tile windows exactly how I wanted, with rules for specific applications and window sizes.
- **Compositor Setup**: I experimented with **picom** for managing graphical effects like transparency and shadows, ensuring that visual flair didn't come at the cost of performance.
- **Custom Scripting**: Shell scripting became essential to automate various aspects of my setup, like launching specific applications in predefined workspaces and configuring multi-monitor setups.
- **Dotfiles Management**: I managed all my configurations (also known as **dotfiles**) through GitHub, making it easy to experiment and revert changes if things went wrong.

It was a long process, spread over months of my free time. Every weekend would involve discovering something new to add, tweak, or remove.

## The Final Result

After months of tweaking, I now have a desktop environment that not only performs well but also looks sleek. It fits my workflow perfectly—minimalistic yet functional, with fast navigation and intuitive shortcuts. 

You can check out the current state of my configuration on my [GitHub repository](https://github.com/Carlosmape/DesktopEnvironment-dotfiles/). This includes my **bspwm** configuration, **sxhkd** keybindings, **picom** settings, and other essential dotfiles.

## Conclusion

Building a custom desktop environment from scratch has been an immensely rewarding experience, providing me with a deeper understanding of Linux internals and how graphical interfaces work. While ricing may be a time-consuming rabbit hole, it’s also a great way to express creativity, learn new skills, and improve your daily workflow.

