---
layout: post
title: "#7. Late arriving digest"
tags: architecture aws data-quality deltalake glue hudi iceberg kafka pipelines storage
---

*Topics: Architecture, AWS, Delta Lake, AWS Glue, Apache Hudi, Apache Iceberg, Apache Kafka, pipelines, storage.*

<!--cut-->

---

[Apache Kafka Rebalance Protocol, or the magic behind your streams applications](https://medium.com/streamthoughts/apache-kafka-rebalance-protocol-or-the-magic-behind-your-streams-applications-e94baf68e4f2) — Florian Hussonnois @ StreamThoughts.

*If you would like to know a little bit deeper about the foundation of the Apache Kafka consumption mechanism, this is an excellent article for this. Personally, I didn't understand clearly tons of "rebalancing" log entries till reading this article.*

![level:advanced] ![topic:kafka]

---

[How we deal with Data Quality using Circuit Breakers](https://medium.com/wrong-ml/taming-data-quality-with-circuit-breakers-dbe550d3ca78) — Sandeep Uttamchandani @ Wrong AI.

*This is an interesting way to use circuit breaker patterns inside the pipeline processes to prevent low-quality data from propagating to downstream processes.*

![level:advanced] ![topic:data-quality] ![topic:pipelines]

---

[Hudi, Iceberg and Delta Lake: Data Lake Table Formats Compared](https://lakefs.io/hudi-iceberg-and-delta-lake-data-lake-table-formats-compared/) — Oz Katz @ lakeFS blog.

*Non-immutable formats are the new trend of data storage. Hudi, Iceberg, Delta Lake… which suits your needs better? Check out this article by [@lakeFS](https://twitter.com/lakeFS) and choose wisely!*

![level:medium] ![topic:deltalake] ![topic:hudi] ![topic:iceberg] ![topic:storage]

---

[Design a data mesh architecture using AWS Lake Formation and AWS Glue](https://aws.amazon.com/blogs/big-data/design-a-data-mesh-architecture-using-aws-lake-formation-and-aws-glue/) — AWS Big Data Blog.

*What is a data mesh? How to implement it? An AWS implementation of data architecture for data mesh.*

![level:medium] ![topic:architecture] ![topic:aws] ![topic:glue]

---

[4 Layers of a Modern Data Pipeline](https://thomaskane.io/4-layers-of-a-modern-data-pipeline) — Thomas Kane.

*It's a short, but comprehensive post, which describes the author's take on how modern pipelines are built and what they consist of (AWS stack and Open Source alternatives).*

![level:medium] ![topic:architecture] ![topic:aws]

<!--tags-->

[level:medium]: https://img.shields.io/badge/level-medium-blue
[level:advanced]: https://img.shields.io/badge/level-advanced-blue

[topic:architecture]: https://img.shields.io/badge/topic-architecture-260C3B
[topic:aws]: https://img.shields.io/badge/topic-aws-D93F0B
[topic:data-quality]: https://img.shields.io/badge/topic-data--quality-D0E708
[topic:deltalake]: https://img.shields.io/badge/topic-deltalake-E47F10
[topic:glue]: https://img.shields.io/badge/topic-glue-8E9D01
[topic:hudi]: https://img.shields.io/badge/topic-hudi-532D33
[topic:iceberg]: https://img.shields.io/badge/topic-iceberg-7234C5
[topic:kafka]: https://img.shields.io/badge/topic-kafka-CB9EB8
[topic:pipelines]: https://img.shields.io/badge/topic-pipelines-92A87F
[topic:storage]: https://img.shields.io/badge/topic-storage-F51F63
