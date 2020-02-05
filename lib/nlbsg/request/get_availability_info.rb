module NLBSG
  class GetAvailabilityInfoRequest < RequestBase
    REQUIRED_REQUEST_FIELDS =
      [
        :BID,
        :ISBN
      ]

    MODIFIERS =
      [
        :sort_schema,
        :start_record_position,
        :maximum_records,
        :set_id
      ]

    def initialize(hash)
      raise ArgumentError unless hash.is_a?(Hash)

      @options = hash
    end

    def build
      query = prepare_query.merge(modifiers: prepare_modifiers)

      super(query)
    end

    private

      def prepare_modifiers
        keys = options.keys & MODIFIERS

        modifiers = {}

        keys.each do |key|
          modifiers[key] = options[key]
        end

        modifiers
      end

      def prepare_query
        if (options.keys & REQUIRED_REQUEST_FIELDS).empty?
          raise ArgumentError
        end

        keys = options.keys & REQUIRED_REQUEST_FIELDS

        query = {}

        keys.each do |key|
          query[key] = options[key]
        end

        query
      end
  end
end
