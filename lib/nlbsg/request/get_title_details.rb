module NLBSG
  class GetTitleDetailsRequest < RequestBase
    REQUIRED_REQUEST_FIELDS =
      [
        :BID,
        :ISBN
      ]

    def initialize(hash)
      raise ArgumentError unless hash.is_a?(Hash)

      @options = hash
    end

    def build
      super(prepare_query)
    end

    private

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
