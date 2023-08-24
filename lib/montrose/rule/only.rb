module Montrose
  module Rule
    class Only
      include Montrose::Rule

      def self.apply_options(opts)
        opts[:only]
      end

      # Initializes rule
      #
      # @param [Date] dates - array of date objects
      #
      def initialize(dates)
        @dates = dates
        @max = dates.length
        # @count = 0
      end

      def include?(time)
        !!@dates.include?(time.to_date)
      end

      # def advance!(time)
      #   continue?(time)
      # end

      def continue?(time)
        # @count <= @max && @dates.max >= time.to_date
        @dates.max >= time.to_date
      end
    end
  end
end
