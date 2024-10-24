---
layout: post
title: SIDERA's Datawarehouse
description: An use case of proactivity, self-management and continous learning
tags: ['Investigation', 'Curiosity', 'Continuous learning']
categories: ['SICE', 'Professional project']
os: ['Linux']
languages: ['Python', 'SQL']
technologies: ['Cross-platform', 'Docker', 'TimescaleDB']
ides: ['Neo-Vim']
---

# SIDERA's Datawarehouse (technology lead, research, SW analysis)
This is the last project I'd take part of. This is a data warehouse designed for the main company's product [SIDERA](./sidera). I did a lot of research about how data warehouses are designed, their use cases and related tools (that I did not know until the moment): DB engines specialized for large data storing and processing such as TimescaleDB, Apache Druid... ETL tools for data streaming such as Apache NiFi, Pentaho and so on. Reporting BI tools such as Graphana, Power BI etc.

## Data model
Talking about the Data Model, I decided to store the historical data in a unique table (with **timestamp - device - variable - value** tuple columns) powered from behing with [TimescaleDB](https://www.timescale.com/). That model is flexible and very friendly to integrate with dashboard/reporting/BI tools like Graphana. This PostgreSQL allow to define hypertables (automatically time patitioned) that are designed to lead with hughe amount of data. For model's "definition tables", I decided to use relational tables in 3FN, to maintain device types - devices - variables relationship. All of these tables are propertly configured using PK, FK and indexes. Historical table, as I said, configured as an TimescaleDB hypertable (and indexed by timestamp, device and variable).

I defined several views such as one that allows to take all the information in one unique datatable (joining definition tables with historical one). I also designed a Materialized View of the definition tables, this materialized view has an advantage: the data is stored in DB engine's cache, such a temporary table or similar. This materialized view just refresh its content on demand, because of that, I decided to create triggers for CUD operations over definition tables that will update the materialized view (taking into account that devices, device types or variables does not change very often, so these function just will be trigger often when the definition tables are filling, in a long term, materialized view wont refreshing often)

## ETL
For technical and complexity reasons. My final decisition was to built an own development solution for ETL. This will conect to SIDERA's API and listen in-real-time data streaming. Maintaining coherence in the Datawarehouse's definition tables when needed (I mean to create devices, variables or device types when it could be needed) and finally storing these real time changes in the historical table. On the other hand a method to ensure all SCADA historical data is synchronized with the Datawarehouse.

## Implementation
After reseach done and designed the properly solution, I made a first MVP. In order to do a little PoC, I exported SIDERA's historical data as CSV files applying needed transformations to match Datawarehouse's data model. To import these files I decided to adapt the project and add this capability instead of perform a bulk load directly from PostgreSQL. In fact, this tool allowed me to polish the code. Once the importation was finished, I decided to test the data stream reader from SIDERA API. Finally, it was turn to try some end applications such as mentioned before. Concretely PowerBI and Graphana.

### Deployment and maintenance
This is one of my most important task in the company right now. I am currently deployin the Datawarehouse in several projects and making fix and improvements in the code. Feeling like a Father, I am very proud of took a part of the Company main product.
