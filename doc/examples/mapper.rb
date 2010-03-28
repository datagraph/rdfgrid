#!/usr/bin/ruby -Ilib
require 'rdfgrid'

class PredicateCounter < RDFgrid::Mapper::StatementMapper
  def process(statement)
    yield statement.predicate, 1
  end
end

PredicateCounter.process!
