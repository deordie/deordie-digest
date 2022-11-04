---
layout: post
title: "#26. Pandora's box"
tags: architecture athena aws data-modeling docker git kafka storage storage-engine
---

*Topics: Architecture, Amazon Athena, AWS, data modeling, Docker, Git, Apache Kafka, storage, storage engine*

<!--cut-->

---

[Incremental Cooperative Rebalancing in Apache Kafka: Why Stop the World When You Can Change It?](https://www.confluent.io/blog/incremental-cooperative-rebalancing-in-kafka/) — Konstantine Karantasis @ Confluent Blog.

*Kafka rebalancing again. What is the difference between eager and incremental cooperative rebalancing protocol? What are the problems which had to implement a new one?  How is it works on high-level abstraction?\
Additionally, you can go through [KIP](https://cwiki.apache.org/confluence/display/KAFKA/KIP-415%3A+Incremental+Cooperative+Rebalancing+in+Kafka+Connect) to understand the problem even deeper.*

![level:medium] ![topic:kafka]

---

__Git’s database internals__ — Derrick Stolee @ GitHub Blog.

1. [Packed object store](https://github.blog/2022-08-29-gits-database-internals-i-packed-object-store/)
2. [Commit history queries](https://github.blog/2022-08-30-gits-database-internals-ii-commit-history-queries/)
3. [File history queries](https://github.blog/2022-08-31-gits-database-internals-iii-file-history-queries/)
4. [Distributed synchronization](https://github.blog/2022-09-01-gits-database-internals-iv-distributed-synchronization/)
5. [Scalability](https://github.blog/2022-09-02-gits-database-internals-v-scalability)

*5 part series to look at Git's internals from the perspective of a database.*

![level:advanced] ![topic:architecture] ![topic:git] ![topic:storage]

---

[Improve federated queries with predicate pushdown in Amazon Athena](https://aws.amazon.com/ru/blogs/big-data/improve-federated-queries-with-predicate-pushdown-in-amazon-athena/) — AWS Big Data Blog

*Let's talk about query optimization in Athena, especially about predicate pushdown under different databases.*

![level:medium] ![topic:athena] ![topic:aws] ![topic:docker] ![topic:storage-engine]

---

[Mussel — Airbnb’s Key-Value Store for Derived Data](https://medium.com/airbnb-engineering/mussel-airbnbs-key-value-store-for-derived-data-406b9fa1b296) — The Airbnb Tech Blog

*It's AirBnb time to make their own database. Meet persistent, high availability and low latency key-value storage engine for accessing derived data from offline and streaming events.*

![level:medium] ![topic:storage-engine]

---

[Behind the Hype: Should you ever build a Data Vault in a Lakehouse?](https://www.youtube.com/watch?v=RNMoWnSWcTo&ab_channel=AdvancingAnalytics) — 
Simon Whiteley @ Advancing Analytics Channel

*The most expressive talk about Data Vault. And yes, we definitely like Simon :)*

![level:medium] ![topic:data-modeling] ![type:video]

---

{% include tags.md %}
