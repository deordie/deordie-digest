---
layout: post
title: "#9. Goddess blessing"
tags: architecture benchmark docker hadoop spark tooling
---

*Topics: Architecture, benchmark, Docker, Apache Hadoop, Apache Spark, tooling.*

<!--cut-->

---

[Containerizing Apache Hadoop Infrastructure at Uber](https://eng.uber.com/hadoop-container-blog/) — Uber Engineering.

*Detailed technical article about re-architecting Uber's Hadoop deployment stack for 21000+ hosts. Cluster management, docker containers, configs, and many more.*

![level:advanced] ![topic:docker] ![topic:hadoop]

---

[Higher-Order Functions with Spark 3.1](https://towardsdatascience.com/higher-order-functions-with-spark-3-1-7c6cf591beaa) — David Vrba @ Towards Data Science Blog.

*New functions for manipulating with arrays have been released. Check maybe you can forget about UDF.*

![level:medium] ![topic:spark]

---

[Data Movement in Netflix Studio via Data Mesh](https://netflixtechblog.com/data-movement-in-netflix-studio-via-data-mesh-3fddcceb1059) — Netflix Technology Blog.

*New interesting article about Netflix platform. How to combine not quite that Data Mesh, CDC, schema evolution, data enrichment and data quality? Read the article.*

![level:medium] ![topic:architecture]

---

How Airbnb Achieved Metric Consistency at Scale [Part I](https://medium.com/airbnb-engineering/how-airbnb-achieved-metric-consistency-at-scale-f23cc53dea70), [Part II](https://medium.com/airbnb-engineering/airbnb-metric-computation-with-minerva-part-2-9afe6695b486) — The Airbnb Tech Blog.

*Do you have data marts in your DWH? How to build a clear single source of truth for business metrics? How to make them resistant to changes? How to validate and orchestrate data marts jobs? Let's read about Minerva — Airbnb's metric platform that covers the full life cycle of a metric.*

![level:medium] ![topic:architecture]

---

[Database-like ops benchmark](https://h2oai.github.io/db-benchmark/) — H2O.ai.

*Benchmark of several databases on simple operations on various amounts of data.*

Thanks to [@SimonOsipov](https://twitter.com/OsipovSimon) for this topic.

![level:medium] ![topic:benchmark] ![topic:tooling]

<!--tags-->

[level:medium]: https://img.shields.io/badge/level-medium-blue
[level:advanced]: https://img.shields.io/badge/level-advanced-blue

[topic:architecture]: https://img.shields.io/badge/topic-architecture-260C3B
[topic:benchmark]: https://img.shields.io/badge/topic-benchmark-073151
[topic:docker]: https://img.shields.io/badge/topic-docker-2A4E17
[topic:hadoop]: https://img.shields.io/badge/topic-hadoop-C2685F
[topic:spark]: https://img.shields.io/badge/topic-spark-6157A8
[topic:tooling]: https://img.shields.io/badge/topic-tooling-F3A385
