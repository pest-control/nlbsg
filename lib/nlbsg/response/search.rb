module NLBSG
  class SearchResponse < ResponseBase

    def initialize(response)
      super(response.to_hash[:search_response])
    end

    def total_records
      @response[:total_records]
    end

    def next_record_position
      @response[:next_record_position]
    end

    def set_id
      @response[:set_id]
    end

    def titles
      wrap_in_array(@response.dig(:titles, :title))
    end

    def fetch_next_records
      p "TODO"
    end
  end
end
