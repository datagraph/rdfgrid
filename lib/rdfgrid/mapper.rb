module RDFgrid
  ##
  # @abstract
  class Mapper < Processor
    ##
    # @param  [Object] key
    # @param  [Object] value
    # @return [void]
    def call(key, value, &block)
      process(value, &block)
    end

    ##
    # @param  [Object] value
    # @return [void]
    # @abstract
    def process(value, &block)
      raise NotImplementedError
    end

    ##
    class LineMapper < Mapper
      ##
      # @param  [IO, File, #each_line]   input
      # @param  [Hash{Symbol => Object}] options
      # @return [void]
      def self.process(input, options = {}, &block)
        mapper = self.new(options)
        count  = 0
        input.each_line do |line|
          if block_given?
            mapper.call(count += 1, line, &block)
          else
            mapper.call(count += 1, line) do |key, value|
              puts [key, value].join(SEPARATOR)
            end
          end
        end
      end

      ##
      # @param  [String] line
      # @return [void]
      # @abstract
      def process(line, &block)
        super
      end
    end # class LineMapper

    ##
    class StatementMapper < Mapper
      ##
      # @param  [IO, File, #each_line]   input
      # @param  [Hash{Symbol => Object}] options
      # @return [void]
      def self.process(input, options = {}, &block)
        mapper = self.new(options)
        count  = 0
        RDF::NTriples::Reader.new(input) do |reader|
          reader.each_statement do |statement|
            if block_given?
              mapper.call(count += 1, statement, &block)
            else
              mapper.call(count += 1, statement) do |key, value|
                puts [key, value].join(SEPARATOR)
              end
            end
          end
        end
      end

      ##
      # @param  [RDF::Statement] statement
      # @return [void]
      # @abstract
      def process(statement, &block)
        super
      end
    end # class StatementMapper
  end # class Mapper
end # module RDFgrid
