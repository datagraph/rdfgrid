require 'rdf'
require 'rdf/ntriples'
require 'rdf/nquads'

module RDFgrid
  autoload :Processor, 'rdfgrid/processor'
  autoload :Mapper,    'rdfgrid/mapper'
  autoload :Reducer,   'rdfgrid/reducer'
  autoload :VERSION,   'rdfgrid/version'
end
