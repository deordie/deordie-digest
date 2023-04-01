---
layout: post
title: "#30. Go to Data Engineering"
tags: databases data-thoughts practices spark streaming
---

*Topics: Databases, data thoughts, practices, Apache Spark, streaming*

<!--cut-->

---

[Concurrency is not Parallelism by Rob Pike](https://www.youtube.com/watch?v=oV9rvDllKEg) ([slides](https://go.dev/talks/2012/waza.slide)) — Rob Pike

*Rob Pike is a software engineer, best known for his work on the Go programming language. Quite old but still relevant talk discussing the crucial distinctions between concurrency and parallelism. Such foundational engineering concepts are cross disciplines and I would say must-have knowledge for all engineers.*

![level:medium] ![topic:practices] ![type:video]

---

[Setting Uber’s Transactional Data Lake in Motion with Incremental ETL Using Apache Hudi](https://www.uber.com/en-DE/blog/ubers-lakehouse-architecture/) — Uber Engineering Blog

*As usual, Uber's blog is fantastic resource for new ideas. This fresh article explains how to build streaming ETL framework and how to address some well-known issue on this way.*

![level:medium] ![topic:streaming]

---

[Apache Spark — Job monitoring](https://medium.com/@hareesha1906/apache-spark-job-monitoring-f2332ef50915) — Hareesha Dandamudi

*Short and understandable article about SparkListener. Quite a useful thing for creating monitoring and lineage handling (as OpenLineage does). Just use it as a start for your own articles research :)*

![level:medium] ![topic:spark]

---

[The Question That Every Data Engineer Should Ask](https://medium.com/data-engineer-things/the-question-that-every-data-engineer-should-ask-a70cb6d422e4) — Xinran Waibel @ Data Engineer Things Blog

*Vital and clickbait.*

![level:medium] ![topic:data-thoughts]

---

[Pushdown](https://trino.io/docs/current/optimizer/pushdown.html) — Trino Query optimizer docs

*Pushdown is a powerful query optimization that moves predicates in the WHERE clause closer to the tables they refer to. This is Trino docs, but you can go through all types and find them in other query engines. It can help you in reading query plans a lot.*

![level:advanced] ![topic:databases]

---

{% include tags.md %}
