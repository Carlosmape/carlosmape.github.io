---
layout: post
title: My Desktop Environment
description: Build my linux Desktop Environment from the scratch
categories: ['Personal', 'Project']
tags: ['Curiosity', 'Continuous learning']
languages: ['Shell Scripting']
os: ['Linux']
ides: ['Neo-Vim']
---

# Why?
I wanted to create my own performance-oriented Desktop Environment to simply make me a work environment to fit my needs, without unneeded software, looking for well balanced visual effects and resources consumption. And obviously, learn how Linux manages all this during the process :)

# Research
I was interested in those people that built their own Linux Desktop Environment. I discovered investigation on Reddit that's called "ricing" and considered as a time black-hole among Linux user. The basics are to choose: 
 - Distribution (Kernel and Apps repositories)
 - Display Server (GUI render protocol + Input manager)
 - Window Manager (Window decorator + manager)
 - Compositor (Graphic effects)
 - Dock (Task bar)

## Choose a distro
Basically all distros allows to create a Dektop Environment from scratch it is recommended just to install a CLI flavour (without any Desktop environment pre-installed). I choose **Manjaro** because it package manager includes AUR (Arch User Repository) and is little bit more stable than Arch (that uses all HEAD versions on its repositories) 

## Display Server
A display server is a sort of interface between HW and GUI, controlling inputs (mouse, keyboard, touchpad...) and hoy graphics should be rendered. It also allows application to interact each other. There are several alternatives, but the most used, **X.org** was my choice (until Wayland becomes more reliable and integrated in third part applications)

## Choose a window manager
After being used NeoVim for a while, I felt in love with it tiling windows. This was a decisive factor to limit my search options: Awese i3, bspwm, ...
I finally decided to use **bspwm** for it well balanced customizability-performance.

# Hands on
Ready! Time to spent tons of hours ricing :) literarly, try-error. Fix something, break it after. That were many month of my free time

# Result
The current state of the work could be preview on the [Github reposiory](https://github.com/Carlosmape/DesktopEnvironment-dotfiles/)
