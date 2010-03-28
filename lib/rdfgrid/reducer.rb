module RDFgrid
  ##
  # @abstract
  class Reducer < Processor
    ##
    # @param  [IO, File, #each_line]   input
    # @param  [Hash{Symbol => Object}] options
    # @return [void]
    def self.process(input, options = {}, &block)
      reducer = self.new(options)
      values  = {}
      input.each_line do |line|
        key, value = line.chomp.split(SEPARATOR)
        (values[key] ||= []) << value
      end
      values.sort.each do |key, values|
        if block_given?
          reducer.call(key, values, &block)
        else
          reducer.call(key, values) do |key, value|
            puts [key, value].join(SEPARATOR)
          end
        end
      end
    end

    ##
    # @param  [Object]             key
    # @param  [Enumerable<Object>] values
    # @return [void]
    def call(key, values, &block)
      process(values) do |value|
        block.call(key, value)
      end
    end

    ##
    # @param  [Enumerable<Object>] values
    # @abstract
    # @return [void]
    def process(values, &block)
      raise NotImplementedError
    end

    ##
    # @return [Proc]
    def parser
      @options[:parser] ||= lambda { |value| value.to_i }
    end

    ##
    class SumReducer < Reducer
      def process(values)
        yield values.inject(0) { |sum, value| sum + parser.call(value) }
      end
    end

    ##
    class MaxReducer < Reducer
      def process(values)
        yield values.map(&parser).max
      end
    end

    ##
    class MinReducer < Reducer
      def process(values)
        yield values.map(&parser).min
      end
    end

    ##
    class AvgReducer < Reducer
      def process(values)
        yield values.inject(0) { |sum, value| sum + parser.call(value) } / values.size
      end
    end
  end # class Reducer
end # module RDFgrid
