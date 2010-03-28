module RDFgrid
  ##
  class Processor
    SEPARATOR = "\t"

    ##
    # @param  [Hash{Symbol => Object}] options
    # @return [void]
    def self.process!(options = {}, &block)
      process($stdin, options, &block)
    end

    ##
    # @param  [Hash{Symbol => Object}] options
    def initialize(options = {})
      @options = options
    end
  end # class Processor
end # module RDFgrid
