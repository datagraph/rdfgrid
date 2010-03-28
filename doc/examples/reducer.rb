#!/usr/bin/ruby -Ilib
require 'rdfgrid'

class PredicateSummer < RDFgrid::Reducer
  def process(values)
    yield values.inject(0) { |sum, value| sum + value.to_i }
  end
end

PredicateSummer.process!
