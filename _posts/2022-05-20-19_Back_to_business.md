---
layout: post
title: "#19. Back to business"
tags: architecture druid kafka presto storage-engine streaming
---

*Topics: Architecture, Apache Druid, Apache Kafka, Presto, storage engine, streaming*

<!--cut-->

---

[Watermarks in Stream Processing Systems: Semantics and Comparative Analysis of Apache Flink and Google Cloud Dataflow](https://vldb.org/pvldb/vol14/p3135-begoli.pdf) — Tyler Akidau

*A new white paper from Tyler Akidau (author of the very cool book \"Streaming Systems\") where they compare watermarks in different aspects in Google Cloud Dataflow and Apache Flink. Watermarks represent the temporal completeness of an out-of-order data stream. Reasoning about the completeness of infinite streams is one of the most critical challenges faced by stream processing systems. It’s also one of the least understood and least adequately addressed compared to other approaches for dealing with the completeness of unbounded data streams.*

![level:advanced] ![type:whitepaper] ![topic:streaming]

---

[Designing Instagram](http://highscalability.com/blog/2022/1/11/designing-instagram.html) — HighScalability Blog

*Do you want to try to design Instagram with Machine Learning Lead from Amazon? Well, now you can do it.  
This article is follow up to [DE or DIE Meetup #9](https://www.youtube.com/watch?v=brX3AXmXHQA) (in Russian).*

![level:medium] ![topic:architecture]

---

[Powering real-time data analytics with Druid at Twitter](https://blog.twitter.com/engineering/en_us/topics/infrastructure/2022/powering-real-time-data-analytics-with-druid-at-twitter) — Twitter Engineering Blog

*At least, now we know that Druid has out-of-the-box ingestion connectors for Apache Kafka, and it seems that it works great! Just check Twitter streaming architecture.*

![level:medium] ![topic:architecture] ![topic:druid]

---

[Presto on Apache Kafka At Uber Scale](https://eng.uber.com/presto-on-apache-kafka-at-uber-scale/) — User Engineering Blog

*We like Uber engineering posts so much. Because they seem like ADRs: problem, current environment description, alternatives, supposed architecture.*

![level:medium] ![topic:architecture] ![topic:kafka] ![topic:presto]

---

[Replicated Log](https://martinfowler.com/articles/patterns-of-distributed-systems/replicated-log.html) — Unmesh Joshi

*This article helps you to understand what replication looks like. With a lot of details and a lot of code snippets, you can even write your own implementation of the replication log for sure.*

![level:advanced] ![topic:storage-engine]

---

### Upcoming Conferences

- Airflow Summit, May 23-27, https://airflowsummit.org/
- Snowflake Summit, June 13-16, https://www.snowflake.com/summit
- Data and AI Summit, June 27-30, https://databricks.com/dataaisummit/north-america-2022

{% include tags.md %}
