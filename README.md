RDFgrid: Map/Reduce-based Linked Data Processing with Hadoop
============================================================

RDFgrid is a framework for [map/reduce][MapReduce]-based batch-processing of
[RDF][] data with [Hadoop][] and [Amazon Elastic MapReduce][AWS EMR].

* <http://github.com/datagraph/rdfgrid>

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

Author
------

* [Arto Bendiken](mailto:arto.bendiken@gmail.com) - <http://ar.to/>

License
-------

RDFgrid is free and unencumbered public domain software. For more
information, see <http://unlicense.org/> or the accompanying UNLICENSE file.

[RDF]:       http://www.w3.org/RDF/
[RDF.rb]:    http://rdf.rubyforge.org/
[MapReduce]: http://en.wikipedia.org/wiki/MapReduce
[Hadoop]:    http://hadoop.apache.org/
[AWS EMR]:   http://aws.amazon.com/elasticmapreduce/
