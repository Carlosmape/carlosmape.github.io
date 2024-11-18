---
layout: post
title: LoreEngine
description: My own game engine and my first Python project
categories: ['Personal']
tags: ['Curiosity', 'Proficiency', 'Good practices']
os: ['Linux']
languages: ['Python']
technologies: ['Cross-platform', 'Unit Testing', 'Continuous Integration']
ides: ['Neo-Vim']
---

# Introduction

Some time ago, I decided to dive deeper into **high-level programming languages**. At university, I learned **Ruby** and completed a **NodeJS** course, both of which were enjoyable experiences. However, my thirst for knowledge pushed me to explore more. Many of my colleagues, especially those working in data science, often mentioned the power of **Python**—particularly for processing large amounts of data. That piqued my curiosity, and I thought: _Why not Python?_

I wanted a project that would not only teach me Python but also **challenge me creatively**. The question was, what kind of project should I start? I’ve always been passionate about **video games** and fascinated by how they are built. In university, I was part of a team that created a **roguelike game** in C++ using only a CLI (command-line interface). It was a fun project, but I wanted to push the idea further this time.

Rather than just remaking what I had done before, I thought, why not expand the concept and create something more sophisticated? Python, with its powerful built-in methods and excellent support for **data management**, offered a perfect opportunity to focus on aspects of a game that rely on logic and data—such as **dialog systems**, **character relationships**, and **procedurally generated environments**.

That’s when the idea for **LoreEngine** was born—a game engine not focused on graphics or physics but on **storytelling** and **world-building**. I envisioned an engine that could handle complex **conversational systems**, character **sympathy levels**, **faction diplomacy**, and **procedural map generation**. Essentially, LoreEngine would be a **lore generator**: a tool to generate the living, breathing worlds behind a game.

## First Steps: Learning Python and Project Setup

Before jumping into coding, I followed my typical approach: **research**. I looked into various Python projects, starting with small ones to familiarize myself with Python's syntax and core concepts. This helped me understand:
- **Basic syntax and operations** in Python.
- How to structure a project using **modules**.
- Python's flexible **object-oriented programming** features.

After gaining some initial experience, I started by creating a basic **module** and an executable script that could load the module for testing. The idea was to have a framework I could continuously build upon while experimenting with different components of the engine.

**(TODO: Expand this section further)**

## Building the Core of LoreEngine

LoreEngine is intended to be a **game lore generator**, focusing on various in-game systems that shape the player’s experience. Here's an overview of the core elements I'm working on:

### 1. **Procedural Map Generation**

Instead of manually designing maps, LoreEngine will generate them procedurally. This means that every game will have a unique world layout, based on certain algorithms and rules. The idea is to ensure a dynamic and replayable experience.

### 2. **Conversation System with Sympathy Levels**

One of the key features is the **dialog system**, which goes beyond traditional static conversations. In LoreEngine, characters will have varying levels of **sympathy** toward one another. This means that how characters interact will depend on their past interactions, relationships, and choices the player makes.

For example:
- A player’s response in a conversation could improve or worsen their standing with an NPC (Non-Player Character).
- Sympathy levels could influence the **tone** of conversations, making them more friendly or hostile depending on previous interactions.

### 3. **Character Relationships and Factions**

Characters won’t just exist in isolation; they will belong to **factions** that have their own rules, allies, and enemies. The goal here is to simulate real-world dynamics where relationships matter:
- Characters within a faction may have **internal conflicts** or **alliances**.
- Factions themselves can engage in **diplomatic negotiations**, **wars**, or **trade** agreements with other factions.

The player’s actions could influence faction relationships, adding another layer of depth to the game world.

### 4. **Diplomacy and Politics**

Beyond simple faction systems, LoreEngine will have a **diplomacy system** where NPCs can negotiate, form alliances, or betray one another. This allows for a living world where decisions have long-term consequences:
- Factions could form alliances based on mutual enemies.
- Political moves such as **coups** or **elections** could change the power dynamics in the game world.

### 5. **Story and Event Generation**

One of the most exciting features I’m developing is the **story generation** system. Instead of following a pre-defined narrative, LoreEngine will dynamically create stories based on the player’s interactions with the world. This could lead to:
- Unique **quests** being generated based on current events in the game world.
- NPCs reacting to the player’s choices in unexpected ways, triggering events that shape the game’s story.

In short, LoreEngine aims to generate an evolving world where **every action has a ripple effect**.

## Unit Testing and Code Quality

Since my goal is not only to build a fun and engaging project but also to **learn good coding practices**, I’ve placed a significant emphasis on **code quality** and **testing** from the beginning. Here are some key points:

- **Unit Testing**: I’ve written comprehensive unit tests to ensure that all major components of LoreEngine behave as expected. Currently, the project has **96% code coverage**, ensuring that almost every line of code is tested.
- **Code Style and Quality**: I’ve been following **Python coding standards** and best practices, and the project has a **punctuation of 8.6/10** when evaluated with popular code quality tools. This helps maintain readability and maintainability as the project grows.
- **Continuous Integration (CI)**: I’ve set up **CI workflows** in GitHub, ensuring that every push triggers automated tests and code quality checks. This way, I can catch any potential issues early and keep the project in a stable state.

## Challenges and Thoughts

Working on LoreEngine has been a tremendous learning experience. While Python is an excellent language for rapid development, game engines—even ones focused on logic rather than graphics—are complex. Here are some challenges I’ve faced so far:
- **Modular Design**: Structuring the project into logical components was tricky at first, but I’ve learned a lot about organizing code, making it reusable, and maintaining readability.
- **Performance**: While Python is generally fast enough for the type of engine I’m building, optimizing for large, procedurally generated maps and complex simulations has been a fun challenge.
- **Neo-Vim Mastery**: One of my side goals is to become more proficient with **Neo-Vim**. I use it as my primary IDE for this project, and customizing it with plugins has greatly improved my productivity.

## Conclusion

**LoreEngine** is still in its early stages, but it has already taught me so much about Python, game development, and project management. It’s a passion project that lets me combine my love for video games with my desire to learn new programming skills.

You can follow the project’s development on my [GitHub repository](https://github.com/Carlosmape/LoreEngine).

This project is a testament to the power of curiosity and self-learning. By continuously challenging myself, I’m not only mastering Python but also exploring the vast world of **game design** and **storytelling**. And most importantly, I’m learning how to write **clean, maintainable code** backed by thorough testing and CI practices.

Stay tuned for more updates!

