---
layout: post
title: "#3. Architecural one"
tags: architecture debezium flink kafka late-arriving-data streaming
---

*Topics: architecture, Debezium, Apache Flink, Apache Kafka, late arriving data, streaming.*

<!--cut-->

---

[Evolution to the Data Lakehouse](https://databricks.com/blog/2021/05/19/evolution-to-the-data-lakehouse.html) — Bill Inmon, Mary Levins @ Databricks Blog.

*The history of the evolution of data warehouses into data lakes and further into data lakehouses. Pros and cons of these approaches.*

![level:medium] ![topic:architecture]

---

[You Can Replace Kafka with a Database](https://towardsdatascience.com/you-can-replace-kafka-with-a-database-39e13b610b63) — Emil Koutanov @ Towards Data Science (Medium).

*Kafka is the new gold. What if you don't like it and want to replace it? Of course, there are options like Apache Pulsar, but… is it possible to replace Apache Kafka with relational DB? Looks like the answer is "yes". Now it's your turn to decide if you need it.*

![level:medium] ![topic:architecture] ![topic:kafka]

---

[Designing a Production-Ready Kappa Architecture for Timely Data Stream Processing](https://eng.uber.com/kappa-architecture-data-stream-processing/) — Amey Chaugule @ Uber Engineering Blog.

*Out-of-order data is a big problem that can be mitigated, but it should be totally resolved in some cases. Usually, it is resolved by using lambda architecture. Uber proposes their approach how to handle this problem in kappa architecture.*

![level:advanced] ![topic:architecture] ![topic:late-arriving-data]

---

[Change Data Capture with Flink SQL and Debezium](https://noti.st/morsapaes/liQzgs/change-data-capture-with-flink-sql-and-debezium#sEX2KHv) — Marta Paes @ DataEngBytes.

*Good overview of Flink, Debezium and how they can work together.*

![level:medium] ![type:video] ![topic:debezium] ![topic:flink] ![topic:streaming]

---

[Composable Data Processing with Apache Spark](https://databricks.com/session_na20/composable-data-processing-with-apache-spark) — Dilip Biswal, Shone Sadler @ Data & AI Summit.

*Use it for single data pipeline architecture ideas. Data parsing, validation, quarantining. Much attention is paid to error handling. With great examples.*

![level:medium] ![type:video] ![topic:architecture]

<!--tags-->

[level:medium]: https://img.shields.io/badge/level-medium-blue
[level:advanced]: https://img.shields.io/badge/level-advanced-blue

[type:video]: https://img.shields.io/badge/type-video-c21bc6

[topic:architecture]: https://img.shields.io/badge/topic-architecture-260C3B
[topic:debezium]: https://img.shields.io/badge/topic-debezium-C2E0C6
[topic:flink]: https://img.shields.io/badge/topic-flink-714A49
[topic:kafka]: https://img.shields.io/badge/topic-kafka-CB9EB8
[topic:late-arriving-data]: https://img.shields.io/badge/topic-late--arriving--data-blueviolet
[topic:streaming]: https://img.shields.io/badge/topic-streaming-F15A02
