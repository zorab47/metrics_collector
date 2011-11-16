# Metrics Collector

Metrics Collector is a lightweight method of defining application metrics
to aid in product decisions. And those metrics are integrated directly 
into your application. It allows you to answer questions like:

* How fast is my application growing (number of user sign-ups)? 
* Is this feature actually being used?

Defining those custom metrics is done by adding metric blocks to your 
application classes.

    metric :users do
      User.count
    end

Your custom metrics are stored in a backend you define, such as an ActiveRecord
model or another cool method of persisting data. Making snapshots of your
metrics help you keep an accurate measure. For example, if a users deletes
his account within your application and along with it all his dependent 
records, any calculated metrics will be incorrect.

Currently, the metrics are assumed to be collected daily other time periods
will be considered later.

In the future, it will come with a Sinatra application to explore and graph
those metrics using the [Google Charts API][GoogleCharts].

## Defining Metrics

    class Image
      metric :disk_usage do
       %x[du -s "#{Rails.root}/assets/images" | cut -f 1].chomp
      end

      metric :images do
        Image.count
      end
    end

## Backends

The initial storage backend will be ActiveRecord with more to come.

* ActiveRecord
* [StatsD][] (future)
* [RRDTool][] (future)


[StatsD]: https://github.com/etsy/statsd
[RRDTool]: http://oss.oetiker.ch/rrdtool/
[GoogleCharts]: http://code.google.com/apis/chart/
