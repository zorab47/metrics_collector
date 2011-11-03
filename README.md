Metrics Collector
================

Whatever the metric blocks below return creates a new row in the metrics 
table with that value. The whole collection process could be done with a 
single rake task. In addition, there could be a controller to explore and 
graph the metrics.

DSL
---

    metric :disk_usage => :daily do
     system("du -s #{Rails.root}")
    end

    metric :assets => :daily do
      Assets.count
    end

Metrics Table
-------------

Use a simple table within the application to store the metrics. I'd 
like to expand this to use other backends such as [StatsD][] or [RRDTool][].

### DB Table

* id
* name
* value
* datetime

[StatsD]: https://github.com/etsy/statsd
[RRDTool]: http://oss.oetiker.ch/rrdtool/
