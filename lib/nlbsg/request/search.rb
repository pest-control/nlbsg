module NLBSG
  class SearchRequest < RequestBase
    REQUIRED_SEARCH_FIELDS =
      [
        :keywords,
        :author,
        :subject,
        :title
      ]

    OPTIONAL_SEARCH_FIELDS =
      [
        :branch_ID,
        :media_code,
        :language
      ]

    ALL_SEARCH_FIELDS = REQUIRED_SEARCH_FIELDS + OPTIONAL_SEARCH_FIELDS

    MODIFIERS =
      [
        :sort_schema,
        :start_record_position,
        :maximum_records,
        :set_id
      ]

    def initialize(string_or_hash)
      if string_or_hash.is_a?(String)
        @options = { keywords: string_or_hash }
      elsif string_or_hash.is_a?(Hash)
        @options = string_or_hash
      else
        raise ArgumentError
      end
    end

    def build
      search_items = prepare_search_items
      modifiers = prepare_modifiers
      query = prepare_query(search_items, modifiers)

      super(query)
    end

    private

      def prepare_search_items
        if (options.keys & REQUIRED_SEARCH_FIELDS).empty?
          raise ArgumentError
        end

        keys = options.keys & ALL_SEARCH_FIELDS

        search_items = []

        keys.each do |key|
          search_items << add_search_item(field: key, terms: options[key])
        end

        search_items
      end

      def prepare_modifiers
        keys = options.keys & MODIFIERS

        modifiers = {}

        keys.each do |key|
          modifiers[key] = options[key]
        end

        modifiers
      end

      def prepare_query(search_items, modifiers)
        {
          search_items:
            {
              search_item: search_items
            },
          modifiers: modifiers
        }
      end

      def add_search_item(field:, terms:)
        {
          search_field: field.to_s.split('_').collect(&:capitalize).join,
          search_terms: terms
        }
      end
  end
end
