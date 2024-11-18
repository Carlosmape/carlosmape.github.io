---
layout: post
title: SIDERA's Datawarehouse
description: An use case of proactivity, self-management and continuous learning
categories: ['Professional', 'SICE']
tags: ['Curiosity', 'Proficiency']
os: ['Linux', 'Windows']
languages: ['Python', 'SQL']
technologies: ['Cross-platform', 'Docker', 'Continuous Integration']
ides: ['Neo-Vim']
ddbb: ['PostgreSQL', 'TimescaleDB']
---

# SIDERA's Datawarehouse (technology lead, research, SW analysis)

This is one of the most significant projects I've had the opportunity to lead. It’s a **data warehouse** built for the core product of the company, [SIDERA](/projects/sidera). From **research** to **design**, **implementation**, and ongoing **maintenance**, I managed the entire life cycle of this data warehouse project. This experience pushed me to dig deeper into advanced data management techniques, explore cutting-edge tools, and apply best practices like **SOLID principles** and **Docker** to ensure scalability and maintainability.

## Investigation & Research

Before jumping into the development phase, I focused on **thorough research**. I wanted to understand the core principles of designing a **data warehouse** and the tools that can help in managing vast amounts of data efficiently. This research led me to discover a variety of tools and technologies I hadn’t worked with before, including:

- **TimescaleDB** and **Apache Druid** for specialized database engines that handle large-scale data storage and processing.
- **ETL tools** such as **Apache NiFi** and **Pentaho**, essential for data streaming and integration.
- **BI Reporting tools** like **Grafana**, **Power BI**, and their integration with data sources.

I spent a significant amount of time learning how to apply these tools and technologies effectively, ensuring the solution I built was both reliable and efficient.

## Data Model

I took a careful, methodical approach when designing the data model. The goal was to store **historical data** in an efficient and scalable way, while also ensuring easy integration with **BI tools** for reporting and dashboards.

I decided to store historical data in a **single table** with a flexible schema that could be easily integrated with data visualization tools like **Grafana**. The table consists of the following tuple columns: **timestamp**, **device**, **variable**, and **value**. This format provides a clear structure for time-series data.

For the database engine, I chose **TimescaleDB**, an extension of PostgreSQL that is optimized for time-series data. TimescaleDB allows us to define **hypertables**, which automatically partition data by time, ensuring that even large datasets are handled efficiently. To keep everything organized, I used a **3NF relational schema** for the definition tables, which map device types, devices, and variables. All the tables were optimized with **primary keys (PK)**, **foreign keys (FK)**, and **indexes** to ensure fast query performance.

In addition to the base tables, I created several **views** for ease of querying, including a view that aggregates all the information into a single data table by joining the historical data table with the definition tables. Furthermore, I introduced a **materialized view** to store a cached version of the definition tables, which speeds up queries and ensures data consistency. This materialized view is updated on demand, using **triggers** to refresh data when changes are made to the definition tables. Given that these tables do not change often, the refresh rate is minimal, ensuring optimal performance.

## ETL: Building a Custom Solution

As I explored existing ETL (Extract, Transform, Load) solutions, I realized that the complexities of our needs required a more tailored approach. I decided to build a custom **ETL solution** to connect directly to SIDERA's API and **stream data in real-time**. This custom solution would:

- **Stream data** in real-time from SIDERA’s API into the data warehouse.
- Ensure **coherence in the Datawarehouse** by maintaining the integrity of the definition tables (devices, variables, etc.).
- Store **real-time updates** in the historical data table while ensuring the sync of historical data from SIDERA.

This approach allowed for greater flexibility and customization compared to pre-built solutions, and it aligned with the unique needs of our system.

## Implementation

With all the research and design work in place, I proceeded to build an MVP (Minimum Viable Product) for the system. To test the data import and ETL pipeline, I first exported historical data from SIDERA as **CSV files**, applying necessary transformations to match the data model of the warehouse.

Instead of performing a direct bulk load, I decided to develop a tool that allowed for smoother CSV imports into the PostgreSQL database, ensuring that the data was properly structured and cleaned before being stored. This tool was an excellent way to **polish the code** and ensure that the system was functioning correctly before scaling it further.

Once the data import was successful, I tested the **data stream reader** connected to SIDERA's API. Finally, I turned my attention to integrating the system with **Power BI** and **Grafana** to visualize the data and generate reports.

### Docker Integration

To improve the **scalability** and **portability** of the solution, I decided to introduce **Docker** into the development and deployment process. Using Docker allowed me to:

- Create containerized environments for each component of the data warehouse, making it easier to deploy across different environments.
- Ensure that the solution could be easily scaled in the future by isolating dependencies and keeping the system reproducible.

Docker helped significantly reduce deployment time and ensured consistency across multiple environments, from development to production.

## Deployment and Maintenance

As of now, my primary responsibility is **deploying** the data warehouse across various projects within the company and maintaining its operational health. This involves:

- **Regular updates** and **fixes** to the system based on feedback from stakeholders.
- Continuous optimization of the data warehouse to handle increasing amounts of data.
- **Performance tuning** and **monitoring** to ensure fast query execution times even as the database grows.

It’s immensely gratifying to see the data warehouse integrate seamlessly into the company’s product, providing valuable insights to all stakeholders. It feels like I’ve given birth to something that now supports key operations across multiple teams—truly, a moment of pride.

## Conclusion: Key Skills and Takeaways

Throughout this project, I’ve not only learned a great deal about **data management**, but also about **scalable architecture** and **system design**. Some of the key skills and principles I applied during this project include:

- **SOLID Principles**: Ensuring that the architecture followed the **SOLID principles** was crucial for building a maintainable and extensible system. I applied these principles at every level, from database design to software architecture, ensuring that the solution was both flexible and scalable.
- **Data Management**: I gained extensive hands-on experience with **TimescaleDB** and learned how to optimize queries and manage massive amounts of time-series data. The flexibility of TimescaleDB, coupled with **PostgreSQL's relational capabilities**, allowed for a powerful and efficient data model.
- **Proactivity and Continuous Learning**: From diving into new technologies to designing complex systems from scratch, this project has been a perfect example of how proactive learning and self-management can drive success. Every challenge I faced became an opportunity to **learn** and **grow**.
- **Docker**: By integrating **Docker** into the project, I streamlined the deployment process and made the data warehouse more adaptable to changes. Docker allowed for a consistent, reproducible environment across all stages of development.

This project, without a doubt, reflects my **curiosity** and commitment to continuous learning. It’s been a fulfilling experience that I’m excited to continue building on in the future.
