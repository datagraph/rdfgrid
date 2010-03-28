RDFgrid: Map/Reduce-based Linked Data Processing with Hadoop
============================================================

RDFgrid is a simple framework for [map/reduce][MapReduce]-based
batch-processing of [RDF][] data with [Hadoop][] and [Amazon Elastic
MapReduce][AWS EMR].

* <http://github.com/datagraph/rdfgrid>

Features
--------

* Processes RDF data in the line-oriented, whitespace-separated
  [N-Triples][] format.
* Provides RDF statement manipulation using [RDF.rb][]'s object model; no
  manual parsing or serialization involved.
* Provides built-in aggregate combiners/reducers for the common `sum`,
  `min`, `max`, and `avg` operations.
* Compatible with [Hadoop Streaming][HStreaming] and Amazon's [Elastic
  MapReduce][AWS EMR] service.
* Available as a prepackaged archive with all dependencies included,
  simplifying deployments using Hadoop's [distributed cache][HDCache].

Examples
--------

### A mapper for counting RDF predicate usage (`doc/examples/mapper.rb`)

    #!/usr/bin/ruby -Ilib
    require 'rdfgrid'

    class PredicateCounter < RDFgrid::Mapper::StatementMapper
      def process(statement)
        yield statement.predicate, 1
      end
    end

    PredicateCounter.process!

### A reducer for summing up RDF predicate usage (`doc/examples/reducer.rb`)

    #!/usr/bin/ruby -Ilib
    require 'rdfgrid'

    class PredicateSummer < RDFgrid::Reducer
      def process(values)
        yield values.inject(0) { |sum, value| sum + value.to_i }
      end
    end

    PredicateSummer.process!

### Running the mapper and reducer pipeline with a local N-Triples dataset

    $ cat data.nt | ruby mapper.rb | sort | ruby reducer.rb

Documentation
-------------

* {RDFgrid::Mapper}
* {RDFgrid::Reducer}

Dependencies
------------

* [RDF.rb](http://rubygems.org/gems/rdf) (>= 0.1.2)

Installation
------------

The recommended installation method is via RubyGems. To install the latest
official release, do:

    % [sudo] gem install rdfgrid

Download
--------

To get a local working copy of the development repository, do:

    % git clone git://github.com/datagraph/rdfgrid.git

Alternatively, you can download the latest development version as a tarball
as follows:

    % wget http://github.com/datagraph/rdfgrid/tarball/master

Mailing List
------------

* <http://groups.google.com/group/rdfgrid>

Resources
---------

* <http://rdfgrid.rubyforge.org/>
* <http://github.com/datagraph/rdfgrid>
* <http://rubygems.org/gems/rdfgrid>
* <http://rubyforge.org/projects/rdfgrid/>
* <http://raa.ruby-lang.org/project/rdfgrid/>
* <http://www.ohloh.net/p/rdfgrid>

Authors
-------

RDFgrid is a [Datagraph][] technology.

* [Arto Bendiken](mailto:arto.bendiken@gmail.com) - <http://ar.to/>

License
-------

RDFgrid is free and unencumbered public domain software. For more
information, see <http://unlicense.org/> or the accompanying UNLICENSE file.

[Datagraph]:  http://datagraph.org/
[RDF]:        http://www.w3.org/RDF/
[RDF.rb]:     http://rdf.rubyforge.org/
[MapReduce]:  http://en.wikipedia.org/wiki/MapReduce
[Hadoop]:     http://hadoop.apache.org/
[AWS EMR]:    http://aws.amazon.com/elasticmapreduce/
[N-Triples]:  http://blog.datagraph.org/2010/03/grepping-ntriples
[HStreaming]: http://hadoop.apache.org/common/docs/current/streaming.html
[HDCache]:    http://hadoop.apache.org/common/docs/current/mapred_tutorial.html#DistributedCache
