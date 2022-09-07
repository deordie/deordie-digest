---
layout: post
title: "#5. Big data with a toy database"
tags: analytics data-quality debezium kafka late-arriving-data spark streaming sqlite
---

*Topics: Analytics, data quality, Debezium, Apache Kafka, late arriving data, Apache Spark, streaming, SQLite.*

<!--cut-->

---

[Data Quality Roadmap Part I](https://medium.com/wriketechclub/data-quality-roadmap-part-i-61332d5be7a) and [Data Quality Roadmap Part II](https://medium.com/wriketechclub/data-quality-roadmap-part-ii-case-studies-614e85906178) — Alexander Eliseev @ Medium.

*Contrary to what we used to do — just building tests and metering time, folks from Wrike are creating the comprehensive matrix of what data quality is, how to achieve this quality and how to measure it. More than that, they’re discussing what could go wrong without these metrics! (Anything, of course).*

![level:medium] ![topic:data-quality]

---

[Error Handling Patterns for Apache Kafka Applications](https://www.confluent.io/blog/error-handling-patterns-in-kafka/) — Gerardo Villeda @ Confluent Blog.

*Do you somehow handle error messages from Kafka? Do you know the best practices? This is a great article about typical approaches to handling error messages. With our favorite confluent pictures!*

![level:medium] ![topic:kafka]

---

[Event-time Aggregation and Watermarking in Apache Spark’s Structured Streaming](https://databricks.com/blog/2017/05/08/event-time-aggregation-watermarking-apache-sparks-structured-streaming.html) — Tathagata Das @ Databricks Blog.

*If you use Spark Streaming and are interested in handling late-arriving data, this article gives you a practical approach to which windows strategy use and how watermark can help you.*

![level:medium] ![topic:streaming] ![topic:spark] ![topic:late-arriving-data]

---

[A Visual Introduction to Debezium](https://medium.com/event-driven-utopia/a-visual-introduction-to-debezium-32563e23c6b8) — Dunith Dhanushka @ Medium.

*If you are not using Debezium yet but want to start to do it, read this article or just look at the pictures :)*

![level:beginner] ![topic:debezium]

---

[SQLite is not a toy database](https://antonz.org/sqlite-is-not-a-toy-database/) — Anton Zhiyanov.

*Are you surprised? Did you know you can explore CSV with SQLite? Load JSONs and CSVs, call analytical functions, and even define UDFs? It’s the real analytical engine, not a toy DB.*

![level:medium] ![topic:sqlite] ![topic:analytics]

---

{% include tags.md %}
